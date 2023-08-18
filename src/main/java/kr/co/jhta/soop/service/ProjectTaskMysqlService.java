package kr.co.jhta.soop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.soop.dao.ProjectTaskDAO;

@Service
public class ProjectTaskMysqlService implements ProjectTaskService {
	@Autowired
	ProjectTaskDAO dao;
	
	@Override
	public int cntTaskStatus0(int project_no) {
		return dao.cntTaskStatus0(project_no);
	}

	@Override
	public int cntTaskStatus1(int project_no) {
		return dao.cntTaskStatus1(project_no);
	}

	@Override
	public int cntTaskStatus2(int project_no) {
		return dao.cntTaskStatus2(project_no);
	}

	@Override
	public int cntTaskStatus3(int project_no) {
		return dao.cntTaskStatus3(project_no);
	}

	@Override
	public int cntTaskStatus4(int project_no) {
		return dao.cntTaskStatus4(project_no);
	}

}
