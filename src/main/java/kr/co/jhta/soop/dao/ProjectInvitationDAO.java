package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectInvitationDTO;

@Repository
@Mapper
public interface ProjectInvitationDAO {
	
	public List<ProjectInvitationDTO> selectAll();
	
	public ProjectInvitationDTO selectOne(int invitation_no);

	public void insertOne(ProjectInvitationDTO dto);

	public void updateOne(ProjectInvitationDTO dto);

	public void deleteOne(int invitation_no);

	public ProjectInvitationDTO selectOneByEmail(String invitation_email);

	//public String findByKey(String key);
	
	public int findByProjectNo(String key);

	public ProjectInvitationDTO findByKey(String key);

	public void updateSuccess(String invitation_code);


}
