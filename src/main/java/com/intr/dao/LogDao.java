package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LogDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 로그 시퀀스 조회
	public HashMap<String, Object> logInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("log.logInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 로그 목록
	public List<HashMap<String, Object>> logInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("log.logInqyDao1020", paramMap);
		return defaultList;
	}
	
	// 로그 등록
	public int logProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("log.logProcDao1010", paramMap);
		return resInt;
	}
	
	// 로그 상세 조회
	public HashMap<String, Object> logInqyDao1030(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("log.logInqyDao1030", paramMap);
		return defaultInfo;
	}
}
