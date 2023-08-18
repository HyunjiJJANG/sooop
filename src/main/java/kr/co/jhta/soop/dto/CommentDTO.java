package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CommentDTO {
	
	private int comment_no;
	private int task_no;
	private int member_no;
	private String comment_content;
	private String comment_register_date;
	
	private String name;
	private String profile_path;
	private String profile_name;

}

