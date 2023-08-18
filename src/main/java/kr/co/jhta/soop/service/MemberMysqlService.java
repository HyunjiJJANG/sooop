package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemberDAO;
import kr.co.jhta.soop.dto.MemberDTO;

@Service
public class MemberMysqlService implements MemberService{

	
	@Autowired
	MemberDAO dao;

	@Override
	public List<MemberDTO> selectAll() {
		return dao.selectAll();
	}

	
	//회원가입시 아이디 중복체크를 위한 
	@Override
	public String selectOneByEmail(String email) {
		String checkEmail = dao.selectOneByEmail(email);
		System.out.println(" service checkEmail : " + checkEmail);
		String result;
		if(checkEmail == null) {
			//아이디 사용 가능
			result = "OK";	
		}else {
			//이미 사용중인 아이디
			result="NO";
		}
		
		System.out.println("service result : "+ result);
		return result;
		
	}

	@Override
	public MemberDTO selectOne(int member_no) {
		return dao.selectOne(member_no);
	}

	@Override
	public void insertOne(MemberDTO dto) {
		dao.insertOne(dto);
		
	}

	@Override
	public void updateOne(MemberDTO dto) {
		dao.updateOne(dto);
		
	}

	@Override
	public void deleteOne(int member_no) {
		dao.deleteOne(member_no);
		
	}

	@Override
	public MemberDTO selectMemberByEmail(String email) {
		
		return dao.selectMemberByEmail(email);
	}

	@Override
	public void insertRole(String email) {
		
		dao.insertRole(email);	
	}

	@Override
	public void updateOneName(MemberDTO dto) {
		dao.updateOneName(dto);
		
	}

	@Override
	public void updateOneProfile(MemberDTO dto) {
		
		dao.updateOneProfile(dto);
		
	}
	
	public String selectOneByName(int member_no) {
		return dao.selectOneByName(member_no);
	}

	@Override

	public void oAuth2UserinsertOne(MemberDTO dto) {
		dao.oAuth2UserinsertOne(dto);
	}


	public int selectMemberByMemberNo(String email) {
		return dao.selectMemberByMemberNo(email);
	}


	@Override
	public int selectMnoByEmail(String email) {
		return dao.selectMnoByEmail(email);
	}

}
