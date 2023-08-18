package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.HistoryTaskProjectMemberDTO;



@Repository
@Mapper
public interface HistoryTaskProjectMemberDAO {

	
	public List<HistoryTaskProjectMemberDTO> selectAll(HistoryTaskProjectMemberDTO dto);

	public int getTotal(HistoryTaskProjectMemberDTO dto);
	
	public List<HistoryTaskProjectMemberDTO> selectAllbyMemberNo(int member_no);
	
	public List<HistoryTaskProjectMemberDTO> getSearchList(HistoryTaskProjectMemberDTO dto);

	public List<HistoryTaskProjectMemberDTO> getSearchTotalList(HistoryTaskProjectMemberDTO dto);
	
}
