package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.HistoryDAO;
import kr.co.jhta.soop.dto.HistoryDTO;


@Service
public class HistoryMysqlService implements HistoryService {

	@Autowired
	HistoryDAO dao;
	
	@Override
	public List<HistoryDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public HistoryDTO selectOne(int history_no) {
		return dao.selectOne(history_no);
	}

	@Override
	public void insertOne(HistoryDTO dto) {

		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(HistoryDTO dto) {
		dao.updateOne(dto);
		
	}

	

	@Override
	public void deleteOne(HistoryDTO dto) {
		dao.deleteOne(dto);

	}

}
