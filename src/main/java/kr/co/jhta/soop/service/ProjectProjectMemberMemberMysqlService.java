package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectProjectMemberMemberDAO;
import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;

@Service
public class ProjectProjectMemberMemberMysqlService implements ProjectProjectMemberMemberService {
	@Autowired
	ProjectProjectMemberMemberDAO dao;
	
	@Override
	public List<ProjectProjectMemberMemberDTO> selectAllProjectTitle(int member_no) {
		return dao.selectAllProjectTitle(member_no);
	}

	@Override
	public List<ProjectProjectMemberMemberDTO> selectAllProjectMemberByPno(int project_no) {
		return dao.selectAllProjectMemberByPno(project_no);
	}

	@Override
	public List<ProjectProjectMemberMemberDTO> selectAllProjectMember(int project_no) {
		return dao.selectAllProjectMember(project_no);
	}

	@Override
	public int selectRecentProject() {
		return dao.selectRecentProject();
	}

}
