package com.intr.ctr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import com.intr.dao.EmpDao;
import com.intr.dao.LogDao;
import com.intr.dao.MtgDao;
import com.intr.dao.ProjDao;
import com.intr.dao.QueryDao;
import com.intr.dao.TaskDao;
import com.intr.dao.UtilDao;
import com.intr.svc.UtilService;
import com.intr.utils.Const;

@Controller
public class PopupController {
	//
	@Autowired
	UtilService utilService;
	
	@Autowired
	RoleDao roleDao;
	
	@Autowired
	UtilDao utilDao;
	
	@Autowired
	EmpDao empDao;
	
	@Autowired
	ProjDao projDao;
	
	@Autowired
	AprvDao aprvDao;
	
	@Autowired
	MtgDao mtgDao;
	
	@Autowired
	QueryDao queryDao;
	
	@Autowired
	TaskDao taskDao;
	
	@Autowired
	LogDao logDao;
	// 
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 담당자 조회
	@RequestMapping("/intrPopupInqy1011.do")
	public String intrPopupInqy1011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 담당자 조회
			//--------------------------------------------------------------------------------------------
			defaultList = roleDao.roleInqyDao3010(paramMap);
			model.addAttribute("empList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 담당자 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1011;
	}

	// 아이디 찾기 팝업 조회
	@RequestMapping("/intrPopupInqy1021.do")
	public String intrPopupInqy1021(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 팝업(아이디 찾기) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1021;
	}

