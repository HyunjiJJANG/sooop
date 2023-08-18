package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.AttachedFileDAO;
import kr.co.jhta.soop.dto.AttachedFileDTO;

@Service
public class AttachedFileMysqlService implements AttachedFileService{
	
	
	@Autowired
	private AttachedFileDAO dao;

	@Override
	public List<AttachedFileDTO> selectAll() {
		
		return dao.selectAll();
	}

	@Override
	public AttachedFileDTO selectOne(int file_no) {
		
		return dao.selectOne(file_no);
	}

	@Override
	public void insertOne(AttachedFileDTO dto) {
		
		dao.insertOne(dto);
	}

	@Override
	public void updateOne(AttachedFileDTO dto) {
		dao.updateOne(dto);
	}

	@Override
	public void deleteOne(int file_no) {
		dao.deleteOne(file_no);
	}
	


}
