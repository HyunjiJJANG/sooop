package kr.co.jhta.soop.control;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.MemberProjectProjectmemberDTO;
import kr.co.jhta.soop.dto.ProjectMemberNo;
import kr.co.jhta.soop.dto.TaskMemberNo;
import kr.co.jhta.soop.service.CommentService;
import kr.co.jhta.soop.service.FeedTaskService;
import kr.co.jhta.soop.service.MemberProjectProjectmemberService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.service.ProjectMemberService;
import kr.co.jhta.soop.service.ProjectProjectMemberMemberService;
import kr.co.jhta.soop.service.ProjectService;
import kr.co.jhta.soop.service.ProjectTaskService;
import kr.co.jhta.soop.service.SignMemberService;
import kr.co.jhta.soop.service.SignTaskAttachedFileService;
import kr.co.jhta.soop.service.TaskFavoriteService;
import kr.co.jhta.soop.service.TaskService;
import kr.co.jhta.soop.util.Criteria;
import kr.co.jhta.soop.util.Pagenation;

@Controller
public class FeedController {
	@Autowired
	MemberService memberService;

	@Autowired
	ProjectMemberService projectMemberService;

	@Autowired
	ProjectProjectMemberMemberService projectProjectMemberMemberService;

	@Autowired
	ProjectService projectService;

	@Autowired
	FeedTaskService feedTaskService;

	@Autowired
	SignMemberService signMemberService;

	@Autowired
	CommentService commentService;

	@Autowired
	ProjectTaskService projectTaskService;

	@Autowired
	TaskService taskService;
	
	@Autowired
	MemberProjectProjectmemberService memberProjectProjectmemberService;
	
	@Autowired
	SignTaskAttachedFileService signTaskAttachedFileService;
	
	@Autowired
	TaskFavoriteService taskFavoriteService;

