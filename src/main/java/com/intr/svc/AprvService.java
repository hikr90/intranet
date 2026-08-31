package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AprvService {
	// 결재
	void aprvInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 기안 목록
	HashMap<String, Object> aprvInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception;	// 기안 등록 양식
	//
	void aprvInqyService2010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 결재 목록
	void aprvInqyService2020(Model model, HashMap<String, Object> paramMap) throws Exception;		// 결재 상세
	//
	void aprvInqyService3010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 일정 관리
	//
	void aprvInqyService4010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 결재선 관리
	void aprvInqyService4020(Model model, HashMap<String, Object> paramMap) throws Exception;		// 결재선 등록
	void aprvInqyService4030(Model model, HashMap<String, Object> paramMap) throws Exception;		// 결재선 상세
	//
	String aprvProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 기안 등록
	void aprvProcService2010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 기본 정보 처리
	void aprvProcService2020(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 양식 유형 처리
	String aprvProcService3010(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 결재 처리
	//
	String aprvProcService4010(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 결재선 저장 처리
	String aprvProcService4020(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 결재선 삭제 처리
}
