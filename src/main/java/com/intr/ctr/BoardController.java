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

import com.intr.svc.BoardService;
import com.intr.svc.CoreService;
import com.intr.utils.Const;

@Controller
public class BoardController {
	//
	@Autowired
	CoreService coreService;
	
	@Autowired
	BoardService boardService;
	// 
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 공지사항 목록 화면
	@RequestMapping("/intrBoardInqy1010.do")
	public String intrBoardInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공지사항 목록 조회
			//--------------------------------------------------------------------------------------------
			boardService.boardInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_BOARD + Const.INTR_BOARD_LIST_1010;
	}
	
	// 공지사항 등록 화면
	@RequestMapping("/intrBoardInqy1020.do")
	public String intrBoardInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 등록 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_BOARD + Const.INTR_BOARD_DETL_1020;
	}
	
	// 공지사항 상세화면
	@RequestMapping("/intrBoardInqy1030.do")
	public String intrBoardInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공지사항 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			boardService.boardInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 상세화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_BOARD + Const.INTR_BOARD_DETL_1010;
	}

	// 공지사항 수정화면
	@RequestMapping("/intrBoardInqy1040.do")
	public String intrBoardInqy1040(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공지사항 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			boardService.boardInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 수정화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_BOARD + Const.INTR_BOARD_DETL_1030;
	}
	
	// 공지사항 목록 조회
	@RequestMapping("/intrBoardInqy2010.do")
	public String intrBoardInqy2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공지사항 목록 조회
			//--------------------------------------------------------------------------------------------
			boardService.boardInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_BOARD + Const.INTR_BOARD_LIST_2010;
	}
	
	// 공지사항 상세 조회
	@RequestMapping("/intrBoardInqy2020.do")
	public String intrBoardInqy2020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 공지사항 상세화면 조회 
			//--------------------------------------------------------------------------------------------
			boardService.boardInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 상세 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_BOARD + Const.INTR_BOARD_DETL_2010;
	}
	
	// 공지사항 등록 처리
	@RequestMapping("/intrBoardProc1010.do")
	@ResponseBody
	public String intrBoardProc1010(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 공지사항 등록
			//--------------------------------------------------------------------------------------------
			defaultStr = boardService.boardProcService1010(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 등록 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 공지사항 삭제 처리
	@RequestMapping("/intrBoardProc1020.do")
	@ResponseBody
	public String intrBoardProc1020(Model model, @RequestParam String [] deleteList, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 공지사항 삭제
			//--------------------------------------------------------------------------------------------
			defaultStr = boardService.boardProcService1020(model, deleteList);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 공지사항 수정 처리
	@RequestMapping("/intrBoardProc1030.do")
	@ResponseBody
	public String intrBoardProc1030(Model model, @RequestParam HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 공지사항 수정
			//--------------------------------------------------------------------------------------------
			defaultStr = boardService.boardProcService1030(model, paramMap, request);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 공지사항 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}