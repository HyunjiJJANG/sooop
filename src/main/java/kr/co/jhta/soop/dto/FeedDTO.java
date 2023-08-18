package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedDTO {
	// project 테이블
	private int project_no;
	private String project_title;
	private String project_description;
	private	String project_start_date;
	private String project_end_Date;
	private int project_status;
	private String color;
	
	// member 테이블
	private int member_no;
	private String email;
	private String name;
	private String profile_name;
	private String profile_path;
	
	// project_member 테이블
	private int member_position;
	
	// task 테이블
	private int task_no;
	private String task_title;
	private String task_register_date;
	private String task_content;
	private int task_status;
	private String task_start_date;
	private String task_end_date;
	
	// attached_file 테이블
	private int file_no;
	private String file_type;
	private String file_name;
	private String file_path;
	private String file_register_date;
	
	// comment 테이블
	private int comment_no;
	private int parent_comment_no;
	private int comment_level;
	private int coment_content;
	private String coment_register_date;
	
	// sign 테이블
	private int sign_no;
	private int sign_step;
	private String sign_approver;
	private int sign_status;
	private String sign_date;

}
