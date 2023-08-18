package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.MemberProjectMemberDTO;

public interface MemberProjectMemberService {


public List<MemberProjectMemberDTO> selectAll(MemberProjectMemberDTO dto);

public List<MemberProjectMemberDTO> selectProjectAll(MemberProjectMemberDTO dto);


	public MemberProjectMemberDTO selectOne(int member_no);

	public MemberProjectMemberDTO selectMemberByEmail(String email);

	public void insertOne(MemberProjectMemberDTO dto);

	public void updateOne(MemberProjectMemberDTO dto);


public List<MemberProjectMemberDTO> getSearchList(MemberProjectMemberDTO dto);

	public void deleteOne(int member_no);



public List<Integer> selectAllProjectByEmail(String email);



}
