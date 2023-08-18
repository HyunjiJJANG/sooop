package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProjectInvitaionDTO {

	private int invitationNo;
	private String invitationEmail;
	private int invitationCode;
	private String invitationValidTime;
	private int invitationSuccess;
	
	
}

