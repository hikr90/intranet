package com.intr.ctr;

import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.EmpService;
import com.intr.utils.Const;

@Controller
public class EmpController {
	//
	@Autowired
	CoreService coreService;
	
	@Autowired
	EmpService empService;
	
	@Autowired
	UtilDao utilDao;
	// 
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 사원 목록 화면
	@RequestMapping("/intrEmpInqy1010.do")
	public String intrEmpInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 사원 목록 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 정보 정정 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_LIST_1010;
	}
	
	// 사원 등록 화면
	@RequestMapping("/intrEmpInqy1020.do")
	public String intrEmpInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 부서 직급 정보 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 등록 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_DETL_1020;
	}
	
	// 사원 상세 조회
	@RequestMapping("/intrEmpInqy1030.do")
	public String intrEmpInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
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
			logger.debug("Exception : 사원 상세 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_DETL_1010;
	}
	
	// 사원 수정 조회
	@RequestMapping("/intrEmpInqy1040.do")
	public String intrEmpInqy1040(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 부서 직급 정보 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1020(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 사원 상세조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 수정 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_DETL_1030;
	}
	
	// 사원 프로필 사진 조회
	@RequestMapping("/intrEmpInqy1099.do")
	public void intrEmpInqy1099(Model model, @RequestParam HashMap<String, Object> paramMap, HttpServletResponse response){
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 이미지 조회
			//--------------------------------------------------------------------------------------------
			defaultList = utilDao.fileInqyDao1010(paramMap);
			
			//--------------------------------------------------------------------------------------------
			// URL객체 생성 (예외사항 추가)
			//--------------------------------------------------------------------------------------------
			URL fileUrl = new URL("file:" + (String)defaultList.get(0).get("filePath") + (String)defaultList.get(0).get("fileNm"));
			
			//--------------------------------------------------------------------------------------------
			// 파일 입출력 (응답객체로 뿌려진 파일 데이터 JSP로 전송)
			//--------------------------------------------------------------------------------------------
			IOUtils.copy(fileUrl.openStream(), response.getOutputStream());
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 프로필 사진 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
	}
	
	// 사원 조회 목록 화면
	@RequestMapping("/intrEmpInqy2010.do")
	public String intrEmpInqy2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 사원 목록 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 연락처 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_LIST_2010;
	}
	
	// 사원 아이디 중복 조회
	@RequestMapping("/intrEmpInqy2020.do")
	@ResponseBody
	public String intrEmpInqy2020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 아이디 중복 조회
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empInqyService2020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 아이디 중복 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 사원 상세 조회
	@RequestMapping("/intrEmpInqy2030.do")
	public String intrEmpInqy2030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
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
			logger.debug("Exception : 사원 상세 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_DETL_2010;
	}
	
	// 담당업무 조회 목록 화면
	@RequestMapping("/intrEmpInqy3010.do")
	public String intrEmpInqy3010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 담당업무 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService3010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 담당업무 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_LIST_3010;
	}
	
	// 담당업무 조회 목록 화면 (AJAX)
	@RequestMapping("/intrEmpInqy3011.do")
	public String intrEmpInqy3011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 담당업무 조회 (AJAX)
			//--------------------------------------------------------------------------------------------
			empService.empInqyService3011(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 담당업무 목록 (AJAX) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_LIST_3011;
	}
	
	// 담당업무 등록 화면
	@RequestMapping("/intrEmpInqy3012.do")
	public String intrEmpInqy3012(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 담당업무 조회 (AJAX)
			//--------------------------------------------------------------------------------------------
			empService.empInqyService3012(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 담당업무 등록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_LIST_3012;
	}
	
	// 담당업무 조회 목록 화면
	@RequestMapping("/intrEmpInqy4010.do")
	public String intrEmpInqy4010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 인사 통계 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService4010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 인사통계 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_EMP + Const.INTR_EMP_LIST_4010;
	}
	
	// 사원 등록 처리
	@RequestMapping("/intrEmpProc1010.do")
	@ResponseBody
	public String intrEmpProc1010(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 등록
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService1010(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 등록 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 사원 수정 처리
	@RequestMapping("/intrEmpProc1020.do")
	@ResponseBody
	public String intrEmpProc1020(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 수정
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService1020(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 사원 복직, 퇴사 처리
	@RequestMapping("/intrEmpProc1030.do")
	@ResponseBody
	public String intrEmpProc1030(Model model, @RequestParam HashMap<String, Object> paramMap) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 복직, 퇴사 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 복직, 퇴사 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 사원 삭제 처리
	@RequestMapping("/intrEmpProc1040.do")
	@ResponseBody
	public String intrEmpProc1040(Model model, @RequestParam HashMap<String, Object> paramMap) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 삭제 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService1040(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 사원 비밀번호 수정 처리
	@RequestMapping("/intrEmpProc1050.do")
	@ResponseBody
	public String intrEmpProc1050(Model model, @RequestParam HashMap<String, Object> paramMap) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사원 비밀번호 수정 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService1050(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사원 비밀번호 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 담당업무 저장 처리
	@RequestMapping("/intrEmpProc2010.do")
	@ResponseBody
	public String intrEmpProc2010(Model model, @RequestParam HashMap<String, Object> paramMap) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 담당업무 저장 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService2010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 담당업무 저장 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 담당업무 삭제 처리
	@RequestMapping("/intrEmpProc2020.do")
	@ResponseBody
	public String intrEmpProc2020(Model model, @RequestParam HashMap<String, Object> paramMap) {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 담당업무 삭제 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = empService.empProcService2020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 담당업무 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}
