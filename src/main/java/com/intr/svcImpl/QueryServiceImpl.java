package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.intr.dao.QueryDao;
import com.intr.svc.QueryService;
import com.intr.svc.UtilService;

@Service
@Transactional(rollbackFor = Exception.class)
public class QueryServiceImpl implements QueryService{
	//
	@Autowired
	UtilService utilService;
	
	@Autowired
	QueryDao queryDao;
	
	// 쿼리 화면 조회
	public void queryInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 쿼리 화면 조회
			//--------------------------------------------------------------------------------------------
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 쿼리 결과 조회
	public void queryInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		Set<String> colList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 쿼리 화면 조회
			//--------------------------------------------------------------------------------------------
			defaultList = queryDao.queryInqyDao1010(paramMap);
			
			if(defaultList!=null && !defaultList.isEmpty()) {
				colList = defaultList.get(0).keySet();
				//
				model.addAttribute("colList",colList);
				model.addAttribute("dataList",defaultList);
			} else {
				model.addAttribute("resMsg", "쿼리 조회 결과가 없습니다.");
			}
			
		} catch (Exception e) {
			//
			model.addAttribute("resMsg", "입력한 쿼리를 실행할 수 없습니다. 쿼리 문법 또는 테이블/컬럼을 확인해주세요.");
			throw e;
		}
	}

	// 엑셀 다운로드
	public void queryInqyService1030(HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		List<Map<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 엑셀 다운로드
			//--------------------------------------------------------------------------------------------
			defaultList = queryDao.queryInqyDao1020(paramMap);
			utilService.excelDown(defaultList, paramMap, request, response);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 쿼리 입력 처리
	public String queryProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String query = (String)paramMap.get("query");
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 쿼리 입력 처리
			//--------------------------------------------------------------------------------------------
			paramMap.put("query", query.replaceAll(";", ""));
			resInt = queryDao.queryProcDao1010(paramMap);
					
			// 처리된 건이 없는 경우 빈 값으로 결과 전송
			if(resInt>0) {
				defaultStr = "Yes";
			}
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'resInt':'%d'}]", resInt);			
					
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
}
