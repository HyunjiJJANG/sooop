package kr.co.jhta.soop.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.MemoDTO;

@Repository
@Mapper
public interface MemoDAO {
	public MemoDTO selectOne(int member_no);
	public void insertOne(MemoDTO dto);
	public void updateOne(MemoDTO dto);
}
