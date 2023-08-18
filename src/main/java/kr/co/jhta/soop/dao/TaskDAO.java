package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.TaskDTO;

@Repository
@Mapper
public interface TaskDAO {


	public List<TaskDTO> selectAll(int project_no);

	
	public List<TaskDTO> selectAll();


	public TaskDTO selectOne(int task_no);

	public void insertOne(TaskDTO dto);

	public void updateOne(TaskDTO dto);

	public int countTask(int project_no);

	public void deleteOne(TaskDTO dto);

	public void deleteFavorite(int task_no);
	
	public void updateFavorite(int task_no);
}
