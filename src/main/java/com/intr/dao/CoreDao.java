package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CoreDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 메뉴 조회
	public List<HashMap<String, Object>> coreInqyDao1010(HashMap<String,Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("core.coreInqyDao1010", paramMap);
		return defaultList;
	}

	// 전체 메뉴 조회
	public List<HashMap<String, Object>> coreInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("core.coreInqyDao1020", paramMap);
		return defaultList;
	}
	
	// 목록 수 조회
	public List<HashMap<String, Object>> coreInqyDao1030(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("core.coreInqyDao1030", paramMap);
		return defaultList;
	}
}
