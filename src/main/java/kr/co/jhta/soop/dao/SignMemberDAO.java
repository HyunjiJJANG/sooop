package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.SignDTO;
import kr.co.jhta.soop.dto.SignMemberDTO;

@Repository
@Mapper
public interface SignMemberDAO {
	
	public List<SignDTO> selectAllSignByTno(int task_no);
	
	public SignMemberDTO selectOne(int task_no);
	
}
