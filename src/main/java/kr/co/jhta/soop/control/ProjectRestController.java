package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.soop.dto.FeedTaskDTO;
import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;
import kr.co.jhta.soop.dto.TaskMemberFileDTO;
import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.TaskMemberFileService;
import lombok.extern.slf4j.Slf4j;

@RestController
public class ProjectRestController {
	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;
	
	@Autowired
	TaskMemberFileService taskMemberFileService;
	
	@Autowired
	FeedTaskService feedTaskService;
	
	// 메인페이지 대시보드에 참여 중인 프로젝트 리스트
	@GetMapping(value="/home/selectStatus/{member_no}", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<ProjectProjectMemberMemberDTO> projectShow(@PathVariable("member_no") int member_no) {
		
		List<ProjectProjectMemberMemberDTO> list  = projectProjectMemberMemberService.selectAllProjectTitle(member_no);
		
		return list ;
	}
	
	// 메인페이지 대시보드에 파일함 리스트
	@GetMapping(value="/home/selectFile/{member_no}", produces= MediaType.APPLICATION_JSON_VALUE)
	public List<TaskMemberFileDTO> fileShow(@PathVariable("member_no") int member_no) {
		
		List<TaskMemberFileDTO> flist  = taskMemberFileService.selectAllProjectFile(member_no);

		return flist ;
	}
	
	// 메인페이지 대시보드에 관심업무 리스트
	@GetMapping(value = "/home/selectFavorite/{member_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<FeedTaskDTO> taskShow(@PathVariable("member_no") int member_no) {
		List<FeedTaskDTO> tlist = feedTaskService.selectAllTaskListByMno(member_no);
		return tlist;
	}
}
