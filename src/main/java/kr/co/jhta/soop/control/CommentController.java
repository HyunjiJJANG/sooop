package kr.co.jhta.soop.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.CmtDTO;
import kr.co.jhta.soop.dto.CommentDTO;
import kr.co.jhta.soop.service.CmtService;
import kr.co.jhta.soop.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
	@Autowired
	CmtService cmtService;
	
//	@GetMapping("/comment/list") //댓글 리스트
//	@ResponseBody
//	public List<CommentDTO> list(@RequestParam("task_no")int task_no, Model model) throws Exception{
//		return commentService.commentList(task_no);
//	}
	    
	@PostMapping("/comment/insert") //댓글 작성 
	public String insert(@RequestParam("project_no")int project_no,
					  	 @RequestParam("task_no")int task_no,
					  	 @RequestParam("member_no")int member_no,
					  	 @RequestParam("comment_content")String comment_content) throws Exception{
	    CmtDTO dto = new CmtDTO();
	    dto.setTask_no(task_no);
	    dto.setMember_no(member_no);
	    dto.setComment_content(comment_content);

	    cmtService.commentInsert(dto);
	    return "redirect:/taskDetail?project_no="+project_no+"&member_no="+member_no+"&task_no="+task_no;
    }
	    
//	    @RequestMapping("/update") //댓글 수정  
//	    @ResponseBody
//	    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
//	        
//	        CommentVO comment = new CommentVO();
//	        comment.setCno(cno);
//	        comment.setContent(content);
//	        
//	        return mCommentService.commentUpdateService(comment);
//	    }
//	    
	    @GetMapping("/comment/delete") //댓글 삭제  
	    private String delete(@RequestParam("project_no")int project_no,
			  	 			  @RequestParam("task_no")int task_no,
			  	 			  @RequestParam("member_no")int member_no,
			  	 			  @RequestParam("comment_no")int comment_no) throws Exception{
	        
	    	cmtService.commentDelete(comment_no);
	    	
	        return "redirect:/taskDetail?project_no="+project_no+"&member_no="+member_no+"&task_no="+task_no;
	    }
	
}
