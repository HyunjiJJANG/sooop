package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.FeedDTO;
import kr.co.jhta.soop.dto.TaskMemberFileDTO;

public interface TaskMemberFileService {

	List<TaskMemberFileDTO> selectAllProjectFile(int member_no);
	
	List<TaskMemberFileDTO> selectProjectFile(TaskMemberFileDTO dto);
	
}
