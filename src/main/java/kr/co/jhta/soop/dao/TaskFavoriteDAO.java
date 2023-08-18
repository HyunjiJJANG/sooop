package kr.co.jhta.soop.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.TaskMemberNo;

@Repository
@Mapper
public interface TaskFavoriteDAO {
	public int selectOneFav(TaskMemberNo tmno);
	public void insertFav(TaskMemberNo tmno);
	public void deleteFav(TaskMemberNo tmno);
}
