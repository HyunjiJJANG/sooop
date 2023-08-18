package kr.co.jhta.soop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.FeedTaskDAO;
import kr.co.jhta.soop.dto.FeedTaskDTO;
import kr.co.jhta.soop.util.Criteria;

@Service
public class FeedTaskMysqlService implements FeedTaskService {
	@Autowired
	private FeedTaskDAO dao;

	@Override
	public List<Map<String, Object>> selectAllTaskListByPno(Criteria criteria) {
		return dao.selectAllTaskListByPno(criteria);
	}

	@Override
	public int totalCount(int project_no) {
		return dao.totalCount(project_no);
	}

	@Override
	public FeedTaskDTO selectOneTaskDetailByTno(int task_no) {
		return dao.selectOneTaskDetailByTno(task_no);
	}

	@Override
	public int countFile(int project_no) {
		return dao.countFile(project_no);
	}
	
	@Override
	public List<FeedTaskDTO> selectAllTaskListByMno(int member_no) {
		return dao.selectAllTaskListByMno(member_no);
	}

}
