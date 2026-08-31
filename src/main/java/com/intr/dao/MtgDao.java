package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MtgDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 회의 시퀀스 조회
	public HashMap<String, Object> mtgInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("mtg.mtgInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 회의 목록 조회
	public List<HashMap<String, Object>> mtgInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("mtg.mtgInqyDao1020", paramMap);
		return defaultList;
	}
	
	// 회의 상세 조회
	public HashMap<String, Object> mtgInqyDao1030(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("mtg.mtgInqyDao1030", paramMap);
		return defaultInfo;
	}
	
	// 회의 중복 조회
	public List<HashMap<String, Object>> mtgInqyDao1040(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("mtg.mtgInqyDao1040", paramMap);
		return defaultList;
	}
	
	// 캘린더 조회
	public List<HashMap<String, Object>> mtgInqyDao2010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("mtg.mtgInqyDao2010", paramMap);
		return defaultList;
	}

	// 캘린더 목록 조회
	public List<HashMap<String, Object>> mtgInqyDao2020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("mtg.mtgInqyDao2020", paramMap);
		return defaultList;
	}
	
	// 회의 등록 처리
	public int mtgProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("mtg.mtgProcDao1010", paramMap);
		return resInt;
	}
	
	// 회의 삭제 처리
	public int mtgProcDao1020(HashMap<String,Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("mtg.mtgProcDao1020", paramMap);
		return resInt;
	}
	
	// 회의 수정 처리
	public int mtgProcDao1030(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("mtg.mtgProcDao1030", paramMap);
		return resInt;
	}	
}
