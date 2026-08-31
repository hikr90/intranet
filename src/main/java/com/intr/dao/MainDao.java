package com.intr.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intr.vo.EmpVO;

@Repository
public class MainDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 로그인 사용자 조회
	public EmpVO mainInqyDao1010(HashMap<String, Object> paramMap) {
		//
		EmpVO defatulInfo = null;
		defatulInfo = sqlsession.selectOne("main.mainInqyDao1010", paramMap);
		//
		return defatulInfo;
	}
}
