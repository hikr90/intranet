package com.intr.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AprvDao {
	//
	@Autowired
	SqlSession sqlsession;

	// 전자결재 시퀀스 조회
	public HashMap<String, Object> aprvInqyDao1010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("aprv.aprvInqyDao1010", paramMap);
		return defaultInfo;
	}
	
	// 결재선 시퀀스 조회
	public HashMap<String, Object> aprvInqyDao1020(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("aprv.aprvInqyDao1020", paramMap);
		return defaultInfo;
	}
	
	// 기안 목록 조회
	public List<HashMap<String, Object>> aprvInqyDao1030(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao1030", paramMap);
		return defaultList;
	}
	
	// 결재 상세 조회
	public HashMap<String, Object> aprvInqyDao1040(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("aprv.aprvInqyDao1040", paramMap);
		return defaultInfo;
	}
	
	// 결재선 조회
	public List<HashMap<String, Object>> aprvInqyDao1050(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao1050", paramMap);
		return defaultList;
	}
	
	// 물품 등록 조회
	public List<HashMap<String, Object>> aprvInqyDao1060(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao1060", paramMap);
		return defaultList;
	}
	
	// 정산내역 조회
	public List<HashMap<String, Object>> aprvInqyDao1070(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao1070", paramMap);
		return defaultList;
	}
	
	// 결재 조회
	public HashMap<String, Object> aprvInqyDao2010(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("aprv.aprvInqyDao2010", paramMap);
		return defaultInfo;
	}
	
	// 다음 결재 조회
	public HashMap<String, Object> aprvInqyDao2020(HashMap<String, Object> paramMap) {
		//
		HashMap<String, Object> defaultInfo = null;
		defaultInfo = sqlsession.selectOne("aprv.aprvInqyDao2020", paramMap);
		return defaultInfo;
	}

	// 기안문 양식 조회
	public List<HashMap<String, Object>> aprvInqyDao2030(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao2030", paramMap);
		return defaultList;
	}
	
	// 일정 관리 조회
	public List<HashMap<String, Object>> aprvInqyDao3010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao3010", paramMap);
		return defaultList;
	}
	
	// 결재선 관리 조회
	public List<HashMap<String, Object>> aprvInqyDao4010(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao4010", paramMap);
		return defaultList;
	}
	
	// 결재선 상세 조회
	public List<HashMap<String, Object>> aprvInqyDao4020(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao4020", paramMap);
		return defaultList;
	}
	
	// 결재 타입 조회
	public List<HashMap<String, Object>> aprvInqyDao4030(HashMap<String, Object> paramMap) {
		//
		List<HashMap<String, Object>> defaultList = null;
		defaultList = sqlsession.selectList("aprv.aprvInqyDao4030", paramMap);
		return defaultList;
	}
	
	// 결재 마스터 등록 (APRV_MAST)
	public int aprvProcDao1010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao1010", paramMap);
		return resInt;
	}
	
	// 결재 이력 등록 (APRV_HIST)
	public int aprvProcDao1020(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao1020", paramMap);
		return resInt;
	}
	
	// 현재 단계, 번호 수정 (APRV_HIST)
	public int aprvProcDao1030(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("aprv.aprvProcDao1030", paramMap);
		return resInt;
	}
	
	// 휴가 신청서 등록 (APRV_REL_LEAV)
	public int aprvProcDao1040(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao1040", paramMap);
		return resInt;
	}
	
	// 가지급결의서 등록 (APRV_REL_EXP)
	public int aprvProcDao1050(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao1050", paramMap);
		return resInt;
	}
	
	// 물품반출입 신청서 등록 (APRV_REL_ITEM)
	public int aprvProcDao1060(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao1060", paramMap);
		return resInt;
	}
	
	// 법인카드 정산서 등록 (APRV_REL_CORP)
	public int aprvProcDao1070(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao1070", paramMap);
		return resInt;
	}
	
	// 결재 단계 수정
	public int aprvProcDao2010(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("aprv.aprvProcDao2010", paramMap);
		return resInt;
	}

	// 결재 처리 유형 수정
	public int aprvProcDao2020(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("aprv.aprvProcDao2020", paramMap);
		return resInt;
	}
	
	// 결재 일련번호 수정
	public int aprvProcDao2030(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("aprv.aprvProcDao2030", paramMap);
		return resInt;
	}
	
	// 결재선 마스터 등록
	public int aprvProcDao2040(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao2040", paramMap);
		return resInt;
	}
	
	// 결재선 상세 등록
	public int aprvProcDao2050(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.insert("aprv.aprvProcDao2050", paramMap);
		return resInt;
	}
	
	// 결재선 마스터 수정
	public int aprvProcDao2060(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.update("aprv.aprvProcDao2060", paramMap);
		return resInt;
	}
	
	// 결재선 마스터 삭제
	public int aprvProcDao2070(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("aprv.aprvProcDao2070", paramMap);
		return resInt;
	}
	
	// 결재선 상세 삭제
	public int aprvProcDao2080(HashMap<String, Object> paramMap) {
		//
		int resInt = 0;
		resInt = sqlsession.delete("aprv.aprvProcDao2080", paramMap);
		return resInt;
	}
}
