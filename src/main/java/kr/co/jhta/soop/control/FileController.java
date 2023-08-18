package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.soop.dto.TaskMemberFileDTO;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.TaskMemberFileService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FileController {

	
	@Autowired
	MemberService memberService;
	@Autowired
	TaskMemberFileService taskMemberFileService;


	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;

	@GetMapping("/fileList")
	public String fileShow(@RequestParam("member_no") int member_no, @RequestParam("project_no") int project_no,
			Model model) {
		TaskMemberFileDTO taskMemberFileDTO = new TaskMemberFileDTO();
		taskMemberFileDTO.setProject_no(project_no);
		taskMemberFileDTO.setMember_no(member_no);
		List<TaskMemberFileDTO> flist = taskMemberFileService.selectProjectFile(taskMemberFileDTO);
		model.addAttribute("list", flist);
		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));
		//네비바를 위한 memberDTO
		model.addAttribute("memberDTO", memberService.selectOne(member_no));
		
		model.addAttribute("pno", project_no);
		model.addAttribute("mno", member_no);
		// 피드 페이지 상단에 프로젝트 제목 보여주기
				model.addAttribute("projectDTO", projectService.selectOne(project_no));

		return "fileList";
	}

}
