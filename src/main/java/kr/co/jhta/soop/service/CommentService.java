package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.CommentDTO;

public interface CommentService {

	public List<CommentDTO> selectAll();

	public CommentDTO selectOne(int comment_no);

	public void insertOne(CommentDTO dto);

	public void updateOne(CommentDTO dto);

	public void deleteOne(int comment_no);
	
	public List<CommentDTO> selectAllCommentByTno(int task_no);
	
 
    // 댓글 목록
    public List<CommentDTO> commentList(int task_no) throws Exception;
 
//    // 댓글 작성
//    public int commentInsert(CommentDTO dto) throws Exception;
//    
//    // 댓글 수정
//    public int commentUpdate(CommentDTO dto) throws Exception;
// 
//    // 댓글 삭제
//    public int commentDelete(int comment_no) throws Exception;
}
