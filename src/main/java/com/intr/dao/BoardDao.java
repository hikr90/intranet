package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 공지사항 시퀀스 조회
	public HashMap<String, Object> boardInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("board.boardInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 공지사항 목록
	public List<HashMap<String, Object>> boardInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("board.boardInqyDao1020", paramMap);
		return defaultList;
	}
	
	// 공지사항 상세 조회
	public HashMap<String, Object> boardInqyDao1030(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("board.boardInqyDao1030", paramMap);
		return defaultInfo;
	}
	
	// 공지사항 등록
	public int boardProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("board.boardProcDao1010", paramMap);
		return resInt;
	}

	// 공지사항 삭제 (수정)
	public int boardProcDao1020(HashMap<String,Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("board.boardProcDao1020", paramMap);
		return resInt;
	}

	// 공지사항 삭제 (삭제)
	public int boardProcDao1030(HashMap<String,Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("board.boardProcDao1030", paramMap);
		return resInt;
	}
	
	// 공지사항 수정
	public int boardProcDao1040(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("board.boardProcDao1040", paramMap);
		return resInt;
	}
	
	// 공지사항 조회수 증가
	public int boardProcDao1050(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("board.boardProcDao1050", paramMap);
		return resInt;
	}
}
