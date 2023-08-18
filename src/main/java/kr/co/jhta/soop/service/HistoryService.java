package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.HistoryDTO;

public interface HistoryService {

	public List<HistoryDTO> selectAll();

	public  HistoryDTO selectOne(int history_no);

	public void insertOne(HistoryDTO dto);

	public void updateOne(HistoryDTO dto);

	public void deleteOne(HistoryDTO dto);
}
