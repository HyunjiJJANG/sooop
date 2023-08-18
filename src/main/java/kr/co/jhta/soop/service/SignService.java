package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.SignDTO;

public interface SignService {

	public List<SignDTO> selectAll();

	public SignDTO selectOne(int sign_no);
	
	public SignDTO selectOneByMno(int sign_member_no);

	public void insertOne(SignDTO dto);

	public void updateOne(SignDTO dto);
	
	public List<SignDTO> selectAllSignByTno(int task_no);

	public void deleteOne(int task_no);

}
