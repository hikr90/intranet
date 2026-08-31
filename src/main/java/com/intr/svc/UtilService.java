package com.intr.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface UtilService {
	// 공통
	boolean isNull(String param) throws Exception;
	String nvlProc(String param) throws Exception;
	
	// 페이지
	void setPaging(Model model, HashMap<String, Object> paramMap) throws Exception; // 페이징 처리
	String setPageMenu(HashMap<String, Object> paramMap) throws Exception; // 페이징 목록 생성
	String setPageUrl(HashMap<String, Object> paramMap) throws Exception; // 페이지 URL 생성
	
	// 파일 경로 생성
	String setFilePath(HashMap<String, Object> paramMap) throws Exception; 	// 일반 경로
	String setTempPath(HashMap<String, Object> paramMap) throws Exception; // 임시 경로
	String setBasePath(String basePath, String filetypeCd) throws Exception; 	// 기본 경로
	
	// 파일 업로드
	String fileUpload(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception; // 업로드

	// 다운로드
	void fileDown(Model model, HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception; // 단건
	void docDown(Model model, HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception; // 참고문서
	void zipDown(Model model, HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception; // 전체
	void excelDown(List<Map<String, Object>> defaultList, HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception; // 엑셀
	
	// 공통 코드 조회
	void getCodeList(Model model, String groupCd, String modelNm) throws Exception;
	
	// 메일 전송
	String sendMail(Model model, HashMap<String, Object> paramMap) throws Exception;
	
	// 암복호화
	String encryptProc(String encryptedText) throws Exception;
	String decryptProc(String encryptedText) throws Exception;
}
