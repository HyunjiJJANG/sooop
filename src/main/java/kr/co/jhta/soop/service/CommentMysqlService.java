package kr.co.jhta.soop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.CommentDAO;
import kr.co.jhta.soop.dto.CommentDTO;

@Service
public class CommentMysqlService implements CommentService {

	@Autowired
	private CommentDAO dao;

	@Override
	public List<CommentDTO> selectAll() {

		return dao.selectAll();
	}

	@Override
	public CommentDTO selectOne(int comment_no) {

		return dao.selectOne(comment_no);
	}

	@Override
	public void insertOne(CommentDTO dto) {
		dao.insertOne(dto);

	}

	@Override
	public void updateOne(CommentDTO dto) {
		dao.updateOne(dto);

	}

	@Override
	public void deleteOne(int comment_no) {
		dao.deleteOne(comment_no);

	}

	@Override
	public List<CommentDTO> selectAllCommentByTno(int task_no) {
		return dao.selectAllCommentByTno(task_no);
	}



	@Override
	public List<CommentDTO> commentList(int task_no) throws Exception {
		return dao.commentList(task_no);
	}

//	@Override
//	public int commentInsert(CommentDTO dto) throws Exception {
//		return dao.commentInsert(dto);
//	}
//
//	@Override
//	public int commentUpdate(CommentDTO dto) throws Exception {
//		return dao.commentUpdate(dto);
//	}
//
//	@Override
//	public int commentDelete(int comment_no) throws Exception {
//		return dao.commentDelete(comment_no);
//	}

}