	// side nav에 프로젝트명 클릭하면 해당 프로젝트 업무 리스트가 있는 피드로 이동
	@GetMapping("/feed")
	public String list(@RequestParam("project_no") int project_no, @RequestParam("member_no") int member_no,
			@RequestParam(name = "page", defaultValue = "1") int page, Model model, Criteria criteria)
			throws ParseException {

		ProjectMemberNo pmno = new ProjectMemberNo();
		pmno.setMember_no(member_no);
		pmno.setProject_no(project_no);

		model.addAttribute("project_no", project_no);
		model.addAttribute("member_no", member_no);
		model.addAttribute("name", memberService.selectOneByName(member_no)); // 새 멤버초대하기 메일 제목에 name 들어갈 수 있게
		model.addAttribute("memberDTO", memberService.selectOne(member_no)); // nav에 name 들어갈 수 있게
		model.addAttribute("projectMemberDTO", projectMemberService.selectOne(pmno));
		model.addAttribute("memberList", projectProjectMemberMemberService.selectAllProjectMember(project_no));

		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));

		// 주소록에 email을 보내기 위한
		model.addAttribute("memberDTO", memberService.selectOne(member_no));

		// 피드 페이지 상단에 프로젝트 제목 보여주기
		model.addAttribute("projectDTO", projectService.selectOne(project_no));

		// 오른쪽 퀵메뉴에 프로젝트에 참여중인 멤버 리스트 보여주기
		model.addAttribute("pjmemberList", projectProjectMemberMemberService.selectAllProjectMemberByPno(project_no));

		// 메인 화면에 해당 프로젝트의 업무 리스트 보여주기
		Pagenation pageNation = new Pagenation();
		pageNation.setCriteria(criteria);
		pageNation.setTotalCount(feedTaskService.totalCount(project_no));
		criteria.setProject_no(project_no);
		model.addAttribute("pno", project_no);
		model.addAttribute("mno", member_no);
		model.addAttribute("feedListDTO", feedTaskService.selectAllTaskListByPno(criteria));
		model.addAttribute("pagenation", pageNation);

		// 프로젝트 통계
		model.addAttribute("countProjectMember", projectMemberService.countProjectMember(project_no));
		model.addAttribute("countTask", taskService.countTask(project_no));
		model.addAttribute("countFile", feedTaskService.countFile(project_no));

		String now = LocalDate.now().toString();
		String project_end_date = projectService.selectOneEndDate(project_no);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date nowFormat = format.parse(now);
		Date targetFormat = format.parse(project_end_date);
		long diffSec = (nowFormat.getTime() - targetFormat.getTime()) / 1000;
		long diffDays = (diffSec / (24 * 60 * 60)) + 1;
		String DaysLeft = "";
		if (nowFormat.getTime() > targetFormat.getTime()) {
			DaysLeft = "D+" + diffDays;
		} else if (targetFormat.getTime() >= nowFormat.getTime()) {
			DaysLeft = "D-" + diffDays;
		}
		model.addAttribute("countDays", DaysLeft);
		
		// 생성 모달에 값을 넘기기 위한 => members로 생성 모달에 project_no와 member_no를 함께 띄움
		List<MemberProjectProjectmemberDTO> members = memberProjectProjectmemberService
				.selectAllbyprojectno(project_no);
		model.addAttribute("members", members);
		

		return "feed";
	}

	// 업무 리스트에서 업무 제목 클릭하면 업무 상세 페이지로 이동
	@GetMapping("/taskDetail")
	public String taskDetail(@RequestParam("project_no") int project_no, @RequestParam("member_no") int member_no,
			@RequestParam("task_no") int task_no, Model model) {
		// side nav에 해당 회원이 참여중인 프로젝트 리스트 보여주기
		model.addAttribute("projectList", projectProjectMemberMemberService.selectAllProjectTitle(member_no));

		// 주소록에 email을 보내기 위한
		model.addAttribute("memberDTO", memberService.selectOne(member_no));

		// 피드 페이지 상단에 프로젝트 제목 보여주기
		model.addAttribute("projectDTO", projectService.selectOne(project_no));

		// 오른쪽 퀵메뉴에 프로젝트에 참여중인 멤버 리스트 보여주기
		model.addAttribute("pjmemberList", projectProjectMemberMemberService.selectAllProjectMemberByPno(project_no));

		// 메인 화면에 해당 업무 상세 보여주기
		model.addAttribute("feedTaskDTO", feedTaskService.selectOneTaskDetailByTno(task_no));
		model.addAttribute("signDTO", signMemberService.selectOne(task_no));
		model.addAttribute("commentDTO", commentService.selectAllCommentByTno(task_no));
		model.addAttribute("pno", project_no);
		model.addAttribute("mno", member_no);
		model.addAttribute("tno", task_no);
		
		// 해당 업무 관심업무 등록 여부
		TaskMemberNo tmno = new TaskMemberNo();
		tmno.setTask_no(task_no);
		tmno.setMember_no(member_no);
		model.addAttribute("favorite", taskFavoriteService.selectOneFav(tmno));
		
		// 업무 수정 모달에 데이터 전달
		model.addAttribute("dto", signTaskAttachedFileService.selectOne(task_no));
		
		// 업무 수정 모달에 결재자 정보 전달
		List<MemberProjectProjectmemberDTO> members = memberProjectProjectmemberService
				.selectAllbyprojectno(project_no);
		model.addAttribute("members", members);

		return "taskDetail";

	}

	@GetMapping("/task/status")
	@ResponseBody
	public List<Integer> taskStatus(@RequestParam("project_no") int project_no, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		list.add(projectTaskService.cntTaskStatus0(project_no));
		list.add(projectTaskService.cntTaskStatus1(project_no));
		list.add(projectTaskService.cntTaskStatus2(project_no));
		list.add(projectTaskService.cntTaskStatus3(project_no));
		list.add(projectTaskService.cntTaskStatus4(project_no));

		model.addAttribute("list", list);
		return list;
	}

	@GetMapping("/insertFav")
	public String insertFav(@RequestParam("project_no") int project_no, @RequestParam("member_no") int member_no,
			@RequestParam("task_no") int task_no) {
		TaskMemberNo tmno = new TaskMemberNo();
		tmno.setTask_no(task_no);
		tmno.setMember_no(member_no);
		taskFavoriteService.insertFav(tmno);

		return "redirect:taskDetail?project_no=" + project_no + "&member_no=" + member_no + "&task_no=" + task_no;
	}
	@GetMapping("/deleteFav")
	public String deleteFav(@RequestParam("project_no") int project_no, @RequestParam("member_no") int member_no,
			@RequestParam("task_no") int task_no) {
		TaskMemberNo tmno = new TaskMemberNo();
		tmno.setTask_no(task_no);
		tmno.setMember_no(member_no);
		taskFavoriteService.deleteFav(tmno);

		return "redirect:taskDetail?project_no=" + project_no + "&member_no=" + member_no + "&task_no=" + task_no;
	}

}
