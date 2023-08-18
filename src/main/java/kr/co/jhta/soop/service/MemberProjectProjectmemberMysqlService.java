package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.MemberProjectProjectmemberDAO;
import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;

@Service
public class MemberProjectProjectmemberMysqlService implements MemberProjectProjectmemberService {

	@Autowired
	MemberProjectProjectmemberDAO dao;

	@Override
	public List<MemberProjectProjectmemberDTO> selectAllbyprojectno(int project_no) {
		return dao.selectAllbyprojectno(project_no);
	}
	
}
