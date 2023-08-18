package kr.co.jhta.soop.control;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.jhta.soop.dto.MemberDTO;
import kr.co.jhta.soop.dto.ProjectInvitationDTO;
import kr.co.jhta.soop.dto.ProjectMemberDTO;
import kr.co.jhta.soop.service.FeedService;
import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.MemoService;
import kr.co.jhta.soop.service.ProjectInvitationService;
import kr.co.jhta.soop.service.ProjectMemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.TaskMemberFileService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	ProjectInvitationService projectInvitationService;

	@Autowired
	ProjectMemberService projectMemberService;

	@Autowired
	JavaMailSender javaMailSender;
	
	
	@Autowired
	MemoService memoService;

	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	FeedService feedService;
	
	@Autowired
	TaskMemberFileService taskMemberFileService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	FeedTaskService feedTaskService;

	// http://localhost:8081/inviteMember/key=aaaaaaaaa
	// test
	@GetMapping("/inviteMember")
	@ResponseBody
	public String test() {

		return "TESTOK";
	}

	// 커스텀 로그인
	@GetMapping("/")
	public String login() {

		return "login";
	}

	// 이메일 인증 코드 일치 여부 확인

	// 로그인 후 출력되는 index
	@GetMapping("/home")
	public String loginOk(Model model, Authentication auth, RedirectAttributes redirectAttributes, HttpSession httpSession) {
		
		String Oauth2email = (String) httpSession.getAttribute("email");
		
		if(Oauth2email != null) {
			
			MemberDTO memberDto = memberService.selectMemberByEmail(Oauth2email);
			
			model.addAttribute("memberDTO", memberDto);
			
			int member_no = memberDto.getMember_no();
			httpSession.setAttribute("member_no", member_no);
			model.addAttribute("member_no", memberDto.getMember_no());
			model.addAttribute("taskList", feedTaskService.selectAllTaskListByMno(member_no));
			model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
			model.addAttribute("memoDTO", memoService.selectOne(member_no));
			model.addAttribute("fileList", taskMemberFileService.selectAllProjectFile(member_no));
			return "home";
			
			
		}else {
		log.info("auth : " + auth);
		String email = auth.getName();
		MemberDTO memberDto = memberService.selectMemberByEmail(email);
		int member_no = memberDto.getMember_no();
		log.info("auth email : " + email);
		log.info("memberDto 이메일:" + memberDto.getEmail());
		log.info("memberDto:이름 " + memberDto.getName());
		
		
		model.addAttribute("member_no", memberDto.getMember_no());
		
		log.info("member_no" + memberDto.getMember_no());
		
		model.addAttribute("memberDTO", memberService.selectOne(member_no));
		model.addAttribute("taskList", feedTaskService.selectAllTaskListByMno(member_no));
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		model.addAttribute("memoDTO", memoService.selectOne(member_no));
		model.addAttribute("fileList", taskMemberFileService.selectAllProjectFile(member_no));
		return "home";
		}
		

	}

	// 소셜 로그인 후 출력되는 index mapping
	@GetMapping("/Oauth2Home")
	public String loginOk(Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) {
		String email = (String) httpSession.getAttribute("email");
		// 이메일 값 사용
		log.info("세션에 담긴 이메일: " + email);
		MemberDTO memberDto = memberService.selectMemberByEmail(email);
		model.addAttribute("memberDTO", memberDto);
		
		int member_no = memberDto.getMember_no();
		httpSession.setAttribute("member_no", member_no);
		model.addAttribute("member_no", memberDto.getMember_no());
		model.addAttribute("taskList", feedTaskService.selectAllTaskListByMno(member_no));
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		model.addAttribute("memoDTO", memoService.selectOne(member_no));
		model.addAttribute("fileList", taskMemberFileService.selectAllProjectFile(member_no));
		
		// String message = (String) httpSession.getAttribute("signupMessage");
		// log.info("message : " + message );
		// model.addAttribute("message", message);
		// redirectAttributes.addFlashAttribute("message", message); // 리다이렉트 전에 안내 문구를
		// 전달
		return "home";
	}

	// 비밀번호 찾기 폼으로 이동
	@GetMapping("/searchPassword")
	public String searchPassword() {

		return "serachPassword";
	}

	// 비밀번호 찾기 이메일 인증 완료 후 비밀번호 변경 폼으로 이동
	@RequestMapping("/searchPasswordOk")
	public String searchPasswordOk(@RequestParam("email") String email, Model model,
			@RequestParam("authCode") String authCode, HttpSession session, RedirectAttributes redirectAttributes) {

		log.info("비밀번호 찾기 후 이메일 인증 하고 넘어온 회원의 이메일 : " + email);

		String result = "";
		// 소셜 로그인 회원 비밀번호 찾기 막기 위한 코드
		MemberDTO memberdto = memberService.selectMemberByEmail(email);
		

		if (memberdto == null) {
			String message = "SOOP 회원가입이 되어있지 않습니다. 회원가입 후 서비스 이용이 가능합니다.";
			redirectAttributes.addFlashAttribute("message", message);
			return "redirect:/";
		} else {
			int enabled = memberdto.getEnabled();
			if (enabled == 2) {
				redirectAttributes.addFlashAttribute("message", "소셜 로그인 회원입니다. 비밀번호 찾기가 불가능합니다."); // 리다이렉트 전에 안내 문구를 전달
				return "redirect:/";

			} else {

				if (email == null || authCode == null) {
					redirectAttributes.addFlashAttribute("message", "이메일 또는 이메일 인증 코드가 입력되지 않았습니다.");
					return "redirect:/";

				} else if (email != null && authCode != null) {

					Object obj = session.getAttribute("key");
					if (obj != null) {
						String key = (String) obj;
						log.info("비밀번호 찾기 후 넘어온 key : " + key);

						if (authCode.equals(key)) {
							// 이메일로 멤버 정보 가져와서 memberDto에 저장하기
							MemberDTO memberDto = memberService.selectMemberByEmail(email);
							model.addAttribute("memberDto", memberDto);

							result = "searchPasswordOk";

						} else {

							return "redirect:/";

						}

					} else {
						return "redirect:/";

					}

				}
				return result;

			}
		}
	}

	// 비밀번호 변경 완료 후 login페이지로 리다이렉트 시키기
	@RequestMapping("/passwordChange")
	public String passwordChange(@ModelAttribute MemberDTO memberDto, @RequestParam("password") String password,
			RedirectAttributes redirectAttributes) {

		memberDto.setPassword(passwordEncoder.encode(password));
		memberService.updateOne(memberDto);
		redirectAttributes.addFlashAttribute("message", "비밀번호 변경이 완료되었습니다.");
		return "redirect:/";
	}

	// 커스텀 로그아웃
	@GetMapping("/logout")
	public String logout() {

		return "/";
	}

	// 회원가입
	@GetMapping("/register")
	public String registerForm() {

		return "register";
	}

	// 회원가입 완료
	@RequestMapping("/registerOk")
	public String registerOk(Model model, HttpServletRequest req, @ModelAttribute MemberDTO memberDto,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("name") String name, RedirectAttributes redirectAttributes) {

		memberService.insertRole(email);
		memberDto.setPassword(passwordEncoder.encode(password));
		memberService.insertOne(memberDto);

		
		ProjectInvitationDTO projectInvitationdto = projectInvitationService.selectOneByEmail(email);
		log.info("회원 가입후 넘어온 프로젝트 초대 dto : "+projectInvitationdto);
		if (projectInvitationdto != null) {

			MemberDTO memberdto = memberService.selectMemberByEmail(email);

			int member_no = memberdto.getMember_no();
			int project_no = projectInvitationdto.getProject_no();
			int member_position = 1;

			ProjectMemberDTO projectMemberdto = new ProjectMemberDTO();
			projectMemberdto.setMember_no(member_no);
			projectMemberdto.setMember_position(member_position);
			projectMemberdto.setProject_no(project_no);

			projectMemberService.insertOne(projectMemberdto);

		}
		redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다. 감사합니다.");
		return "redirect:/";
	}

	// 회원 가입시 이메일 중복체크를 위한 mapping
	@GetMapping("/emailCheck")
	public @ResponseBody String emailCheck(@RequestParam("email") String email) {

		log.info("ajax로 넘어온 email : " + email);

		String result = memberService.selectOneByEmail(email);
		log.info("db에서 넘어온 result 메세지 : " + result);

		return result;

	}

	// 이메일 인증 코드 일치 여부를 위한 mapping
	@GetMapping("/mailCheck")
	@ResponseBody
	public String SendMail(@RequestParam("email") String email, HttpSession session) throws MessagingException {
		log.info("이메일 인증번호 버튼 눌르고 오는 email " + email);

		Random random = new Random();
		String key = "";

		// SimpleMailMessage message = new SimpleMailMessage();
		// 입력 키를 위한 코드
		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
		key += numIndex;

		// message.setSubject("[SOOP]이메일 계정을 인증해주세요");
		// message.setText("안녕하세요.\n 이메일 계정을 인증받으시려면 아래 인증 번호를 확인해주세요. \n 인증 번호 : " +
		// key);
		// javaMailSender.send(message);

		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		// helper.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소

		String subject = "[SOOP] 이메일 계정을 인증해주세요";
		String content = "<div style=\"border: 2px solid #7EAA92; border-radius: 10px; background-color: #ffffff;\">\n"
				+ "<div class=\"mail_view_contents\">\n"
				+ "<div class=\"mail_view_contents_inner\" data-translate-body-15340=\"\">\n" + "<div>\n" + "\n"
				+ "<!--  -->\n" + "\n"
				+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"background-color: #ffffff;\" bgcolor=\"#ffffff\">\n"
				+ "  <tbody><tr><td>\n"
				+ "      <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"640\" style=\"border-top: 70px solid #ffffff; border-left: 10px solid #ffffff; border-right: 10px solid #ffffff; margin: 0 auto; height: 100%; background: #ffffff; width: 640px !important;\" height=\"100%\">\n"
				+ "        <tbody><tr><td width=\"15\"></td><td>\n" + "            <!-- contents -->\n"
				+ "            <table align=\"left\" width=\"590\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 590px !important;\">\n"
				+ "              <tbody><tr><td height=\"30\" colspan=\"3\"></td></tr>\n"
				+ "              <tr><td width=\"25\"></td><td align=\"left\" valign=\"top\">\n"
				+ "                </td><td width=\"25\"></td></tr>\n"
				+ "              <tr><td height=\"22\" colspan=\"3\"></td></tr>\n"
				+ "              <tr><td width=\"25\"></td><td align=\"left\" style=\"display: block; padding: 0; color: #3a3a3a; font-size: 32px; font-style: normal; font-weight: 500; letter-spacing: -0.76px; line-height: 120%;\">\n"
				+ "                  <strong style=\"color: #368fff;\">이메일 인증</strong>을 해주세요.\n"
				+ "                </td><td width=\"25\"></td></tr>\n"
				+ "              <tr><td height=\"22\" colspan=\"3\"></td></tr>\n"
				+ "              <tr><td width=\"25\"></td><td align=\"left\" style=\"color: #3a3a3a; font-size: 16px; line-height: 150%;\">\n"
				+ "                  안녕하세요. SOOP입니다.<br>\n"
				+ "                  이메일 계정을 인증받으시려면 인증 번호를 확인해주세요. <br/><strong style=\"color: #00A558;\">인증번호 : "
				+ key + "</strong><br>\n" + "                  <div style=\"margin:20px 0 20px 0;\">\n"
				+ "                  </div>\n" + "                  고맙습니다.\n"
				+ "                </td><td width=\"25\"></td></tr>\n"
				+ "              <tr><td height=\"40\" colspan=\"3\"></td></tr>\n" + "            </tbody></table>\n"
				+ "            <!-- //contents -->\n" + "          </td><td width=\"15\"></td></tr>\n"
				+ "        <tr><td height=\"15\" colspan=\"3\"></td></tr>\n" + "      </tbody></table>\n"
				+ "    </td></tr>\n" + "</tbody></table>\n"
				+ "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"background-color: #ffffff;\" bgcolor=\"#ffffff\">\n"
				+ "  <tbody><tr><td>\n"
				+ "      <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0 auto; width: 640px !important;\" width=\"640\">\n"
				+ "  <tbody><tr><td height=\"30\"></td></tr>\n"
				+ "  <tr><td align=\"center\" style=\"color: #969696; letter-spacing: -0.3px; font-size: 12px; line-height: 180%;\">\n"
				+ "      본 메일은 발신전용 메일이므로 회신이 되지 않습니다. 문의사항은 SOOP 고객센터를 이용해주세요.<br>\n" + "      <br><br>\n"
				+ "      (주)SOOP ㅣ 대표 중앙HTA ㅣ 사업자등록번호 104-81-59383<br>  서울특별시 종로구 율곡로10길 105 디아망 4F(봉익동 10-1 디아망 4F)<br>\n"
				+ "     COPYRIGHT(C) HTA CO., LTD. ALL RIGHTS RESERVED.\n" + "    </td></tr>\n"
				+ "  <tr><td height=\"30\"></td></tr>\n" + "</tbody></table>\n" + "\n" + "    </td></tr>\n"
				+ "</tbody></table>\n" + "\n" + "\n" + "\n" + "</div></div></div>\n" + "</div>";
		try {
			// helper.setFrom("보내는사람 이름 <보내는사람 이메일 주소>");
			helper.setFrom("SOOP 고객센터 <ssomy7529@gmail.com>");
			helper.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
			helper.setSubject(subject);
			helper.setText(content, true); // 두 번째 인자에 true를 주면 HTML 형식으로 메일을 보낼 수 있습니다.

			javaMailSender.send(message);
		} catch (MessagingException e) {
			// 예외 처리
		}

		log.info("key : " + key);

		session.setAttribute("key", key);
		return key;
	}

	//이메일 인증 코드 일치 여부 확인
	@GetMapping("/emailCheckOk")
	@ResponseBody
	public String emailCheckOk(@RequestParam("authCode") String authCode, HttpSession session) {
		String result = "";
		Object obj = session.getAttribute("key");
		if (obj != null) {
			String key = (String) obj;
			log.info("인증 버튼을 누른 후 컨트롤러로 넘어온 key : " + key);

			if (authCode.equals(key)) {
				result = "OK";
			}
			return result;

		} else {
			result = "False";
			return result;
		}

	}

}
