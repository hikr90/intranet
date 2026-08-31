package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EmpService {
	// 사원 정보
	void empInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 목록 조회
	void empInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 부서 직급 조회
	void empInqyService1030(Model model, HashMap<String, Object> paramMap) throws Exception;		// 상세 조회
	void empInqyService1040(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 부서 (전체) 조회
	//
	String empInqyService2020(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 사원 아이디 중복 조회
	void empInqyService2030(Model model, HashMap<String, Object> paramMap) throws Exception;		// 부서 사원 트리 조회
	void empInqyService2040(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 부서 사원 수 조회
	//
	void empInqyService3010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 담당업무 조회
	void empInqyService3011(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 담당업무 조회 (AJAX)
	void empInqyService3012(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 담당업무 등록 조회 (AJAX)
	//
	void empInqyService4010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 인사통계 목록 조회
	
	// 사원 관리
	String empProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 등록
	String empProcService1020(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; 	// 수정
	String empProcService1030(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 복직, 퇴사
	String empProcService1040(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 삭제
	String empProcService1050(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 사원 비밀번호 수정
	//
	String empProcService2010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 담당업무 저장
	String empProcService2020(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 담당업무 삭제
}
