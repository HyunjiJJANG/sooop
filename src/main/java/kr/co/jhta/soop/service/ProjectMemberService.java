package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectMemberDTO;
import kr.co.jhta.soop.dto.ProjectMemberNo;

public interface ProjectMemberService {

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
