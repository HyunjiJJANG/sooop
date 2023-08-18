package kr.co.jhta.soop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectTaskMemberDAO;
import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

@Service
public class ProjectTaskMemberMysqlService implements ProjectTaskMemberService{

	@Autowired
	ProjectTaskMemberDAO PTMdao;

	@Override
	public List<ProjectTaskMemberDTO> myproject_Select_task(HashMap<String, Integer> map) {
		
		return PTMdao.myproject_Select_task(map);
	}

	@Override
	public List<ProjectTaskMemberDTO> myproject_Select_task(int member_no) {
		
		return PTMdao.myproject_Select_task(member_no);
	}

	@Override
	public void myprojectUpdateTaskStatus(HashMap<String, Integer> map) {
		
		PTMdao.myprojectUpdateTaskStatus(map);		
	}

	@Override
	public List<ProjectTaskMemberDTO> TasksByProject(int member_no) {
		
		return PTMdao.TasksByProject(member_no);
	}

	@Override
	public List<ProjectTaskMemberDTO> getTasksByProject(HashMap<String, Object> projectTask) {
		
		return PTMdao. getTasksByProject(projectTask);
	}

}
