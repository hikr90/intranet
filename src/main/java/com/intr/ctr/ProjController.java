package com.intr.ctr;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.intr.svc.CoreService;
import com.intr.svc.ProjService;
import com.intr.utils.Const;

@Controller
public class ProjController {
	//
	@Autowired
	CoreService coreService;

	@Autowired
	ProjService projService;
	//
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 프로젝트 목록 조회
	@RequestMapping("/intrProjInqy1010.do")
	public String intrProjInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 프로젝트 목록 조회
			//--------------------------------------------------------------------------------------------
			projService.projInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_PROJ + Const.INTR_PROJ_LIST_1010;
	}
	
	// 프로젝트 등록 화면
	@RequestMapping("/intrProjInqy1020.do")
	public String intrProjInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 프로젝트 등록 조회
			//--------------------------------------------------------------------------------------------
			projService.projInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 등록 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_PROJ + Const.INTR_PROJ_DETL_1020;
	}
	
	// 프로젝트 상세화면
	@RequestMapping("/intrProjInqy1030.do")
	public String intrProjInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 프로젝트 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			projService.projInqyService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 상세화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_PROJ + Const.INTR_PROJ_DETL_1010;
	}

	// 프로젝트 수정화면
	@RequestMapping("/intrProjInqy1040.do")
	public String intrProjInqy1040(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 프로젝트 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			projService.projInqyService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 수정화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_PROJ + Const.INTR_PROJ_DETL_1030;
	}
	
	// 프로젝트 등록 처리
	@RequestMapping("/intrProjProc1010.do")
	@ResponseBody
	public String intrProjProc1010(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 등록
			//--------------------------------------------------------------------------------------------
			defaultStr = projService.projProcService1010(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 등록 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 프로젝트 삭제 처리
	@RequestMapping("/intrProjProc1020.do")
	@ResponseBody
	public String intrProjProc1020(Model model, @RequestParam String [] deleteList, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 삭제
			//--------------------------------------------------------------------------------------------
			defaultStr = projService.projProcService1020(model, deleteList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 프로젝트 수정 처리
	@RequestMapping("/intrProjProc1030.do")
	@ResponseBody
	public String intrProjProc1030(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 수정
			//--------------------------------------------------------------------------------------------
			defaultStr = projService.projProcService1030(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 프로젝트 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}
