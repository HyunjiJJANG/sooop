package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.MemberProjectMemberDTO;


@Mapper
@Repository
public interface MemberProjectMemberDAO {


public List<MemberProjectMemberDTO> selectAll(MemberProjectMemberDTO dto);

public List<MemberProjectMemberDTO> selectProjectAll(MemberProjectMemberDTO dto);

public  MemberProjectMemberDTO selectOne(int member_no);

public MemberProjectMemberDTO selectMemberByEmail(String email);

public void insertOne(MemberProjectMemberDTO dto);

public void updateOne(MemberProjectMemberDTO dto);

public void deleteOne(int member_no);

public List<MemberProjectMemberDTO> selectSearchList(MemberProjectMemberDTO dto);

	

public List<Integer> selectAllProjectByEmail(String email);

}
