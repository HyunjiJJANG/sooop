package kr.co.jhta.soop.control;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.MemberProjectMemberDTO;
import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;
import kr.co.jhta.soop.service.MemberProjectMemberService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectMemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MemberProjectMemberController {
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	MemberProjectMemberService memberProjectMemberService;
	
	
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;

	
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProjectService projectService;

//	@GetMapping("/contact")
//	public String myContactList(@RequestParam("email")String email, @RequestParam("member_no")int member_no, Model model) {
//		
//		MemberProjectMemberDTO memberProjectMemberdto =  memberProjectMemberService.selectOne(member_no);
//		memberProjectMemberdto.setMember_no(member_no);
//		model.addAttribute("list", memberProjectMemberService.selectAll(memberProjectMemberdto));
//		return "contact";
//	}
	
	
	//나와 같은 프로젝트 구성원 출력하기
		@GetMapping("/contact")
		public String myContactList(@RequestParam("email")String email, @RequestParam("member_no")int member_no, @RequestParam("project_no")int project_no, Model model) {
			
			MemberProjectMemberDTO memberProjectMemberdto =  memberProjectMemberService.selectOne(member_no);
			memberProjectMemberdto.setMember_no(member_no);
			memberProjectMemberdto.setProject_no(project_no);
			 
			model.addAttribute("list", memberProjectMemberService.selectAll(memberProjectMemberdto));
			log.info(""+memberProjectMemberService.selectAll(memberProjectMemberdto));
			model.addAttribute("member_no", member_no);
			model.addAttribute("project_no", project_no);
			model.addAttribute("email", email);
			model.addAttribute("pno", project_no);
			model.addAttribute("mno", member_no);
			
			
			// 피드 페이지 상단에 프로젝트 제목 보여주기
			model.addAttribute("projectDTO", projectService.selectOne(project_no));

			
			
			
			// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
			model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));

			
			
			
			//네비바를 위한 memberDTO
			model.addAttribute("memberDTO", memberService.selectOne(member_no));
			
			
			return "contact";
		}
		
		
	// 구성원 찾기를 위한 리스트
		@GetMapping("/getSearchList")
		@ResponseBody
		public List<MemberProjectMemberDTO> getSearchList(@RequestParam("searchName")String search_name,@RequestParam("member_no")int member_no,@RequestParam("project_no")int project_no, Model model){
		log.info("서치네임 키업 이벤트 발생 후 컨트롤러 찾아옴");
		log.info("member_no : "+ member_no);
		
		MemberProjectMemberDTO memberProjectMemberdto = new MemberProjectMemberDTO();
		
		memberProjectMemberdto.setSearch_name(search_name);
		memberProjectMemberdto.setMember_no(member_no);
		memberProjectMemberdto.setProject_no(project_no);
		return memberProjectMemberService.getSearchList(memberProjectMemberdto);
		  
		}
		
		//나와 같은 프로젝트 구성원 전체 출력하기 
		@GetMapping(value="/allContactList/{member_no}", produces= MediaType.APPLICATION_JSON_VALUE)
		public List<MemberProjectMemberDTO> allContactList(@PathVariable("member_no") int member_no) {
			
			MemberProjectMemberDTO memberProjectMemberdto = memberProjectMemberService.selectOne(member_no);
			
			List<MemberProjectMemberDTO> list  = memberProjectMemberService.selectProjectAll(memberProjectMemberdto);
			
			return list ;
		}
	
	
	
	
	
	
	
	
	
	
	// 프로젝트에 새 멤버 추가시 중복멤버인지 체크
	@GetMapping("/emailCheck2")
	public @ResponseBody List<Integer> emailCheck2(@RequestParam("email")String email) {
		// 해당 이메일이 포함되어있는 모든 프로젝트 번호 list에 담기
		List<Integer> list = memberProjectMemberService.selectAllProjectByEmail(email); // ajax로 넘어온 email
		return list;
	}

	
	
}
