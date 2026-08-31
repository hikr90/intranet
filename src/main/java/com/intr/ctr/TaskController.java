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
import com.intr.svc.EmpService;
import com.intr.svc.TaskService;
import com.intr.utils.Const;

@Controller
public class TaskController {
	//
	@Autowired
	CoreService coreService;
	
	@Autowired
	TaskService taskService;

	@Autowired
	EmpService empService;
	// 
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 업무일지 조회
	@RequestMapping("/intrTaskInqy1010.do")
	public String intrTaskInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 업무일지 조회
			//--------------------------------------------------------------------------------------------
			taskService.taskInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 작성 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TASK + Const.INTR_TASK_LIST_1010;
	}

	// 업무일지 (AJAX) 조회
	@RequestMapping("/intrTaskInqy1011.do")
	public String intrTaskInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 (AJAX) 조회
			//--------------------------------------------------------------------------------------------
			taskService.taskInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 작성 (AJAX) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TASK + Const.INTR_TASK_LIST_1011;
	}
	
	// 업무일지 목록 조회 화면
	@RequestMapping("/intrTaskInqy2010.do")
	public String intrTaskInqy2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);

			//--------------------------------------------------------------------------------------------
			// 부서 목록 조회
			//--------------------------------------------------------------------------------------------
			empService.empInqyService1040(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 업무일지 목록 조회
			//--------------------------------------------------------------------------------------------
			taskService.taskInqyService2010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무일지 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TASK + Const.INTR_TASK_LIST_2010;
	}
	
	// 업무일지 목록 조회
	@RequestMapping("/intrTaskInqy2020.do")
	public String intrTaskInqy2020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 목록 (AJAX) 조회
			//--------------------------------------------------------------------------------------------
			taskService.taskInqyService2010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 일지 목록 (AJAX) 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TASK + Const.INTR_TASK_LIST_2011;
	}
	
	// 업무일지 상세 조회
	@RequestMapping("/intrTaskInqy2030.do")
	public String intrTaskInqy2030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 업무일지 상세 조회
			//--------------------------------------------------------------------------------------------
			taskService.taskInqyService2020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 상세 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_TASK + Const.INTR_TASK_DETL_1010;
	}
	
	// 업무 캘린더 조회
	@RequestMapping("/intrTaskInqy3010.do")
	public String intrTaskInqy3010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 업무 캘린더 조회
			//--------------------------------------------------------------------------------------------
			taskService.taskInqyService3010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		
		//
		return Const.VIEW_PATH_TASK + Const.INTR_TASK_LIST_3010;
	}
	
	// 업무일지 저장 처리
	@RequestMapping("/intrTaskProc1010.do")
	@ResponseBody
	public String intrTaskProc1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 저장 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = taskService.taskProcService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무일지 저장 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 업무일지 삭제 처리
	@RequestMapping("/intrTaskProc1020.do")
	@ResponseBody
	public String intrTaskProc1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 삭제 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = taskService.taskProcService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무일지 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 업무 캘린더 저장 처리
	@RequestMapping("/intrTaskProc2010.do")
	@ResponseBody
	public String intrTaskProc2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 저장 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = taskService.taskProcService2010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 저장 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 업무 캘린더 수정 처리
	@RequestMapping("/intrTaskProc2020.do")
	@ResponseBody
	public String intrTaskProc2020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 저장 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = taskService.taskProcService2020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 업무 캘린더 삭제 처리
	@RequestMapping("/intrTaskProc2030.do")
	@ResponseBody
	public String intrTaskProc2030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 업무일지 저장 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = taskService.taskProcService2030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 업무 캘린더 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}