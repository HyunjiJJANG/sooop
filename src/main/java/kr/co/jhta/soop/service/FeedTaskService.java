package kr.co.jhta.soop.service;

import java.util.List;
import java.util.Map;

import kr.co.jhta.soop.dto.FeedTaskDTO;
import kr.co.jhta.soop.util.Criteria;

public interface FeedTaskService {

	List<Map<String, Object>> selectAllTaskListByPno(Criteria criteria);
    
    public int totalCount(int project_no);

	FeedTaskDTO selectOneTaskDetailByTno(int task_no);
	
	int countFile(int project_no);
	
	List<FeedTaskDTO> selectAllTaskListByMno(int member_no);
}
