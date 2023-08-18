package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.TaskAttachedFileDTO;

public interface TaskAttachedFileService {

	
	public List<TaskAttachedFileDTO> selectAll();
	
	public TaskAttachedFileDTO selectOne(int task_no);
	
}