package kr.co.jhta.soop.control;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.jhta.soop.dao.SignDAO;
import kr.co.jhta.soop.dto.AttachedFileDTO;

import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;
import kr.co.jhta.soop.dto.SignDTO;
import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskDTO;
import kr.co.jhta.soop.service.AttachedFileService;
import kr.co.jhta.soop.service.MemberProjectProjectmemberService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.SignService;
import kr.co.jhta.soop.service.SignTaskAttachedFileService;
import kr.co.jhta.soop.service.TaskAttachedFileService;
import kr.co.jhta.soop.service.TaskService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
/* @RequestMapping("/soop") */ // => 이거 없애야됨
public class TaskController {

//	@Autowired
//	FileValidator fileValidator;

	@Autowired
	TaskService taskService;

	@Autowired
	AttachedFileService attachedfileService;

	@Autowired
	TaskAttachedFileService taskAttachedFileService;

	@Autowired
	SignTaskAttachedFileService signTaskAttachedFileService;

	@Autowired
	MemberService memberService;
//	
	@Autowired
	MemberProjectProjectmemberService memberProjectProjectmemberService;

	@Autowired
	SignService signservice;

	@RequestMapping("/task")
	public String register(Model model) {

		// model.addAttribute("list", taskService.selectAll()); // task.jsp의 c:foreach
		// list에 넘겨줌

		// JOIN한 service로 교체
		// model.addAttribute("list", taskAttachedFileService.selectAll()); // task.jsp의
		// c:foreach list에 넘겨줌

		// 이제 SIGN까지 조인한 SERVICE로 교체
		model.addAttribute("list", signTaskAttachedFileService.selectAll());

		// 임의로 project_no 1로 설정하기 => 로그인 후에 수정
		int project_no = 1;

		// 생성 모달에 값을 넘기기 위한 => members로 생성 모달에 project_no와 member_no를 함께 띄움
		List<MemberProjectProjectmemberDTO> members = memberProjectProjectmemberService
				.selectAllbyprojectno(project_no);
		model.addAttribute("members", members);
		// => feed에 members 부분을 사용함
		
		
		return "task";
	}

//	@Transactional
	@RequestMapping("/insert")
	public String insert(/* @ModelAttribute TaskDTO Taskdto, */
			@RequestParam("project_no") String project_no, @RequestParam("member_no") String member_no, // feed에서 받아오기
			@ModelAttribute SignTaskAttachedFileDTO SignTaskAttachedFiledto,
			@RequestParam(name="task_status", required = false) String task_status,
			// projectno, memberno를 숫자로 전달하기 위해.. (링크로 주니까 자꾸 문자로 받음)
//		    @RequestParam("project_no") String project_no,
//		    @RequestParam("member_no") String member_no,
			@RequestParam(name = "file", required = false) MultipartFile file, // file이라는 이름의 파라미터값을 가져와서 MultipartFile
																				// 형식의 file로 받기
																				// required = false :: 필수가 아님 (없어도 데이터
																				// 들어가게)
			Model model, @ModelAttribute AttachedFileDTO Filedto, @ModelAttribute UploadFile uploadfile, // task.jsp의 업무
																											// 생성 모달 폼에서
																											// uploadfile
																											// 받아오기
			BindingResult result, // 유효성 검사를 위한
			HttpServletRequest req, // 파일 경로를 위한
			@RequestParam(name = "sign_member_no", required = false) String sign_member_no,
			@RequestParam(name = "sign_approver", required = false) String sign_approver, // required=true 반드시 요청에 포함되도록
			@RequestParam(name = "sign_step", required = false) int sign_step,
			RedirectAttributes redirectAttributes) throws UnsupportedEncodingException {

		// ** task 생성(insert) **
		/*
		 * if (task_status == null) { String message = "업무 상태를 선택해주세요.";
		 * redirectAttributes.addFlashAttribute("message", message); return
		 * "redirect:/"; } else {
		 */
			int taskstatus = Integer.parseInt(task_status);
			int projectno = Integer.parseInt(project_no);
			int memberno = Integer.parseInt(member_no);
			
			log.info("taskstatus : " + taskstatus);
			log.info("projectno : " + projectno);
			log.info("memberno : " + memberno);
			
			SignTaskAttachedFiledto.setTask_status(taskstatus); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
			//SignTaskAttachedFiledto.setProject_no(projectno); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
			//SignTaskAttachedFiledto.setMember_no(memberno); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
			// taskService.insertOne(Taskdto);
			signTaskAttachedFileService.insertTask(SignTaskAttachedFiledto);
			
			
			// ** 결재 라인 **
			/*
			 * if (sign_member_no == null || sign_approver == null || sign_step == 0 ) {
			 * String message = "결재자를 선택해주세요.";
			 * redirectAttributes.addFlashAttribute("message", message); return
			 * "redirect:/"; } else {
			 */
				
				log.info("" + sign_member_no);
				log.info("" + sign_approver);
				log.info("" + sign_step);
				
				// 결재 라인에 데이터 넣기
				int signMemberNo = Integer.parseInt(sign_member_no);
//			    SignDTO signdto = new SignDTO();
//			    signdto.setSign_member_no(signMemberNo);
//			    signdto.setSign_approver(sign_approver);
//			    signdto.setSign_step(sign_step);
//			    signdto.setSign_status(0); // 일단 0으로 설정
//				
//			    signservice.insertOne(signdto); // => 이걸 살리면 첨부파일이 추가가 안되고..... 이걸 죽이면 그때 첨부파일이 추가됨 왜지?
				
				SignTaskAttachedFiledto.setSign_member_no(signMemberNo);
				SignTaskAttachedFiledto.setSign_approver(sign_approver);
				SignTaskAttachedFiledto.setSign_step(sign_step);
				SignTaskAttachedFiledto.setSign_status(1);
				
				signTaskAttachedFileService.insertSign(SignTaskAttachedFiledto);
				
				/*
				 * } }
				 */
		

		// 확인용
//	    List<TaskAttachedFileDTO> taskList = taskAttachedFileService.selectAll(); // 데이터 가져오기
//	    model.addAttribute("list", taskList);
//	    log.info("Number of tasks in the list: " + taskList.size()); // 로그로 출력

		// ** 파일 첨부 **

		// 파일은 어디에 저장 /data <== (현재 임시 파일은 properties에 c:\\temp\\data 로 지정됨)
		// 서버에 저장할 실제 디렉토리 경로 구하기
		HttpSession session = req.getSession(); // http 객체 얻어오기
		ServletContext application = session.getServletContext(); // session으로부터 servlet context 얻어오기

		String filePath = application.getRealPath("/data"); // 데이터의 실제 경로
		log.info("파일이 저장될 실제 경로 : {} " + filePath); // 해당 경로로 탐색기에서 테스트 했을 때, data 폴더에 밀어넣은 이미지 나옴

		// 파일명 받아서 Filedto에 저장
		log.info("파일명 : {} ", file.getOriginalFilename()); // 파일명 받기 (=> 경로는 설정 파일에서 저장)
		// Filedto.setFile_name(file.getOriginalFilename());
		SignTaskAttachedFiledto.setFile_name(file.getOriginalFilename());

		try {
			// 파일 객체로 만들기 => 파일 경로에 / 와 파일 이름을 붙여서 객체로 만듦
			// 저장될 경로 + "/" + 파일명
			File f = new File(filePath + "/" + file.getOriginalFilename());
			// 임시 경로에 보관 중인 파일을 실제 위치에 저장
			file.transferTo(f);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 파일 타입 받아서 Filedto에 저장
		log.info("파일 타입 : {} ", file.getContentType());
		// Filedto.setFile_type(file.getContentType());
		SignTaskAttachedFiledto.setFile_type(file.getContentType());

		// 오늘 날짜 담아서 Filedto에 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 현재날짜를받아옴
		Date date = new Date();
		String fileDate = sdf.format(date);
		log.info("파일 날짜 : {} ", fileDate);
		// Filedto.setFile_register_date(fileDate);
		SignTaskAttachedFiledto.setFile_register_date(fileDate);

		// 파일 경로 받아서 Filedto에 저장
		// Filedto.setFile_path(filePath + "\\" + file.getOriginalFilename());)
		SignTaskAttachedFiledto.setFile_path(filePath + "\\" + file.getOriginalFilename());

		// attachedfileService.insertOne(Filedto);
		signTaskAttachedFileService.insertAttachedFile(SignTaskAttachedFiledto);

		/* return "redirect:/soop/task"; */ // 새로고침을 위한 URL로 리다이렉트
		return "redirect:feed?project_no="+project_no+"&member_no="+member_no; // 새로고침을 위한 URL로 리다이렉트
	}

	@GetMapping("/update") // 띄우기
	public String update(@RequestParam("task_no") int task_no, Model model, @RequestParam("file_no") int file_no,
			@ModelAttribute AttachedFileDTO filedto, @ModelAttribute SignTaskAttachedFileDTO SignTaskAttachedFiledto) {

//			TaskDTO taskDTO = taskService.selectOne(task_no);
//			model.addAttribute("dtoTask", taskDTO);
//
//			AttachedFileDTO attachedFileDTO = attachedfileService.selectOne(file_no);
//			model.addAttribute("dtoAttachedFile", attachedFileDTO);

		SignTaskAttachedFileDTO signTaskAttachedFiledto = signTaskAttachedFileService.selectOne(task_no);
		model.addAttribute("dtoSignTaskAttachedFile", signTaskAttachedFiledto);

		// 임의로 project_no 1로 설정하기 => 로그인 후에 수정
		int project_no = 1;
		// 수정 모달에 값을 넘기기 위한
		List<MemberProjectProjectmemberDTO> members = memberProjectProjectmemberService
				.selectAllbyprojectno(project_no);
		model.addAttribute("members", members);

		return "/update";
	}

	@PostMapping("/update")
	public String updateOk(@ModelAttribute TaskDTO taskdto, @ModelAttribute AttachedFileDTO filedto,
			@ModelAttribute SignTaskAttachedFileDTO SignTaskAttachedFiledto,
			@RequestParam("task_status") int task_status, Model model, HttpServletRequest req,
			@RequestParam(name = "file", required = false) MultipartFile file, @ModelAttribute UploadFile uploadfile,
			@RequestParam(name = "sign_member_no_up", required = false) int sign_member_no,
			@RequestParam(name = "sign_approver_up", required=false) String sign_approver, // required=true 반드시 요청에 포함되도록
			@RequestParam(name="sign_step_up", required=false)int sign_step,
			@RequestParam(name="task_no")int task_no,
			@RequestParam(name="project_no")int project_no,
			@RequestParam(name="member_no")int member_no
			
	) {

		// ** task 수정 (update) **
		
//		int taskstatus = Integer.parseInt(task_status);
//		SignTaskAttachedFiledto.setTask_status(taskstatus); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅

//		SignTaskAttachedFiledto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
//		signTaskAttachedFileService.updateTask(SignTaskAttachedFiledto);
		
		taskdto.setTask_status(task_status); // 파라미터로 넘겨온 task_status 값을 dto에 셋팅
		taskService.updateOne(taskdto);

		
		
		// ** 결재라인 수정 (update) **
		
		log.info("sign_member_no : "+sign_member_no);
		log.info("sign_approver : "+sign_approver);
		log.info("sign_step : "+sign_step);
		
//	    int signMemberNo = Integer.parseInt(sign_member_no);
	    
		// signtaskattachedfiledto의 sign_member_no의 값을 받아서 task.jsp의 수정 모달에 넘겨주기 위해(default값 설정)
//		model.addAttribute("currentUserSignMemberNo", SignTaskAttachedFiledto.getSign_member_no());
//		model.addAttribute("currentUserSignApprover", SignTaskAttachedFiledto.getSign_approver());
//		model.addAttribute("currentUserSignStep", SignTaskAttachedFiledto.getSign_step());
//		model.addAttribute("SignTaskAttachedFiledto", SignTaskAttachedFiledto);
//		
	    SignTaskAttachedFiledto.setSign_member_no(sign_member_no);
	    SignTaskAttachedFiledto.setSign_approver(sign_approver);
	    SignTaskAttachedFiledto.setSign_step(sign_step);
	    SignTaskAttachedFiledto.setSign_status(1);
	    
		log.info("찍기 : " + SignTaskAttachedFiledto.getSign_approver());
		
		signTaskAttachedFileService.updateSign(SignTaskAttachedFiledto);
		
		
		
		// ** 첨부파일 수정 (update) **
		
		// 파일은 어디에 저장  /data <== (현재 임시 파일은 properties에 c:\\temp\\data 로 지정됨)
				// 서버에 저장할 실제 디렉토리 경로 구하기
				HttpSession session = req.getSession(); // http 객체 얻어오기
				ServletContext application = session.getServletContext(); // session으로부터 servlet context 얻어오기
				
				String filePath = application.getRealPath("/data"); // 데이터의 실제 경로
				log.info("파일이 저장될 실제 경로 : {} " + filePath); // 해당 경로로 탐색기에서 테스트 했을 때, data 폴더에 밀어넣은 이미지 나옴
				
				// 매개변수로 전달 받은 파일 객체
				/*
				 * log.info(("file : {} " + file)); log.info(("file.getFile() : {} " +
				 * file.getOriginalFilename()));
				 */
				
				
				// 파일명 받아서 Filedto에 저장
				log.info("파일명 : {} ",  file.getOriginalFilename()); // 파일명 받기 (=> 경로는 설정 파일에서 저장)
				filedto.setFile_name(file.getOriginalFilename());
				
				// 파일 객체로 만들기 => 파일 경로에 / 와 파일 이름을 붙여서 객체로 만듦
				// 저장될 경로 + "/" + 파일명
				File f = new File(filePath + "/" + file.getOriginalFilename()); 
				// 임시 경로에 보관 중인 파일을 실제 위치에 저장
				try {
					file.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				// 파일 타입 받아서 Filedto에 저장
				log.info("파일 타입 : {} " , file.getContentType());
				filedto.setFile_type(file.getContentType());
				
				// 오늘 날짜 담아서 Filedto에 저장
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				// 현재날짜를받아옴
				Date date = new Date();
				String fileDate = sdf.format(date);
				log.info("파일 날짜 : {} ", fileDate);
				filedto.setFile_register_date(fileDate);
				
				// 파일 경로 받아서 Filedto에 저장
				filedto.setFile_path(filePath + "\\" + file.getOriginalFilename());

				// 파일 넘버를 task_no로 셋팅 (230728 11:18)
				filedto.setFile_no(taskdto.getTask_no());
				
				log.debug("업데이트 쿼리 실행 전: {}", SignTaskAttachedFiledto);
				attachedfileService.updateOne(filedto);
				// signTaskAttachedFileService.updateAttachedfile(SignTaskAttachedFiledto);
				log.debug("업데이트 쿼리 실행 후: {}", SignTaskAttachedFiledto);
		
		
				/* return "redirect:/soop/task"; */
		return "redirect:/taskDetail?project_no="+project_no+"&member_no="+member_no+"&task_no="+task_no;
	}

	
	  @GetMapping("/taskinfo")
	  @ResponseBody 
	  public SignDTO info(@RequestParam("member_no") int member_no,
			  @RequestParam("sign_member_no") int sign_member_no,
			  @RequestParam("sign_approver") int sign_approver,
			  @RequestParam("sign_step") int sign_step) {
		  log.info("나와라 member_no {} " , member_no); 
		  log.info("나와라 sign_member_no {} " , sign_member_no); 
		  log.info("나와라 sign_approver {} " , sign_approver); 
		  log.info("나와라 sign_step {} " , sign_step); 
		  SignDTO dto =signservice.selectOneByMno(member_no); 
		  return dto;
	  }
	 

	@GetMapping("/delete")
	public String delete(@ModelAttribute TaskDTO dto, @ModelAttribute AttachedFileDTO filedto,
			@RequestParam("task_no")int task_no,
			@RequestParam("project_no")int project_no,
			@RequestParam("member_no")int member_no) {

		taskService.deleteOne(dto);

		// 첨부파일 삭제
		int fileNo = filedto.getFile_no();
		log.info("삭제 파일 넘버 : " + Integer.toString(fileNo));
		attachedfileService.deleteOne(dto.getTask_no());

		// sign 삭제
		signservice.deleteOne(task_no);
		
		/* return "redirect:/soop/task"; */
		return "redirect:feed?project_no="+project_no+"&member_no="+member_no;
	}

	// 파일 다운로드
	@RequestMapping("/task/download")
	@ResponseBody // 사용자에게 전달
	public byte[] download(HttpServletRequest req, 
			/* @RequestParam("fileName") String fileName, */// 파라미터값으로 파일 이름을(aa.PNG)
			@RequestParam("file_name") String file_name,
		HttpServletResponse resp) {
		// /data 디렉토리에 저장되어 있다.

		String filePath = req.getSession().getServletContext().getRealPath("/data");

		// 파일의 절대 경로를 구할 수 있다.
		System.out.println("/data 디렉토리의 절대 경로 : " + filePath);

		// 다운로드 받을 파일의 절대 경로
		String absFilePath = filePath + "/" + file_name;

		System.out.println("다운로드 받을 파일의 절대 경로 : " + absFilePath);

		// 파일 객체 생성
		File f = new File(absFilePath);
		// 전송할 파일을 byte[] 형태로 형변환을 시켜준다.
		byte[] b = null;
		try {
			b = FileCopyUtils.copyToByteArray(f); // 이 메서드가 byte 배열을 리턴해줌

			// 내가 보내는 파일이 무엇인지, 어떻게 처리할지 브라우저에 알려줌
			String fn = new String(f.getName().getBytes(), "iso_8859_1"); // 파일 이름 한글이면 깨지니까 알 수 있도록 파일명 바꿔주고,
			// 파일의 이름
			resp.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\""); // 매개변수로 httpservletresponse 추가
			// 파일의 길이
			resp.setContentLength(b.length);
			// 파일의 종류
			resp.setContentType("image/jpeg");
			resp.setContentType("text/plain"); // 텍스트 파일의 MIME 타입인 "text/plain"으로 변경
			

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b; // b를 리턴해주면서 파일이 전송됨

	} // download() end

}