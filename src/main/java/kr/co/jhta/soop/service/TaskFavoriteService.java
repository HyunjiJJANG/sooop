package kr.co.jhta.soop.service;

import kr.co.jhta.soop.dto.TaskMemberNo;

public interface TaskFavoriteService {
	public int selectOneFav(TaskMemberNo tmno);
	public void insertFav(TaskMemberNo tmno);
	public void deleteFav(TaskMemberNo tmno);
}
