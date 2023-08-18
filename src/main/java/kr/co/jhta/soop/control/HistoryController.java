package kr.co.jhta.soop.control;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.soop.dto.HistoryTaskProjectMemberDTO;
import kr.co.jhta.soop.service.HistoryTaskProjectMemberMysqlService;
import kr.co.jhta.soop.service.MemberService;
import kr.co.jhta.soop.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HistoryController {

	@Autowired
	HistoryTaskProjectMemberMysqlService historyService;
	
	@Autowired
	MemberService memberService;

	// 히스토리 출력하기
	@GetMapping("/historyList")
	public String historyList(Model model, @RequestParam("member_no") int member_no,
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {

		// 프로젝트 별 찾기를 위한 코드
		List<HistoryTaskProjectMemberDTO> projectList = historyService.selectAllbyMemberNo(member_no);
		model.addAttribute("projectList", projectList);

		// 페이징 처리하기
		// 총 게시물 수
		HistoryTaskProjectMemberDTO dtoGetTotal = new HistoryTaskProjectMemberDTO();
		// 조건에 맞는 리스트의 값을 출력하기 위해 member_no set
		dtoGetTotal.setMember_no(member_no);

		// getTotal로 총 게시물 수 구해오기
		int totalNumber = historyService.getToal(dtoGetTotal);
		// 페이지당 게시물 수
		int recordPerPage = 10;
		log.info("총게시물수 : >>>>>>>>>>>>" + totalNumber);
		log.info("페이지당 게시물 수  : >>>>>>>>>>>>" + recordPerPage);
		log.info("현재페이지번호  : >>>>>>>>>>>>" + currentPage);
		// 총페이지수, 한페이지당수, 현재 페이지번호
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);

		int getstartNo = (int) map.get("startNo");
		// int endNo = (int) map.get("endNo");

		int startNo = getstartNo - 1;
		// 히스토리 출력
		HistoryTaskProjectMemberDTO dto = new HistoryTaskProjectMemberDTO();
		dto.setMember_no(member_no);

		dto.setStartNo(startNo);
		dto.setEndNo(recordPerPage);

		model.addAttribute("list", historyService.selectAll(dto));
		model.addAttribute("memberDTO", memberService.selectOne(member_no));
		log.info("" + historyService.selectAll(dto));
		model.addAttribute("member_no", member_no);
		model.addAttribute("map", map);

		return "history";
	}

	// 히스토리 디테일로 업무 테이블로 이동하게 하기
	@GetMapping("/historyDetail")
	public String historyDetail(Model model, @RequestParam("task_no") int task_no) {

		return "list";
	}

	// 히스토리 리스트 중 선택한 프로젝트 히스토리 리스트
	@GetMapping("/getSelectProjectHistoryList")
	@ResponseBody
	public List<HistoryTaskProjectMemberDTO> getSearchList(@RequestParam("project_no") int project_no,
			@RequestParam("member_no") int member_no, Model model) {
		log.info("히스토리 중 프로젝트 이름 선택하면 프로젝트별 히스토리 보게 하기 위한 컨트롤러 실행 ");
		log.info("member_no : " + member_no);
		log.info("project_no : " + project_no);
		if (project_no == 0) {
			HistoryTaskProjectMemberDTO dto = new HistoryTaskProjectMemberDTO();
			dto.setMember_no(member_no);
			return historyService.getSearchTotalList(dto);
			
		}
		HistoryTaskProjectMemberDTO historyTaskProjectMemberdto = new HistoryTaskProjectMemberDTO();
		historyTaskProjectMemberdto.setMember_no(member_no);
		historyTaskProjectMemberdto.setProject_no(project_no);
		
		

		return historyService.getSearchList(historyTaskProjectMemberdto);
	}

}
