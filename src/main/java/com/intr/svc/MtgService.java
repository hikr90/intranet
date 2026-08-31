package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MtgService {
	// 회의
	void mtgInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception;	// 목록 조회
	void mtgInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception;	// 등록 조회
	void mtgInqyService1030(Model model, HashMap<String, Object> paramMap) throws Exception; // 상세 화면 조회
	void mtgInqyService1091(Model model, HashMap<String, Object> paramMap) throws Exception; // 회의 중복 조회
	
	void mtgInqyService2010(Model model, HashMap<String, Object> paramMap) throws Exception;	// 캘린더 조회
	void mtgInqyService2020(Model model, HashMap<String, Object> paramMap) throws Exception;	// 캘린더 목록 조회

	String mtgProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 등록
	String mtgProcService1020(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 삭제
	String mtgProcService1030(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 수정
}
