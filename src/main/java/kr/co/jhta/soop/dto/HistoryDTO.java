package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data

public class HistoryDTO {
	
	
	private int history_no;
	private int task_no;
	private String history_type;
	private String history_register_date;
	private String history_content;
	

}
