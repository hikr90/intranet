package com.intr.svc;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface QueryService {
	// 쿼리
	void queryInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception;			// 입력 조회
	void queryInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception;	// 결과 조회
	void queryInqyService1030(HashMap<String, Object> paramMap, HttpServletRequest reqeust, HttpServletResponse response) throws Exception;	// 엑셀 다운로드
	
	String queryProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception;	// 입력 처리
}
