package com.intr.ctr;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.intr.dao.MtgDao;
import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.MtgService;
import com.intr.svc.UtilService;
import com.intr.utils.Const;

@Controller
public class MtgController {
	//
	@Autowired
	CoreService coreService;

	@Autowired
	UtilService utilService;
	
	@Autowired
	MtgService mtgService;
	
	@Autowired
	UtilDao utilDao;
	
	@Autowired
	MtgDao mtgDao;
	//
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 회의 목록 조회
	@RequestMapping("/intrMtgInqy1010.do")
	public String intrMtgInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 회의 목록 조회
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공통코드 (회의실 종류) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Loc", "locList");
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MTG + Const.INTR_MTG_LIST_1010;
	}
	
	// 회의 등록 조회
	@RequestMapping("/intrMtgInqy1020.do")
	public String intrMtgInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 중복 회의 시간 조회
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService1091(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공통코드 (회의실 종류) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Loc", "locList");
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 등록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MTG + Const.INTR_MTG_DETL_1020;
	}
	
	// 회의 상세화면
	@RequestMapping("/intrMtgInqy1030.do")
	public String intrMtgInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 회의 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 상세화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MTG + Const.INTR_MTG_DETL_1010;
	}
	
	// 회의 중복 조회
	@RequestMapping("/intrMtgInqy1090.do")
	@ResponseBody
	public List<HashMap<String, Object>> intrMtgInqy1090(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 중복 조회
			//--------------------------------------------------------------------------------------------
			defaultList = mtgDao.mtgInqyDao1040(paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 상세화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultList;
	}
	
	// 회의 수정화면
	@RequestMapping("/intrMtgInqy1040.do")
	public String intrMtgInqy1040(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 회의 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService1030(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 중복 회의 시간 조회
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService1091(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공통코드 (회의실 종류) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Loc", "locList");
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 수정화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MTG + Const.INTR_MTG_DETL_1030;
	}
	
	// 캘린더 목록 조회
	@RequestMapping("/intrMtgInqy2010.do")
	public String intrMtgInqy2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 캘린더 목록 조회
			//--------------------------------------------------------------------------------------------
			mtgService.mtgInqyService2010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 캘린더 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_MTG + Const.INTR_MTG_DETL_2010;
	}

	// 회의 등록 처리
	@RequestMapping("/intrMtgProc1010.do")
	@ResponseBody
	public String intrMtgProc1010(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 등록
			//--------------------------------------------------------------------------------------------
			defaultStr = mtgService.mtgProcService1010(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 등록 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 회의 삭제 처리
	@RequestMapping("/intrMtgProc1020.do")
	@ResponseBody
	public String intrMtgProc1020(Model model, @RequestParam String sequenceId, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		paramMap.put("sequenceId", sequenceId);
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 삭제
			//--------------------------------------------------------------------------------------------
			defaultStr = mtgService.mtgProcService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 회의 수정 처리
	@RequestMapping("/intrMtgProc1030.do")
	@ResponseBody
	public String intrMtgProc1030(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 수정
			//--------------------------------------------------------------------------------------------
			defaultStr = mtgService.mtgProcService1030(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 회의 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}
