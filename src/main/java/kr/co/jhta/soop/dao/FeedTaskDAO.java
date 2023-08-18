package kr.co.jhta.soop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.FeedTaskDTO;
import kr.co.jhta.soop.util.Criteria;

@Repository
@Mapper
public interface FeedTaskDAO {

    List<Map<String, Object>> selectAllTaskListByPno(Criteria criteria);
    
    int totalCount(int project_no);
    
    FeedTaskDTO selectOneTaskDetailByTno(int task_no);
    
    int countFile(int project_no);
    
    List<FeedTaskDTO> selectAllTaskListByMno(int member_no);
}
