package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectDAO;
import kr.co.jhta.soop.dto.ProjectDTO;
@Service
public class ProjectMysqlService implements ProjectService {

	
	@Autowired
	ProjectDAO dao;
	
	@Override
	public List<ProjectDTO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public ProjectDTO selectOne(int project_no) {
		return dao.selectOne(project_no);
	}

	@Override
	public void insertOne(ProjectDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(ProjectDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int project_no) {
		dao.deleteOne(project_no);
		
	}

	@Override
	public String selectOneEndDate(int project_no) {
		return dao.selectOneEndDate(project_no);
	}

}
