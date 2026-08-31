package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface MainService {
	//
	void mainInqyService1010(Model model) throws Exception; 	// 로그인 권한 사용자 조회
	String mainProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 사용자 조회
}
