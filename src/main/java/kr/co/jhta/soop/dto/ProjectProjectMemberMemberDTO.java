package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProjectProjectMemberMemberDTO {
	
	// project 테이블
	private int project_no;
	private String project_title;
	private String project_description;
	private	String project_start_date;
	private String project_end_date;
	private int project_status;
	private String color;
	
	// project member 테이블
	private int member_no;
	private int member_position;
	
	// member 테이블
	private String email;
	private String password;
	private String name;
	private String profile_name;
	private String profile_path;
	
}
