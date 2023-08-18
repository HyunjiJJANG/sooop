package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.TaskAttachedFileDAO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;

@Service 
public class TaskAttachedFileMysqlService implements TaskAttachedFileService {

	
	@Autowired
	TaskAttachedFileDAO dao;
	
	@Override
	public List<TaskAttachedFileDTO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public TaskAttachedFileDTO selectOne(int task_no) {
		return dao.selectOne(task_no);
	}

}