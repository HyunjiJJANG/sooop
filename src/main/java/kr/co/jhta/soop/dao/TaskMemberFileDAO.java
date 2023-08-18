package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.FeedDTO;
import kr.co.jhta.soop.dto.TaskMemberFileDTO;

@Repository
@Mapper
public interface TaskMemberFileDAO {

	List<TaskMemberFileDTO> selectAllProjectFile(int member_no);
	
	List<TaskMemberFileDTO> selectProjectFile(TaskMemberFileDTO dto);
	

}
