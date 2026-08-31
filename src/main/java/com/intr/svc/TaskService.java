package com.intr.svc;

import java.util.HashMap;

import org.springframework.ui.Model;

public interface TaskService {
	// 업무
	void taskInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 업무 작성
	void taskInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 업무 작성 (AJAX)
	void taskInqyService2010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 업무 조회
	void taskInqyService2020(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 업무 상세
	void taskInqyService3010(Model model, HashMap<String, Object> paramMap) throws Exception; 		// 업무 캘린더 조회
	//
	String taskProcService1010(Model model, HashMap<String,Object> paramMapt) throws Exception; 	// 업무일지 저장
	String taskProcService1020(Model model, HashMap<String,Object> paramMapt) throws Exception; 	// 업무일지 삭제
	String taskProcService2010(Model model, HashMap<String,Object> paramMapt) throws Exception; 	// 업무 캘린더 등록
	String taskProcService2020(Model model, HashMap<String,Object> paramMapt) throws Exception; 	// 업무 캘린더 수정
	String taskProcService2030(Model model, HashMap<String,Object> paramMapt) throws Exception; 	// 업무 캘린더 삭제
}
