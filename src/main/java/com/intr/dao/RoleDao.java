package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository
public class RoleDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 권한 목록 조회
	public List<HashMap<String, Object>> roleInqyDao1010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("role.roleInqyDao1010", paramMap);
		return defaultList;
	}

	// 권한 상세 조회
	public HashMap<String, Object> roleInqyDao1020(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("role.roleInqyDao1020", paramMap);
		//
		return defaultInfo;
	}
	
	// 메뉴 권한 목록 조회
	public List<HashMap<String, Object>> roleInqyDao2010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("role.roleInqyDao2010", paramMap);
		return defaultList;
	}
	
	// 사용자 목록 조회
	public List<HashMap<String, Object>> roleInqyDao3010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("role.roleInqyDao3010", paramMap);
		return defaultList;
	}
	
	// 사용자 권한 목록 조회
	public List<HashMap<String, Object>> roleInqyDao4010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("role.roleInqyDao4010", paramMap);
		return defaultList;
	}
	
	// 로그인 권한 사용자 목록 조회
	public List<HashMap<String, Object>> roleInqyDao5010(Model model) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("role.roleInqyDao5010");
		return defaultList;
	}
	
	// 권한 등록
	public int roleProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("role.roleProcDao1010", paramMap);
		return resInt;
	}
	
	// 권한 수정
	public int roleProcDao1020(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("role.roleProcDao1020", paramMap);
		return resInt;
	}
	
	// 권한 삭제 
	public int roleProcDao1030(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("role.roleProcDao1030", paramMap);
		return resInt;
	}

	// 메뉴 권한 삭제 처리
	public int roleProcDao1040(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("role.roleProcDao1040", paramMap);
		return resInt;
	}

	// 메뉴 권한 저장 처리
	public int roleProcDao1050(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("role.roleProcDao1050", paramMap);
		return resInt;
	}
	
	// 사용자 권한 삭제 처리
	public int roleProcDao1060(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("role.roleProcDao1060", paramMap);
		return resInt;
	}
	
	// 사용자 권한 저장 처리
	public int roleProcDao1070(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("role.roleProcDao1070", paramMap);
		return resInt;
	}
}
