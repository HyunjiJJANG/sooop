package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.SignDAO;
import kr.co.jhta.soop.dto.SignDTO;

@Service
public class SignMysqlService implements SignService {

	
	@Autowired
	SignDAO dao;
	
	@Override
	public List<SignDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public SignDTO selectOne(int sign_no) {
		return dao.selectOne(sign_no);
	}

	@Override
	public void insertOne(SignDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(SignDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int task_no) {
		dao.deleteOne(task_no);
		
	}

	@Override
	public List<SignDTO> selectAllSignByTno(int task_no) {
		return dao.selectAllSignByTno(task_no);
	}
	
	@Override
	public SignDTO selectOneByMno(int sign_member_no) {
		return dao.selectOneByMno(sign_member_no);

	}

}
