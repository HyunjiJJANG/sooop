package kr.co.jhta.soop.control;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.co.jhta.soop.dto.MemoDTO;
import kr.co.jhta.soop.dto.TaskMemberNo;
import kr.co.jhta.soop.service.FeedService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.MemoService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.TaskFavoriteService;
import kr.co.jhta.soop.service.TaskMemberFileService;
import kr.co.jhta.soop.service.TaskService;
import lombok.extern.slf4j.Slf4j;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MemoService memoService;

	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	FeedService feedService;
	
	@Autowired
	TaskMemberFileService taskMemberFileService;
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	TaskFavoriteService taskFavoriteService;
	
	// 메모 수정
	@PostMapping("/home")
	public String saveMemo(@RequestParam("member_no")int member_no,
							@RequestParam("memo_content")String memo_content, Model model) {
		System.out.println(member_no);
		
		// 입력한 메모 내용 메모 테이블에 담기
		MemoDTO dto = new MemoDTO();
		dto.setMember_no(member_no);
		dto.setMemo_content(memo_content);
		
		// 메모 테이블에 멤버번호로 조회하기
		MemoDTO dto2 = memoService.selectOne(member_no);
		
		if(dto2 == null) { // 메모 테이블에 해당 멤버번호에 데이터가 없으면 insert
			memoService.insertOne(dto);
		}else { // 메모 테이블에 해당 멤버번호에 데이터가 있으면 update
			memoService.updateOne(dto);
		}
		
		model.addAttribute("member_no", member_no);
		return "home";
	} // 메모 수정 end
	
	// 고객센터
	@GetMapping("/faq")
	public String faq(@RequestParam("member_no")int member_no,
					 Model model) {
		
		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
				model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
				
		model.addAttribute("memberDTO", memberService.selectOne(member_no)); // nav에 name 들어갈 수 있게
		
		return "faq";
	}
	
	// 파일 다운로드
	@RequestMapping("/download")
	@ResponseBody // 사용자에게 전달
	public byte[] download(HttpServletRequest req,
			@RequestParam("fileName") String fileName, // 파라미터값으로 파일 이름을(aa.PNG)받아서 fileName이라는 String 변수에 담아주기
			HttpServletResponse resp) {
		
		// /data 디렉토리에 저장되어 있다.
		String filePath = req.getSession().getServletContext().getRealPath("/data");

		// 파일의 절대 경로를 구할 수 있다.
		System.out.println("/data 디렉토리의 절대 경로 : " + filePath);

		// 다운로드 받을 파일의 절대 경로
		String absFilePath = filePath + "/" + fileName;

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
			e.printStackTrace();
		}

		return b; // b를 리턴해주면서 파일이 전송됨
		

	} // download() end
	
	// 관심업무 삭제
	@GetMapping("/deleteFavoriteOne")
	public void deleteFavoriteOne(@RequestParam("task_no")int task_no,
								@RequestParam("member_no")int member_no) {
		TaskMemberNo tmno = new TaskMemberNo();
		tmno.setTask_no(task_no);
		tmno.setMember_no(member_no);
		taskFavoriteService.deleteFav(tmno);
		
	}
	
	
} // class end
