package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.intr.dao.TempDao;
import com.intr.svc.MainService;
import com.intr.svc.TempService;

@Service
@Transactional(rollbackFor = Exception.class)
public class TempServiceImpl implements TempService{
	//
	@Autowired
	TempDao tempDao;
	
	@Autowired
	MainService mainService;
	
	// 기안문 양식 목록 조회
	public void tempInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 기안문 양식 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = tempDao.tempInqyDao1010(paramMap);
			model.addAttribute("defaultList", defaultList);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 기안문 양식 상세 조회
	public void tempInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 기안문 양식 상세 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = tempDao.tempInqyDao1020(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 기안문 양식 수정
	public String tempProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 기안문 양식 수정
			//--------------------------------------------------------------------------------------------
			resInt = tempDao.tempProcDao1010(paramMap);
			//
			if(resInt>0) {
				resStr = "YES";
			}
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
}
