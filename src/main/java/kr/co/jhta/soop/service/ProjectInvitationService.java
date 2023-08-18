package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectInvitationDTO;

public interface ProjectInvitationService {

	public List<ProjectInvitationDTO> selectAll();

	public ProjectInvitationDTO selectOne(int invitation_no);
	
	public ProjectInvitationDTO selectOneByEmail(String invitation_email);
	
	public void insertOne(ProjectInvitationDTO dto);

	public void updateOne(ProjectInvitationDTO dto);

	public void deleteOne(int invitation_no);
	
	public ProjectInvitationDTO findByKey(String key);

	public void updateSuccess(String invitation_code);

}
