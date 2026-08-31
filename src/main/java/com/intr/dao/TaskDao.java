package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDao {
	//
	@Autowired
	SqlSession sqlsession;

	// 업무일지 시퀀스 조회
	public HashMap<String, Object> taskInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("task.taskInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 업무일지 작성 조회
	public List<HashMap<String, Object>> taskInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("task.taskInqyDao1020", paramMap);
		return defaultList;
	}

	// 업무일지 목록 조회
	public List<HashMap<String, Object>> taskInqyDao2010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("task.taskInqyDao2010", paramMap);
		return defaultList;
	}
	
	// 업무일지 상세 조회
	public List<HashMap<String, Object>> taskInqyDao2020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("task.taskInqyDao2020", paramMap);
		return defaultList;
	}
	
	// 업무 캘린더 조회
	public List<HashMap<String, Object>> taskInqyDao3010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("task.taskInqyDao3010", paramMap);
		return defaultList;
	}
	
	// 업무 캘린더 상세
	public HashMap<String, Object> taskInqyDao3020(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("task.taskInqyDao3020", paramMap);
		return defaultInfo;
	}
	
	// 업무 캘린더 (메인) 조회
	public List<HashMap<String, Object>> taskInqyDao3030(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("task.taskInqyDao3030", paramMap);
		return defaultList;
	}
	
	// 업무일지 등록
	public int taskProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("task.taskProcDao1010", paramMap);
		return resInt;
	}
	
	// 업무일지 삭제
	public int taskProcDao1020(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("task.taskProcDao1020", paramMap);
		return resInt;
	}
	
	// 업무 캘린더 등록
	public int taskProcDao2010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("task.taskProcDao2010", paramMap);
		return resInt;
	}
	
	// 업무 캘린더 수정
	public int taskProcDao2020(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("task.taskProcDao2020", paramMap);
		return resInt;
	}
	
	// 업무 캘린더 삭제
	public int taskProcDao2030(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("task.taskProcDao2030", paramMap);
		return resInt;
	}
}
