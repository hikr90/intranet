package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDao {
	//
	@Autowired
	SqlSession sqlsession;
	
	// 사원 인덱스 채번
	public HashMap<String, Object> empInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("emp.empInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 사원 목록
	public List<HashMap<String, Object>> empInqyDao1020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.empInqyDao1020", paramMap);
		return defaultList;
	}
	
	// 사용자 정보 조회 (정보 찾기)
	public HashMap<String, Object> empInqyDao1030(HashMap<String, Object> paramMap) {
		HashMap<String, Object> defatulInfo = null;
		defatulInfo = sqlsession.selectOne("emp.empInqyDao1030", paramMap);
		//
		return defatulInfo;
	}
	
	// 관리자 계정 조회
	public HashMap<String, Object> empInqyDao1040() {
		HashMap<String, Object> defatulInfo = null;
		defatulInfo = sqlsession.selectOne("emp.empInqyDao1040");
		//
		return defatulInfo;
	}
	
	// 부서 목록 조회
	public List<HashMap<String, Object>> intrEmpInqy1021(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy1021", paramMap);
		return defaultList;
	}
	
	// 직급 목록 조회
	public List<HashMap<String, Object>> intrEmpInqy1022(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy1022", paramMap);
		return defaultList;
	}
	
	// 부서 목록 (전체) 조회
	public List<HashMap<String, Object>> intrEmpInqy1023(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy1023", paramMap);
		return defaultList;
	}
	
	// 사원 상세 조회
	public HashMap<String, Object> intrEmpInqy1031(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("emp.intrEmpInqy1031",paramMap);
		return defaultInfo;
	}
	
	// 사원 아이디 중복 조회
	public List<HashMap<String, Object>> intrEmpInqy2021(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy2021", paramMap);
		return defaultList;
	}
	
	// 부서 사원 트리 조회
	public List<HashMap<String, Object>> intrEmpInqy2031(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy2031", paramMap);
		return defaultList;
	}
	
	// 부서 현황
	public List<HashMap<String, Object>> intrEmpInqy2041(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy2041");
		return defaultList;
	}
	
	// 담당업무 조회
	public List<HashMap<String, Object>> intrEmpInqy3011(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy3011", paramMap);
		return defaultList;
	}
	
	// 담당업무 등록 조회
	public HashMap<String, Object> intrEmpInqy3012(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("emp.intrEmpInqy3012",paramMap);
		return defaultInfo;
	}
	
	// 입사 현황
	public List<HashMap<String, Object>> intrEmpInqy4011(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy4011", paramMap);
		return defaultList;
	}
	
	// 인사통계 목록 조회
	public List<HashMap<String, Object>> intrEmpInqy4012(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy4012", paramMap);
		return defaultList;
	}
	
	// 통계 연도 조회
	public List<HashMap<String, Object>> intrEmpInqy4013(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy4013", paramMap);
		return defaultList;
	}
	
	// 통계 연월 조회
	public List<HashMap<String, Object>> intrEmpInqy4014(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("emp.intrEmpInqy4014", paramMap);
		return defaultList;
	}
	
	// 사원 등록
	public int intrEmpProc1011(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("emp.intrEmpProc1011", paramMap);
		return resInt;
	}
	
	// 사원 수정
	public int intrEmpProc1021(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("emp.intrEmpProc1021", paramMap);
		return resInt;
	}
	
	// 사원 복직, 퇴사 처리
	public int intrEmpProc1031(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("emp.intrEmpProc1031", paramMap);
		return resInt;
	}
	
	// 사원 삭제 처리
	public int intrEmpProc1041(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("emp.intrEmpProc1041", paramMap);
		return resInt;
	}
	
	// 사원  비밀번호 수정
	public int intrEmpProc1051(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("emp.intrEmpProc1051", paramMap);
		return resInt;
	}

	// 담당업무 저장 처리
	public int intrEmpProc2011(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("emp.intrEmpProc2011", paramMap);
		return resInt;
	}
	
	// 담당업무 삭제 처리
	public int intrEmpProc2021(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("emp.intrEmpProc2021", paramMap);
		return resInt;
	}
}
