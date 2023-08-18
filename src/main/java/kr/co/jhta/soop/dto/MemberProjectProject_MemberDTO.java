package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor

public class MemberProjectProject_MemberDTO {

	// Member table
	
	private int member_no;
	private String email;
	private String password;
	private String name;
	private String profile_name;
	private String profile_path;
	
	// Project table
	
	private int project_no;
	private String project_title;
	private String project_description;
	private	String project_start_date;
	private String project_end_Date;
	private int project_status;
	private String color;
	
	// ProejctMember table
	private int member_position;
	
	
}
