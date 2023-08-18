package kr.co.jhta.soop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemoDAO;
import kr.co.jhta.soop.dto.MemoDTO;

@Service
public class MemoMysqlService implements MemoService{
	@Autowired
	MemoDAO dao;

	@Override
	public MemoDTO selectOne(int member_no) {
		
		return dao.selectOne(member_no);
	}

	@Override
	public void insertOne(MemoDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(MemoDTO dto) {
		dao.updateOne(dto);
		
	}
	
	
}
