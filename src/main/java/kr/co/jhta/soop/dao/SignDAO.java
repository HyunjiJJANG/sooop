package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.SignDTO;

@Repository
@Mapper
public interface SignDAO {
	
	public List<SignDTO> selectAll();

	public SignDTO selectOne(int sign_no);

	public void insertOne(SignDTO dto);

	public void updateOne(SignDTO dto);

	public void deleteOne(int task_no);

	public SignDTO selectOneByMno(int sign_member_no);

	public List<SignDTO> selectAllSignByTno(int task_no);

}
