package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProjectInvitationDTO {

	private int invitation_no;
	private int project_no;
	private String invitation_email;

	

	private String invitation_code;

	private int invitation_success;
	
	
}

