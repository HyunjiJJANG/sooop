package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectDTO;

@Repository
@Mapper
public interface ProjectDAO {
	
	public List<ProjectDTO> selectAll();

	public ProjectDTO  selectOne(int project_no);

	public void insertOne(ProjectDTO dto);

	public void updateOne(ProjectDTO dto);

	public void deleteOne(int project_no);
	
	public String selectOneEndDate(int project_no);

}
