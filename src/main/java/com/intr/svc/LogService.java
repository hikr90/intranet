package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface LogService {
	// 로그
	void logInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 목록 조회
	void logProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 저장
}
