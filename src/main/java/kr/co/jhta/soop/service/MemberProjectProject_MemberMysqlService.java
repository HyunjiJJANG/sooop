package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemberProjectProject_MemberDAO;
import kr.co.jhta.soop.dto.MemberProjectProject_MemberDTO;

@Service
public class MemberProjectProject_MemberMysqlService implements MemberProjectProject_MemberService{

	@Autowired
	MemberProjectProject_MemberDAO MPP;

	@Override
	public List<MemberProjectProject_MemberDTO> myproject_SelectAll(int member_no) {
		// TODO Auto-generated method stub
		return MPP.myproject_SelectAll(member_no);
	}

}
