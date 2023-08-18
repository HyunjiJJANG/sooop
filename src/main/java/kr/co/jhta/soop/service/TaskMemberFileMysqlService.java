package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.FeedDAO;
import kr.co.jhta.soop.dao.TaskMemberFileDAO;
import kr.co.jhta.soop.dto.FeedDTO;
import kr.co.jhta.soop.dto.TaskMemberFileDTO;

@Service
public class TaskMemberFileMysqlService implements TaskMemberFileService {

	@Autowired
	private TaskMemberFileDAO dao;

	@Override
	public List<TaskMemberFileDTO> selectAllProjectFile(int member_no) {
		return dao.selectAllProjectFile(member_no);
	}

	@Override
	public List<TaskMemberFileDTO> selectProjectFile(TaskMemberFileDTO dto) {
		
		return dao.selectProjectFile(dto);
	}


}
