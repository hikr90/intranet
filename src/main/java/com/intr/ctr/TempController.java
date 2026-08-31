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

import com.intr.svc.CoreService;
import com.intr.svc.TempService;
import com.intr.utils.Const;

@Controller
public class TempController {
	//
	@Autowired
	CoreService coreService;
	
	@Autowired
	TempService tempService;
	//
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 기안문 양식 목록 화면
	@RequestMapping("/intrTempInqy1010.do")
	public String intrTempInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 기안문 양식 목록 조회
			//--------------------------------------------------------------------------------------------
			tempService.tempInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 기안문 양식 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TEMP + Const.INTR_TEMP_LIST_1010;
	}

	// 기안문 양식 트리 목록 화면
	@RequestMapping("/intrTempInqy1011.do")
	public String intrTempInqy1011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);

			//--------------------------------------------------------------------------------------------
			// 기안문 양식 목록 조회
			//--------------------------------------------------------------------------------------------
			tempService.tempInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 기안문 양식 트리 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TEMP + Const.INTR_TEMP_LIST_1011;
	}
	
	// 기안문 양식 상세 화면
	@RequestMapping("/intrTempInqy1020.do")
	public String intrTempInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 기안문 양식 상세 조회
			//--------------------------------------------------------------------------------------------
			tempService.tempInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 기안문 양식 상세 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TEMP + Const.INTR_TEMP_DETL_1010;
	}
	
	// 기안문 양식 수정 처리
	@RequestMapping("/intrTempProc1010.do")
	@ResponseBody
	public String intrTempProc1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 기안문 양식 수정 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = tempService.tempProcService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 기안문 양식 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}