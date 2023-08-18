package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ScheduleDTO {
	private int schedule_no;
	private int member_no;
	private String schedule_title;
	private String schedule_start_date;
	private String schedule_end_date;
}