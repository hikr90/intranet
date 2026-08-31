package com.intr.ctr;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.LogService;
import com.intr.utils.Const;

@Controller
public class LogController {
	//
	@Autowired
	CoreService coreService;

	@Autowired
	LogService logService;
	
	@Autowired
	UtilDao utilDao;
	//
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 로그 목록 조회
	@RequestMapping("/intrLogInqy1010.do")
	public String intrLogInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		System.out.println("kth11 : " + paramMap);
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 로그 목록 조회
			//--------------------------------------------------------------------------------------------
			logService.logInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 로그 목록 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_LOG + Const.INTR_LOG_LIST_1010;
	}
}
