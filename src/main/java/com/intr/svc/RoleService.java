package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface RoleService {
	// 권한
	void roleInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 권한 목록 조회
	void roleInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 권한 상세 조회
	
	// 메뉴 권한
	void roleInqyService2010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 메뉴 권한 목록 조회
	
	// 사용자 권한
	void roleInqyService3010(Model model, HashMap<String, Object> paramMap) throws Exception;		// 사용자 목록 조회
	void roleInqyService4010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 사용자 권한 목록 조회
	
	// 권한
	String roleProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 등록
	String roleProcService1020(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 수정
	String roleProcService1030(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 삭제
	String roleProcService1040(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 메뉴 권한 저장
	String roleProcService1050(Model model, HashMap<String, Object> paramMap) throws Exception; 	// 사용자 권한 저장
}
