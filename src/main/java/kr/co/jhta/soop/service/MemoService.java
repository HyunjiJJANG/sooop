package kr.co.jhta.soop.service;

import kr.co.jhta.soop.dto.MemoDTO;

public interface MemoService {
	public MemoDTO selectOne(int member_no);
	public void insertOne(MemoDTO dto);
	public void updateOne(MemoDTO dto);
}
