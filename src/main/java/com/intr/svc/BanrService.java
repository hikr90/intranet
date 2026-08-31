package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BanrService {
	// 배너
	void banrInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception;	// 배너 관리
	//
	String banrProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 저장
	String banrProcService1020(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 삭제

}
