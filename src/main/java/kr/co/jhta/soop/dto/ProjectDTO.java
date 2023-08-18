package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProjectDTO {
	
	private int project_no;
	private String project_title;
	private String project_description;
	private	String project_start_date;
	private String project_end_Date;
	private int project_status;
	private String color;

}
