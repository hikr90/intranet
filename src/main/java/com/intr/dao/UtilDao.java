package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UtilDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 다건 파일 조회
	public List<HashMap<String, Object>> fileInqyDao1010(HashMap<String, Object> paramMap) {
		// 
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("util.fileInqyDao1010",paramMap);
		return defaultList;
	}
	
	// 단건 파일 조회
	public HashMap<String, Object> fileInqyDao1020(HashMap<String, Object> paramMap) {
		// 
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("util.fileInqyDao1020",paramMap);
		return defaultInfo;
	}
	
	// 파일 등록 처리
	public int fileProcDao1010(HashMap<String, Object> tempMap) {
		//
		int res = 0;
		res = sqlsession.insert("util.fileProcDao1010", tempMap);
		return res;
	}
	
	// 파일 삭제 처리 (수정)
	public int fileProcDao1020(HashMap<String, Object> paramMap) {
		//
		int res = 0;
		res = sqlsession.update("util.fileProcDao1020", paramMap);
		return res;
	}
	
	// 파일 삭제 처리 (삭제)
	public int fileProcDao1030(HashMap<String, Object> paramMap) {
		//
		int res = 0;
		res = sqlsession.update("util.fileProcDao1030", paramMap);
		return res;
	}
	
	// 공통코드 조회
	public List<HashMap<String, Object>> codeInqyDao1010(HashMap<String, Object> paramMap) {
		// 
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("util.codeInqyDao1010",paramMap);
		return defaultList;
	}
}
