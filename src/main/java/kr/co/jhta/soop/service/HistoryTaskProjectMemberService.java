package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.HistoryTaskProjectMemberDTO;

public interface HistoryTaskProjectMemberService {
	
	public List<HistoryTaskProjectMemberDTO> selectAll(HistoryTaskProjectMemberDTO dto);

	public int getToal(HistoryTaskProjectMemberDTO dto);
	
	public List<HistoryTaskProjectMemberDTO> selectAllbyMemberNo(int member_no);
	
	public List<HistoryTaskProjectMemberDTO> getSearchList(HistoryTaskProjectMemberDTO dto);
	
	public List<HistoryTaskProjectMemberDTO> getSearchTotalList(HistoryTaskProjectMemberDTO dto);
	
}
