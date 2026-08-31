package com.intr.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BanrDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 배너 채번
	public HashMap<String, Object> banrInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("banr.banrInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 배너 조회
	public HashMap<String, Object> banrInqyDao1020(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("banr.banrInqyDao1020", paramMap);
		return defaultInfo;
	}
	
	// 배너 조회 (메인)
	public HashMap<String, Object> banrInqyDao1030(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("banr.banrInqyDao1030", paramMap);
		return defaultInfo;
	}
	
	// 배너 저장 (등록)
	public int banrProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("banr.banrProcDao1010", paramMap);
		return resInt;
	}
	
	// 배너 저장 (수정)
	public int banrProcDao1020(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("banr.banrProcDao1020", paramMap);
		return resInt;
	}

	// 배너 삭제 (수정)
	public int banrProcDao1030(HashMap<String,Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("banr.banrProcDao1030", paramMap);
		return resInt;
	}
}
