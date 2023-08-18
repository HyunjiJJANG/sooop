package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberProjectProjectmemberDTO {

	private int member_no;
	private String email;
	private String password;
	private String name;
	private String profile_name;
	private String profile_path;
	
	private int project_no;
	private String project_title;
	private String project_description;
	private	String projectStartDate;
	private String project_end_Date;
	private int project_status;
	private String color;

	private int member_position;
	
	
}
