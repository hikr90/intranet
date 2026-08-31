package com.intr.svc;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface RegsService {
	//
	void regsInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 													// 내부규정 조회
	void regsInqyService1011(Model model, HashMap<String, Object> paramMap, HttpServletResponse response) throws Exception; 	// PDF뷰어 생성

}
