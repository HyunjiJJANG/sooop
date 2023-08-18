package kr.co.jhta.soop.service;

import kr.co.jhta.soop.dto.CmtDTO;

public interface CmtService {
    // 댓글 작성
    public int commentInsert(CmtDTO dto) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(CmtDTO dto) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int comment_no) throws Exception;
}
