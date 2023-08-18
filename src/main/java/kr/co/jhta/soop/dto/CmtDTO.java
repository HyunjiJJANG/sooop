package kr.co.jhta.soop.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class CmtDTO {
	private int comment_no;
	private int task_no;
	private int member_no;
	private String comment_content;
	private String comment_register_date;
}
