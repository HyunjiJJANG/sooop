package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.HistoryTaskProjectMemberDAO;
import kr.co.jhta.soop.dto.HistoryTaskProjectMemberDTO;

@Service
public class HistoryTaskProjectMemberMysqlService implements HistoryTaskProjectMemberService {

	
	@Autowired
	HistoryTaskProjectMemberDAO dao;

	@Override
	public List<HistoryTaskProjectMemberDTO> selectAll(HistoryTaskProjectMemberDTO dto) {
		
		return dao.selectAll(dto);
	}

	@Override
	public int getToal(HistoryTaskProjectMemberDTO dto) {
		return dao.getTotal(dto);
	}

	@Override
	public List<HistoryTaskProjectMemberDTO> selectAllbyMemberNo(int member_no) {
		return dao.selectAllbyMemberNo(member_no);
	}

	@Override
	public List<HistoryTaskProjectMemberDTO> getSearchList(HistoryTaskProjectMemberDTO dto) {
		
		return dao.getSearchList(dto);
	}

	public List<HistoryTaskProjectMemberDTO> getSearchTotalList(HistoryTaskProjectMemberDTO dto) {
	
		return dao.getSearchTotalList(dto);
	}
	
	
}
