package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.TaskAttachedFileDTO;

@Repository
@Mapper
public interface TaskAttachedFileDAO {
	
	
	public List<TaskAttachedFileDTO> selectAll();
	
	public TaskAttachedFileDTO selectOne(int task_no);
	
}

