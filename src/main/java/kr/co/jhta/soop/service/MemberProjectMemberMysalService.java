package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemberProjectMemberDAO;
import kr.co.jhta.soop.dto.MemberProjectMemberDTO;

@Service
public class MemberProjectMemberMysalService implements MemberProjectMemberService{

	
	@Autowired
	MemberProjectMemberDAO dao;
	
	@Override
	public List<MemberProjectMemberDTO> selectAll(MemberProjectMemberDTO dto) {
		
		return dao.selectAll(dto);
	}

	@Override
	public MemberProjectMemberDTO selectOne(int member_no) {
		
		return dao.selectOne(member_no);
	}

	
	@Override
	public MemberProjectMemberDTO selectMemberByEmail(String email) {
		
		return dao.selectMemberByEmail(email);
	}

	@Override
	public void insertOne(MemberProjectMemberDTO dto) {
		
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(MemberProjectMemberDTO dto) {
		dao.updateOne(dto);
	}

	

	@Override
	public void deleteOne(int member_no) {
		
		dao.deleteOne(member_no);
	}

	@Override
	public List<MemberProjectMemberDTO> getSearchList(MemberProjectMemberDTO dto) {
		
		return dao.selectSearchList(dto);
	}

	@Override
	public List<Integer> selectAllProjectByEmail(String email) {
		
		return dao.selectAllProjectByEmail(email);
	}

	@Override
	public List<MemberProjectMemberDTO> selectProjectAll(MemberProjectMemberDTO dto) {
		return dao.selectProjectAll(dto);
	}

}
