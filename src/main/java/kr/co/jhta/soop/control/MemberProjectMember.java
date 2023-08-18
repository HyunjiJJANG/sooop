package kr.co.jhta.soop.control;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.MemberProjectMemberDTO;
import kr.co.jhta.soop.service.MemberProjectMemberService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MemberProjectMember {
	
//	
//	@Autowired
//	MemberProjectMemberService memberProjectMemberService;
//
//	//나와 같은 프로젝트 구성원 출력하기
//	@GetMapping("/contact")
//	public String myContactList(@RequestParam("email")String email, @RequestParam("member_no")int member_no, @RequestParam("project_no")int project_no, Model model) {
//		
//		MemberProjectMemberDTO memberProjectMemberdto =  memberProjectMemberService.selectOne(member_no);
//		memberProjectMemberdto.setMember_no(member_no);
//		memberProjectMemberdto.setProject_no(1);
//		 
//		model.addAttribute("list", memberProjectMemberService.selectAll(memberProjectMemberdto));
//		log.info(""+memberProjectMemberService.selectAll(memberProjectMemberdto));
//		model.addAttribute("member_no", member_no);
//		model.addAttribute("project_no", 1);
//		model.addAttribute("email", email);
//		
//		return "contact";
//	}
//	
//	// 구성원 찾기를 위한 리스트
//	@GetMapping("/getSearchList")
//	@ResponseBody
//	public List<MemberProjectMemberDTO> getSearchList(@RequestParam("searchName")String search_name,@RequestParam("member_no")int member_no,@RequestParam("project_no")int project_no, Model model){
//	log.info("서치네임 키업 이벤트 발생 후 컨트롤러 찾아옴");
//	log.info("member_no : "+ member_no);
//	
//	MemberProjectMemberDTO memberProjectMemberdto = new MemberProjectMemberDTO();
//	
//	memberProjectMemberdto.setSearch_name(search_name);
//	memberProjectMemberdto.setMember_no(member_no);
//	memberProjectMemberdto.setProject_no(1);
//	return memberProjectMemberService.getSearchList(memberProjectMemberdto);
//	  
//	}
}
