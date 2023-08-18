package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class TaskDTO {

	
	private int task_no;
	private int project_no;
	private int member_no;
	private String task_title;
	private String task_register_date;
	private String task_content;
	private int task_status;
	private String task_start_date;
	private String task_end_date;
	private String task_favorite;

}


