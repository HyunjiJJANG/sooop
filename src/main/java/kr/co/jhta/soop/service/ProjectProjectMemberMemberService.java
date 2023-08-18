package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;

public interface ProjectProjectMemberMemberService {
	
	public List<ProjectProjectMemberMemberDTO> selectAllProjectTitle(int member_no);

	public List<ProjectProjectMemberMemberDTO> selectAllProjectMember(int project_no);
	
	public List<ProjectProjectMemberMemberDTO> selectAllProjectMemberByPno(int project_no);
	
	public int selectRecentProject();
}
