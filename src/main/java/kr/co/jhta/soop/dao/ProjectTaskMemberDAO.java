package kr.co.jhta.soop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.ProjectTaskMemberDTO;

@Repository
@Mapper

public interface ProjectTaskMemberDAO {

	// 로그인 시 내가 참여하는 프로젝트의 업무생선된거 간단하게 보여주는 용도	
	public List<ProjectTaskMemberDTO> myproject_Select_task(int member_no);
	
	// Ajax으로 드래그 앤 드랍으로 변경된 업무상태값 map.put 하는 용도
	public List<ProjectTaskMemberDTO> myproject_Select_task(HashMap<String, Integer> map);
	
	// 드래그 앤 드랍으로 업무상태값 변경시 상태값 업데이트
	public void myprojectUpdateTaskStatus(HashMap<String, Integer> map);
	
	// 프로젝트별로 업무 보여주기
	public List<ProjectTaskMemberDTO> TasksByProject(int member_no);
	
	// 프로젝트 checkbox목록에서 프로젝트 클릭시 해당 프로젝트에 있는 업무가져오는 용도 
	public List<ProjectTaskMemberDTO> getTasksByProject(HashMap<String, Object> projectTask);
	
}
