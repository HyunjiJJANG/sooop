package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.SignDTO;
import kr.co.jhta.soop.dto.SignMemberDTO;

public interface SignMemberService {
	
	public List<SignDTO> selectAllSignByTno(int task_no);
	
	public SignMemberDTO selectOne(int task_no);
	
}
