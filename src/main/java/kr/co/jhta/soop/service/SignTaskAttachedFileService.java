package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskAttachedFileDTO;

public interface SignTaskAttachedFileService {
	
	public List<SignTaskAttachedFileDTO> selectAll();
	
	public SignTaskAttachedFileDTO selectOne(int task_no);
	
	public void insertTask(SignTaskAttachedFileDTO dto);
	
	public void insertSign(SignTaskAttachedFileDTO dto);
	
	public void insertAttachedFile(SignTaskAttachedFileDTO dto);

	public void updateTask(SignTaskAttachedFileDTO signTaskAttachedFiledto);

	public void updateSign(SignTaskAttachedFileDTO signTaskAttachedFiledto);

	public void updateAttachedfile(SignTaskAttachedFileDTO signTaskAttachedFiledto);
	
}
