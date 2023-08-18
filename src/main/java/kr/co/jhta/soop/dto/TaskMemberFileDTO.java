package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskMemberFileDTO {

	// project 테이블
	private int project_no;
	private String project_title;

	// project_member 테이블
	private int member_no;

	// task 테이블
	private int task_no;
	private String task_title;

	// attached_file 테이블
	private int file_no;
	private String file_type;
	private String file_name;
	private String file_path;
	private String file_register_date;


}