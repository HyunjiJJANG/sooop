package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.MemberProjectProject_MemberDTO;

public interface MemberProjectProject_MemberService {
	
	// 로그인 시 내가 참여하는 프로젝트 모두 보여주는 용도
	public List<MemberProjectProject_MemberDTO> myproject_SelectAll(int member_no);

}
