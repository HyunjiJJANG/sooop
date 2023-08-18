package kr.co.jhta.soop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.soop.dto.CommentDTO;

@Repository
@Mapper
public interface CommentDAO {
	
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
