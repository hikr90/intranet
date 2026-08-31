package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.intr.dao.LogDao;
import com.intr.dao.UtilDao;
import com.intr.svc.LogService;
import com.intr.svc.UtilService;

@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl implements LogService {
	//
	@Autowired
	UtilService utilService;
	
	@Autowired
	UtilDao utilDao;
	
	@Autowired
	LogDao logDao;
	
	// 로그 목록 조회
	public void logInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 페이징 처리
			//--------------------------------------------------------------------------------------------
			utilService.setPaging(model, paramMap);

			//--------------------------------------------------------------------------------------------
			// 로그 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = logDao.logInqyDao1020(paramMap);
			model.addAttribute("defaultList",defaultList);
			
			//--------------------------------------------------------------------------------------------
			// 공통코드 (유형) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Proc", "procList");
			
		} catch (Exception e) {
			//
			throw e;
		}
	}

	@Override
	public void logProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 로그 채번
			//--------------------------------------------------------------------------------------------
			defaultInfo = logDao.logInqyDao1010(paramMap);
			paramMap.put("sequenceId", (String)defaultInfo.get("sequenceId"));
			
			//--------------------------------------------------------------------------------------------
			// 로그 등록
			//--------------------------------------------------------------------------------------------
			logDao.logProcDao1010(paramMap);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
}
