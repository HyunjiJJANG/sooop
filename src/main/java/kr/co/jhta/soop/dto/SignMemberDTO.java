package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class SignMemberDTO {
	
	private int sign_no;
	private int task_no;
	private int member_no;
	private int sign_step;
	private String sign_approver;
	private int sign_status;
	private String sign_date;
	
	private String profile_path;
	private String profile_name;
	private String name;
}
