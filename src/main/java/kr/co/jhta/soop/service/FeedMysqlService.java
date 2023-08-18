package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.FeedDAO;
import kr.co.jhta.soop.dto.FeedDTO;

@Service
public class FeedMysqlService implements FeedService {

	@Autowired
	private FeedDAO dao;

	@Override
	public List<FeedDTO> selectAllProjectDetail(int project_no, int member_no) {
		return dao.selectAllProjectDetail(project_no, member_no);
	}

}
