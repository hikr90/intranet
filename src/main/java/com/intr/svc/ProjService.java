package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProjService {
	// 프로젝트
	void projInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception;	// 목록 조회
	void projInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception;	// 등록 조회
	void projInqyService1030(Model model, HashMap<String, Object> paramMap) throws Exception; // 상세 화면 조회
	//
	String projProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 등록
	String projProcService1020(Model model, String[] deleteList) throws Exception; 	// 삭제
	String projProcService1030(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 수정

}
