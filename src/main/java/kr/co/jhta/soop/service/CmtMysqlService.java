package kr.co.jhta.soop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.soop.dao.CmtDAO;
import kr.co.jhta.soop.dto.CmtDTO;

@Service
@Transactional
public class CmtMysqlService implements CmtService {
	@Autowired
	CmtDAO dao;

	@Override
	public int commentInsert(CmtDTO dto) throws Exception {
		return dao.commentInsert(dto);
	}

	@Override
	public int commentUpdate(CmtDTO dto) throws Exception {
		return dao.commentUpdate(dto);
	}

	@Override
	public int commentDelete(int comment_no) throws Exception {
		return dao.commentDelete(comment_no);
	}
	
}
