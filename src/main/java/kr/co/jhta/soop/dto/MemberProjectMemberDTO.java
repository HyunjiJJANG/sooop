package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberProjectMemberDTO {
	private int member_no;
	private String email;
	private String password;
	private String name;
	private String profile_name;
	private String profile_path;
	private int enabled;
	private int project_no;
	private int member_position;
	
	//검색 필터
	private String search_name;

}
