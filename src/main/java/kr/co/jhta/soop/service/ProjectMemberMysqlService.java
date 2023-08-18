package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectMemberDAO;
import kr.co.jhta.soop.dto.ProjectMemberDTO;
import kr.co.jhta.soop.dto.ProjectMemberNo;


@Service
public class ProjectMemberMysqlService implements ProjectMemberService {

	
	@Autowired
	ProjectMemberDAO dao;
	
	@Override
	public List<ProjectMemberDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public ProjectMemberDTO selectOne(int member_no) {
		return dao.selectOne(member_no);
	}
	
	@Override
	public ProjectMemberDTO selectOne(ProjectMemberNo pmno) {
		return dao.selectOne(pmno);
	}

	@Override
	public void insertOne(ProjectMemberDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(ProjectMemberDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int member_no) {
		dao.deleteOne(member_no);
		
	}

	@Override
	public void deleteOne(ProjectMemberNo pmno) {
		dao.deleteOne(pmno);
	}

	@Override
	public void changeAuth1(int project_no) {
		dao.changeAuth1(project_no);
		
	}
	
	@Override
	public void changeAuth2(ProjectMemberNo pmno) {
		dao.changeAuth2(pmno);
		
	}

	@Override
	public void insertPM(ProjectMemberDTO dto) {
		dao.insertPM(dto);
		
	}

	@Override
	public int countProjectMember(int project_no) {
		return dao.countProjectMember(project_no);
	}


}
