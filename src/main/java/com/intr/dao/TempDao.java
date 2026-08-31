package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TempDao {
	//
	@Autowired
	SqlSession sqlsession;

	// 기안문 양식 목록 조회
	public List<HashMap<String, Object>> tempInqyDao1010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("temp.tempInqyDao1010", paramMap);
		return defaultList;
	}
	
	// 기안문 양식 상세 조회
	public HashMap<String, Object> tempInqyDao1020(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("temp.tempInqyDao1020", paramMap);
		//
		return defaultInfo;
	}
	
	// 기안문 양식 수정
	public int tempProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("temp.tempProcDao1010", paramMap);
		return resInt;
	}
}
