package kr.co.jhta.soop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class AttachedFileDTO {
	

	private int file_no;
	private int task_no;
	private String file_type;
	private String file_name;
	private String file_path;
	private String file_register_date;
	

}
