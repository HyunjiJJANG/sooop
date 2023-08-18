package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HistoryTaskProjectMemberDTO {

	private int task_no;
	private int project_no;
	private int member_no;
	private int history_no;
	private String name;
	private String task_title;
	private String task_content;
	private String project_title;
	private String history_type;
	private String history_register_date;
	private String history_content;

	int startNo;
	int endNo;

}
