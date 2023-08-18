package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.SignTaskAttachedFileDTO;
import kr.co.jhta.soop.dto.TaskDTO;

@Repository
@Mapper
public interface SignTaskAttachedFileDAO {
	
	public List<SignTaskAttachedFileDTO> selectAll();
	
	public void insertTask(SignTaskAttachedFileDTO dto);
	
	public void insertSign(SignTaskAttachedFileDTO dto);
	
	public void insertAttachedFile(SignTaskAttachedFileDTO dto);

	public void updateTask(SignTaskAttachedFileDTO dto);

	public SignTaskAttachedFileDTO selectOne(int task_no);

	public void updateSign(SignTaskAttachedFileDTO dto);

	public void updateAttachedfile(SignTaskAttachedFileDTO dto);
	
	
}
