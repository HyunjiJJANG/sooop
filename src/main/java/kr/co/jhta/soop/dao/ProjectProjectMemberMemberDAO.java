package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectProjectMemberMemberDTO;

@Repository
@Mapper
public interface ProjectProjectMemberMemberDAO {

	List<ProjectProjectMemberMemberDTO> selectAllProjectTitle(int member_no);
	List<ProjectProjectMemberMemberDTO> selectAllProjectMember(int project_no);

	List<ProjectProjectMemberMemberDTO> selectAllProjectMemberByPno(int project_no);
	
	public int selectRecentProject();
}
