package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectMemberDTO;
import kr.co.jhta.soop.dto.ProjectMemberNo;

@Repository
@Mapper
public interface ProjectMemberDAO {

	public List<ProjectMemberDTO> selectAll();

	public ProjectMemberDTO selectOne(int member_no);
	
	public ProjectMemberDTO selectOne(ProjectMemberNo pmno);

	public void insertOne(ProjectMemberDTO dto);
	
	public void insertPM(ProjectMemberDTO dto);

	public void updateOne(ProjectMemberDTO dto);

	public void deleteOne(int member_no);

	public void deleteOne(ProjectMemberNo pmno);

	public void changeAuth1(int project_no);
	
	public void changeAuth2(ProjectMemberNo pmno);
	
	public int countProjectMember(int project_no);

}
