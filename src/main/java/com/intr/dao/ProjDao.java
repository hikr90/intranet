package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 프로젝트 시퀀스 조회
	public HashMap<String, Object> projInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("proj.projInqyDao1010", paramMap);
		return defaultInfo;
	}

	// 프로젝트 목록 조회
	public List<HashMap<String, Object>> projInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("proj.projInqyDao1020", paramMap);
		return defaultList;
	}
	
	// 프로젝트 상세 조회
	public HashMap<String, Object> projInqyDao1030(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("proj.projInqyDao1030", paramMap);
		return defaultInfo;
	}
	
	// 프로젝트 등록 처리
	public int projProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("proj.projProcDao1010", paramMap);
		return resInt;
	}
	
	// 프로젝트 삭제 처리 (삭제)
	public int projProcDao1020(HashMap<String,Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("proj.projProcDao1020", paramMap);
		return resInt;
	}

	// 프로젝트 수정 처리
	public int projProcDao1030(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("proj.projProcDao1030", paramMap);
		return resInt;
	}
}
