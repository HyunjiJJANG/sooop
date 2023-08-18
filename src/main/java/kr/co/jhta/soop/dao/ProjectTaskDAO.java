package kr.co.jhta.soop.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProjectTaskDAO {
	
	public int cntTaskStatus0(int project_no);
	public int cntTaskStatus1(int project_no);
	public int cntTaskStatus2(int project_no);
	public int cntTaskStatus3(int project_no);
	public int cntTaskStatus4(int project_no);
	
}
