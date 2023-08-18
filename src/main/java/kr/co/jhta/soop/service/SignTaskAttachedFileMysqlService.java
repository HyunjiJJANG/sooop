package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.SignTaskAttachedFileDAO;
import kr.co.jhta.soop.dao.TaskAttachedFileDAO;
import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;

@Service
public class SignTaskAttachedFileMysqlService implements SignTaskAttachedFileService {

	
	@Autowired
	SignTaskAttachedFileDAO dao;
	
	public List<SignTaskAttachedFileDTO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public void insertTask(SignTaskAttachedFileDTO dto) {
		dao.insertTask(dto);
		
	}

	@Override
	public void insertSign(SignTaskAttachedFileDTO dto) {
		dao.insertSign(dto);
		
	}

	@Override
	public void insertAttachedFile(SignTaskAttachedFileDTO dto) {
		dao.insertAttachedFile(dto);
		
	}

	@Override
	public void updateTask(SignTaskAttachedFileDTO dto) {
		dao.updateTask(dto);
	}

	@Override
	public SignTaskAttachedFileDTO selectOne(int task_no) {
		return dao.selectOne(task_no);
	}

	@Override
	public void updateSign(SignTaskAttachedFileDTO dto) {
		dao.updateSign(dto);
		
	}

	@Override
	public void updateAttachedfile(SignTaskAttachedFileDTO dto) {
		dao.updateAttachedfile(dto);
	}
	
}
