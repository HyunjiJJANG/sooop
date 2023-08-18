package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.HistoryDTO;

@Repository
@Mapper
public interface HistoryDAO {
	
	public List<HistoryDTO> selectAll();

	public  HistoryDTO selectOne(int history_no);

	public void insertOne(HistoryDTO dto);

	public void updateOne(HistoryDTO dto);

	public void deleteOne(HistoryDTO dto);

}
