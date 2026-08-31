package com.intr.ctr;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intr.dao.AprvDao;
import com.intr.dao.RoleDao;
import com.intr.dao.BanrDao;
import com.intr.dao.BoardDao;
import com.intr.dao.EmpDao;
import com.intr.dao.MtgDao;
import com.intr.dao.ProjDao;
import com.intr.dao.TaskDao;
import com.intr.svc.AprvService;
import com.intr.svc.RoleService;
import com.intr.svc.CoreService;
import com.intr.svc.EmpService;
import com.intr.svc.MainService;
import com.intr.svc.MtgService;
import com.intr.svc.TempService;
import com.intr.utils.Const;
import com.intr.vo.EmpVO;

@Controller
public class MainController {
	//
	@Autowired
	CoreService coreService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	EmpService empService;

	@Autowired
	AprvService aprvService;

	@Autowired
	TempService tempService;

	@Autowired
	RoleService roleService;
	
	@Autowired
	MtgService mtgService;
	
	@Autowired
	AprvDao aprvDao;

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	EmpDao empDao;
	
	@Autowired
	ProjDao projDao;
	
	@Autowired
	MtgDao mtgDao;
	
	@Autowired
	BanrDao banrDao;
	
	@Autowired
	RoleDao roleDao;
	
	@Autowired
	TaskDao taskDao;
	
	@Autowired
	HttpSession session;
	
	// 
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 로그인 화면 조회
	@RequestMapping(value={"/","/intrMainInqy1010.do"})
	public String intrMainInqy1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 로그인 권한 조회
			//--------------------------------------------------------------------------------------------
			mainService.mainInqyService1010(model);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 로그인 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_LOGIN + Const.INTR_LOGIN_INQY_1010;
	}

	// 사용자 메인 조회
	@RequestMapping("/intrMainInqy1020.do")
	public String intrMainInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			// 사번 저장
			EmpVO emp = (EmpVO)session.getAttribute("empVO");
			paramMap.put("empIdx", emp.getEmpIdx());
			
			//--------------------------------------------------------------------------------------------
			// 메뉴 세션 저장
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1030(Const.USER);
			
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);

			//--------------------------------------------------------------------------------------------
			// 캘린더 조회
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService2010(model, paramMap);

			//--------------------------------------------------------------------------------------------
			// 캘린더 목록 조회
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService2020(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공지사항 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = boardDao.boardInqyDao1020(paramMap);
			model.addAttribute("boardList",defaultList);
			
			//--------------------------------------------------------------------------------------------
			// 결재 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = aprvDao.aprvInqyDao1030(paramMap);
			model.addAttribute("aprvList", defaultList);
			
			//--------------------------------------------------------------------------------------------
			// 배너 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = banrDao.banrInqyDao1030(paramMap);
			model.addAttribute("banrInfo", defaultInfo);
			
			//--------------------------------------------------------------------------------------------
			// 사원 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = empDao.intrEmpInqy1031(paramMap);
			model.addAttribute("empInfo", defaultInfo);

			//--------------------------------------------------------------------------------------------
			// 오늘의 일정 조회
			//--------------------------------------------------------------------------------------------
			defaultList = taskDao.taskInqyDao3030(paramMap);
			model.addAttribute("tldrList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사용자 메인 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MAIN + Const.INTR_MAIN_INQY_1010;
	}

	// 관리자 메인 조회
	@SuppressWarnings("unchecked")
	@RequestMapping("/intrMainInqy1030.do")
	public String intrMainInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		JSONArray jAray = new JSONArray();
		JSONObject jObj = null;
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 세션 저장
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1030(Const.ADMIN);

			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 부서 현황
			//--------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2041(paramMap);
			//
			for (int i=0;i<defaultList.size();i++) {
				//
		        jObj = new JSONObject();
		        jObj.put("orgNm", defaultList.get(i).get("orgNm"));
		        jObj.put("orgCnt", defaultList.get(i).get("orgCnt"));
		        jAray.add(jObj);
		    }
			//
			model.addAttribute("orgList", jAray.toJSONString());
			
			//--------------------------------------------------------------------------------------------
			// 권한 부여 현황
			//--------------------------------------------------------------------------------------------
			defaultList = roleDao.roleInqyDao5010(model);
			model.addAttribute("roleList", defaultList);
			
			//--------------------------------------------------------------------------------------------
			// 입사 현황
			//--------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy4011(paramMap);
			model.addAttribute("empList", defaultList);

			//--------------------------------------------------------------------------------------------
			// 프로젝트 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = projDao.projInqyDao1020(paramMap);
			model.addAttribute("projList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 관리자 메인 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MAIN + Const.INTR_MAIN_INQY_2010;
	}
	
	// 마이페이지 조회
	@RequestMapping("/intrMainInqy1040.do")
	public String intrMainInqy1040(Model model, @RequestParam HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 세션 저장
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1030((String)paramMap.get("menuType"));
			
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 사원 상세 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 마이페이지 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MYPAGE + Const.INTR_MYPAGE_INQY_1010;
	}
	
	// 로그인 처리
	@RequestMapping("/intrMainProc1010.do")
	@ResponseBody
	public String intrMainProc1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 로그인 처리
			//-------------------------------------------------------------------------------------------
			defaultStr = mainService.mainProcService1010(model, paramMap);	
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 로그인 처리 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 로그아웃 처리
	@RequestMapping("/intrMainProc1020.do")
	public String intrMainProc1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 세션 제거
			//--------------------------------------------------------------------------------------------
			if(session.getAttribute("empVO")!=null) {
				session.removeAttribute("empVO");
			}
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 로그아웃 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return "redirect:/";

	}
}
