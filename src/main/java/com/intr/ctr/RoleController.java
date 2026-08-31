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

import com.intr.svc.RoleService;
import com.intr.svc.CoreService;
import com.intr.utils.Const;

@Controller
public class RoleController {
	//
	@Autowired
	CoreService coreService;

	@Autowired
	RoleService roleService;
	//
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 권한 목록 조회
	@RequestMapping("/intrRoleInqy1010.do")
	public String intrRoleInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_LIST_1010;
	}

	// 권한 트리 목록 화면
	@RequestMapping("/intrRoleInqy1011.do")
	public String intrRoleInqy1011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 트리 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_LIST_1011;
	}
	
	// 권한 등록 화면
	@RequestMapping("/intrRoleInqy1020.do")
	public String intrRoleInqy1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 등록 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_DETL_1020;
	}
	
	// 권한 상세 화면
	@RequestMapping("/intrRoleInqy1030.do")
	public String intrRoleInqy1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 상세 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 상세 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_DETL_1010;
	}
	
	// 권한 수정 화면
	@RequestMapping("/intrRoleInqy1040.do")
	public String intrRoleInqy1040(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 상세 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 수정 화면 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_DETL_1030;
	}
	
	// 권한 목록 조회
	@RequestMapping("/intrRoleInqy2010.do")
	public String intrRoleInqy2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 메뉴 목록 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 메뉴 권한 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_LIST_2010;
	}
	
	// 메뉴 권한 목록 조회
	@RequestMapping("/intrRoleInqy2011.do")
	public String intrRoleInqy2011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 메뉴 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService2010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 메뉴 권한 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_LIST_2011;
	}
	
	// 사용자 권한 목록 조회
	@RequestMapping("/intrRoleInqy3010.do")
	public String intrRoleInqy3010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 사용자 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService3010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사용자 권한 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_LIST_3010;
	}
	
	// 사용자 권한 트리 목록 화면
	@RequestMapping("/intrRoleInqy3011.do")
	public String intrRoleInqy3011(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 사용자 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			roleService.roleInqyService4010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사용자 권한 트리 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_ROLE + Const.INTR_ROLE_LIST_3011;
	}
	
	// 권한 등록 처리
	@RequestMapping("/intrRoleProc1010.do")
	@ResponseBody
	public String intrRoleProc1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 등록
			//--------------------------------------------------------------------------------------------
			defaultStr = roleService.roleProcService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 등록 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	
	// 권한 수정 처리
	@RequestMapping("/intrRoleProc1020.do")
	@ResponseBody
	public String intrRoleProc1020(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 수정 처리
			//--------------------------------------------------------------------------------------------
			defaultStr = roleService.roleProcService1020(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 수정 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}

	// 권한 삭제 처리
	@RequestMapping("/intrRoleProc1030.do")
	@ResponseBody
	public String intrRoleProc1030(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 삭제
			//--------------------------------------------------------------------------------------------
			defaultStr = roleService.roleProcService1030(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 권한 삭제 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 메뉴 권한 저장 처리
	@RequestMapping("/intrRoleProc2010.do")
	@ResponseBody
	public String intrRoleProc2010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 권한 저장
			//--------------------------------------------------------------------------------------------
			defaultStr = roleService.roleProcService1040(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 메뉴 권한 저장 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
	
	// 사용자 권한 저장 처리
	@RequestMapping("/intrRoleProc3010.do")
	@ResponseBody
	public String intrRoleProc3010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사용자 권한 저장
			//--------------------------------------------------------------------------------------------
			defaultStr = roleService.roleProcService1050(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 사용자 권한 저장 처리 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return defaultStr;
	}
}
