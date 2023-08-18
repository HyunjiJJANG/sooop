package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.FeedDTO;

@Repository
@Mapper
public interface FeedDAO {

	List<FeedDTO> selectAllProjectDetail(int project_no, int member_no);


}