	// 비밀번호 찾기 팝업 조회 
	@RequestMapping("/intrPopupInqy1022.do")
	public String intrPopupInqy1022(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//
		} catch (Exception e) {
			//
			logger.debug("Exception : 팝업(비밀번호 찾기) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1022;
	}
	
	// 사원 정보 조회
	@RequestMapping("/intrPopupInqy1023.do")
	@ResponseBody
	public String intrPopupInqy1023(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		String defaultStr = "";
		//
		try {
			// 사원 아이디 저장
			defaultInfo = empDao.empInqyDao1030(paramMap);
			
			if(defaultInfo != null) {
				defaultStr = String.format("[{'findId':'%s', 'findEmail':'%s'}]", (String)defaultInfo.get("empId"), (String)defaultInfo.get("email"));		
			}
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 팝업(아이디 찾기) 사원 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 프로젝트 조회
	@RequestMapping("/intrPopupInqy1030.do")
	public String intrPopupInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 조회
			//--------------------------------------------------------------------------------------------
			defaultList = projDao.projInqyDao1020(paramMap);
			model.addAttribute("projList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 목록 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1031;
	}
	
	// 결재선 선택 팝업 조회
	@RequestMapping("/intrPopupInqy1041.do")
	public String intrPopupInqy1041(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 부서 사원 트리 조회
			//--------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2031(paramMap);
			model.addAttribute("empList",defaultList);

			//--------------------------------------------------------------------------------------------
			// 결재선 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = aprvDao.aprvInqyDao4010(paramMap);
			model.addAttribute("defaultList",defaultList);

			//--------------------------------------------------------------------------------------------
			// 공통코드 (결재선) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Type", "typeList");
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 결재선 선택 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1041;
	}
	
	// 결재선 팝업 조회
	@RequestMapping("/intrPopupInqy1042.do")
	public String intrPopupInqy1042(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 결재선 팝업 조회
			//--------------------------------------------------------------------------------------------
			defaultList = aprvDao.aprvInqyDao1050(paramMap);
			model.addAttribute("lineList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 결재선 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1042;
	}
	
	// 결재선 상세 조회
	@RequestMapping("/intrPopupInqy1043.do")
	public String intrPopupInqy1043(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 결재선 상세 조회
			//--------------------------------------------------------------------------------------------
			defaultList = aprvDao.aprvInqyDao4020(paramMap);
			model.addAttribute("aprvlineList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 결재선 상세 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1043;
	}
	
	// 결재의견 팝업 조회
	@RequestMapping("/intrPopupInqy1050.do")
	public String intrPopupInqy1050(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 결재의견 팝업 조회
			//--------------------------------------------------------------------------------------------
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 결재 의견 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1051;
	}
	
	// 물품 등록 팝업 조회
	@RequestMapping("/intrPopupInqy1061.do")
	public String intrPopupInqy1061(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 물품 등록 팝업 조회
			//--------------------------------------------------------------------------------------------
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 물품 등록 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1061;
	}
	
	// 물품 조회 팝업 조회
	@RequestMapping("/intrPopupInqy1062.do")
	public String intrPopupInqy1062(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 물품 조회 팝업 조회
			//--------------------------------------------------------------------------------------------
			defaultList = aprvDao.aprvInqyDao1060(paramMap);
			model.addAttribute("itemList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 물품 조회 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1062;
	}
	
	// 정산내역 등록 팝업 조회
	@RequestMapping("/intrPopupInqy1071.do")
	public String intrPopupInqy1071(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 정산내역 팝업 조회
			//--------------------------------------------------------------------------------------------
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 정산내역 등록 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1071;
	}
	
	// 정산내역 조회 팝업 조회
	@RequestMapping("/intrPopupInqy1072.do")
	public String intrPopupInqy1072(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 정산내역 조회 팝업 조회
			//--------------------------------------------------------------------------------------------
			defaultList = aprvDao.aprvInqyDao1070(paramMap);
			model.addAttribute("corpList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 정산내역 조회 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1072;
	}
	
	// 일정 상세 팝업 조회
	@RequestMapping("/intrPopupInqy1081.do")
	public String intrPopupInqy1081(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 일정 관리 팝업 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = aprvDao.aprvInqyDao1040(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 일정 상세 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1081;
	}
	
	// 회의 상세 팝업 조회
	@RequestMapping("/intrPopupInqy1091.do")
	public String intrPopupInqy1091(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 상세 팝업 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = mtgDao.mtgInqyDao1030(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
			//--------------------------------------------------------------------------------------------
			// 파일 정보
			//--------------------------------------------------------------------------------------------
			defaultList = utilDao.fileInqyDao1010(paramMap);
			model.addAttribute("fileList",defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 상세 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1091;
	}
	
	// 조직도 팝업 조회
	@RequestMapping("/intrPopupInqy1101.do")
	public String intrPopupInqy1101(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 조직도 팝업 조회
			//--------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2031(paramMap);
			model.addAttribute("empList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 조직도 팝업 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1101;
	}
	
	// 조직도 트리 조회
	@RequestMapping("/intrPopupInqy1102.do")
	public String intrPopupInqy1102(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 조직도 트리 조회
			//--------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2031(paramMap);
			model.addAttribute("empList", defaultList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 조직도 트리 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1102;
	}
	
	// 조직도 사원 조회
	@RequestMapping("/intrPopupInqy1103.do")
	@ResponseBody
	public HashMap<String, Object> intrPopupInqy1103(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 조직도 트리 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = empDao.intrEmpInqy1031(paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 조직도 사원 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultInfo;
	}
	
	// API 조회
	@SuppressWarnings("unchecked")
	@RequestMapping("/intrPopupInqy1111.do")
	public String intrPopupInqy1111(Model model, @RequestParam HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		List<HashMap<String, Object>> emptyList = new ArrayList<HashMap<String, Object>>();
		JSONObject jObj = new JSONObject();
		//
		try {
			//--------------------------------------------------------------------------------------------
			// API 조회
			//--------------------------------------------------------------------------------------------
			defaultList = queryDao.queryInqyDao1010(paramMap);
			
			if(defaultList.size() > 0) {
				// 데이터 조회 성공
				jObj.put("totalCnt", String.valueOf(defaultList.size()));
				jObj.put("isSuccess", "SUCCESS");	
				jObj.put("message", "쿼리 조회에 성공하였습니다.");
				jObj.put("data", defaultList);
				
			} else {
				// 검색 결과 없음
				jObj.put("totalCnt", "0");
				jObj.put("isSuccess", "FAIL");
	            jObj.put("message", "검색 결과가 없습니다.");
				jObj.put("data", defaultList);
			}
			
		} catch (Exception e) {
			logger.debug("Exception : API 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
			
			// 쿼리 에러
			jObj.put("totalCnt", "0");
			jObj.put("isSuccess", "ERROR");
            jObj.put("message", "입력한 쿼리를 실행시킬 수 없습니다.");
			jObj.put("data", emptyList);
			
		} finally {
			model.addAttribute("jObj", jObj.toJSONString());
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1111;
	}
	
	// 업무 캘린더 등록
	@RequestMapping("/intrPopupInqy1121.do")
	public String intrPopupInqy1121(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 등록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1121;
	}
	
	// 업무 캘린더 상세
	@RequestMapping("/intrPopupInqy1122.do")
	public String intrPopupInqy1122(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무 캘린더 상세
			//--------------------------------------------------------------------------------------------
			defaultInfo = taskDao.taskInqyDao3020(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 상세 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1122;
	}
	
	// 업무 캘린더 상세 (메인)
	@RequestMapping("/intrPopupInqy1123.do")
	public String intrPopupInqy1123(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무 캘린더 상세
			//--------------------------------------------------------------------------------------------
			defaultInfo = taskDao.taskInqyDao3020(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 상세 (메인) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_1123;
	}
	
	// 비밀번호 변경 팝업 조회 (마이페이지)
	@RequestMapping("/intrPopupInqy2011.do")
	public String intrPopupInqy2011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 팝업(마이페이지 비밀번호 변경) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_2011;
	}
	
	// 로그 메세지 상세
	@RequestMapping("/intrPopupInqy2021.do")
	public String intrPopupInqy2021(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 로그 메세지 상세
			//--------------------------------------------------------------------------------------------
			defaultInfo = logDao.logInqyDao1030(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 로그 메세지 상세 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_POPUP + Const.INTR_POPUP_INQY_2021;
	}
}