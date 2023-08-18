package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectInvitationDAO;
import kr.co.jhta.soop.dto.ProjectInvitationDTO;

@Service
public class ProjectInvitationMysqlService implements ProjectInvitationService {

	@Autowired
	ProjectInvitationDAO dao;

	@Override
	public List<ProjectInvitationDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public ProjectInvitationDTO selectOne(int invitation_no) {

		return dao.selectOne(invitation_no);
	}

	@Override
	public void insertOne(ProjectInvitationDTO dto) {
		dao.insertOne(dto);

	}

	@Override
	public void updateOne(ProjectInvitationDTO dto) {
		dao.updateOne(dto);

	}

	@Override
	public void deleteOne(int invitation_no) {
		dao.deleteOne(invitation_no);

	}
	
	@Override
	public ProjectInvitationDTO selectOneByEmail(String invitation_email) {
		
		return dao.selectOneByEmail(invitation_email);
	}

	@Override
	public ProjectInvitationDTO findByKey(String key) {
		return dao.findByKey(key);
	}

	@Override
	public void updateSuccess(String invitation_code) {
		dao.updateSuccess(invitation_code);
		
	}

}
