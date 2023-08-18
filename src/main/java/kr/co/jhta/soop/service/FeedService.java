package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.FeedDTO;

public interface FeedService {

	List<FeedDTO> selectAllProjectDetail(int project_no, int member_no);

}
