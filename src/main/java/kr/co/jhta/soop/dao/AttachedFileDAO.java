package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.AttachedFileDTO;

@Repository
@Mapper
public interface AttachedFileDAO {
	
	
	public List<AttachedFileDTO> selectAll();
	
	public AttachedFileDTO selectOne(int file_no);
	
	public void insertOne(AttachedFileDTO dto);
	
	public void updateOne(AttachedFileDTO dto);
	
	public void deleteOne(int file_no);
	

}



