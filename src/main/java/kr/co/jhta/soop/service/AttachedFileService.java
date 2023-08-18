package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.AttachedFileDTO;


public interface AttachedFileService {
	
public List<AttachedFileDTO> selectAll();
	
	public AttachedFileDTO selectOne(int file_no);
	
	public void insertOne(AttachedFileDTO dto);
	
	public void updateOne(AttachedFileDTO filedto);
	
	public void deleteOne(int file_no);

}