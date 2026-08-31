package com.intr.ctr;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.RegsService;
import com.intr.utils.Const;

@Controller
public class RegsController {
	//
	@Autowired
	CoreService coreService;

	@Autowired
	RegsService regsService;
	
	@Autowired
	UtilDao utilDao;
	//
	private final Logger logger = LoggerFactory.getLogger(getClass());

	// 내부규정 조회
	@RequestMapping("/intrRegsInqy1010.do")
	public String intrRegsInqy1010(Model model, @RequestParam HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 내부규정 조회
			//--------------------------------------------------------------------------------------------
			regsService.regsInqyService1010(model, paramMap);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : 내부규정 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
		//
		return Const.VIEW_PATH_REGS + Const.INTR_REGS_DETL_1010;
	}
	
	
	// PDF뷰어 조회
	@RequestMapping("/pdfStream")
	public void pdfStream(Model model, @RequestParam HashMap<String, Object> paramMap, HttpServletResponse response) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// PDF뷰어 조회
			//--------------------------------------------------------------------------------------------
			regsService.regsInqyService1011(model, paramMap, response);
			
		} catch (Exception e) {
			//
			logger.debug("Exception : PDF뷰어 조회 중 에러가 발생했습니다. (" + e.getMessage() + ")");
		}
	}
}
