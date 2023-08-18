package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class SignTaskAttachedFileDTO {
	
	private int sign_no;
	private int task_no;
	private int sign_member_no;
	private int sign_step;
	private String sign_approver;
	private int sign_status;
	private String sign_date;
	
	private int project_no;
	private int member_no;
	private String task_title;
	private String task_register_date;
	private String task_content;
	private int task_status;
	private String task_start_date;
	private String task_end_date;
	
	private int file_no;
	private String file_type;
	private String file_name;
	private String file_path;
	private String file_register_date;
}
