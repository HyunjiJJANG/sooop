package kr.co.jhta.soop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.TaskFavoriteDAO;
import kr.co.jhta.soop.dto.TaskMemberNo;

@Service
public class TaskFavoriteMysqlService implements TaskFavoriteService{

	@Autowired
	TaskFavoriteDAO dao;
	
	@Override
	public void insertFav(TaskMemberNo tmno) {
		dao.insertFav(tmno);		
	}

	@Override
	public void deleteFav(TaskMemberNo tmno) {
		dao.deleteFav(tmno);
	}

	@Override
	public int selectOneFav(TaskMemberNo tmno) {
		return dao.selectOneFav(tmno);
	}
	
}
