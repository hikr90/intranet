package com.intr.utils;

public class Const {
	//--------------------------------------------------------------------------------------------
	// 공통
	//--------------------------------------------------------------------------------------------
	public static final String USER 		= "0"; 			// 사용자
	public static final String ADMIN 	= "1"; 			// 관리자
	
	public static final String STEP_PROG 		= "STEP_0010"; 			// 결재진행중
	public static final String STEP_COMP 		= "STEP_0020"; 			// 결재완료
	public static final String STEP_REJT 		= "STEP_0030"; 			// 결재반송
	public static final String STEP_CANC 		= "STEP_0040"; 			// 결재취소
	
	public static final String TYPE_DRFT 		= "TYPE_0010"; 			// 기안
	public static final String TYPE_APRV 		= "TYPE_0020"; 			// 결재
	public static final String TYPE_REFR 		= "TYPE_0030"; 			// 참조
	
	public static final String RSLT_0010 		= "RSLT_0010"; 			// 승인
	public static final String RSLT_0020 		= "RSLT_0020"; 			// 반송
	public static final String RSLT_0030 		= "RSLT_0030"; 			// 취소
	
	public static final String LOG_INQY 		= "PROC_0010"; 			// 조회
	public static final String LOG_PROC 		= "PROC_0020"; 			// 처리

	public static final String LOG_SUCC 		= "Y"; 				// 성공
	public static final String LOG_FAIL 		= "N"; 				// 실패
	
	public static final String TEMP_LEAV 		= "Leav"; 			// 휴가 신청서
	public static final String TEMP_EXP 		= "Exp"; 			// 가지급결의서
	public static final String TEMP_ITEM 		= "Item"; 			// 물품반출입 신청서
	public static final String TEMP_CORP 		= "Corp"; 			// 법인카드 정산서
	
	//--------------------------------------------------------------------------------------------
	// 매뉴얼
	//--------------------------------------------------------------------------------------------
	public static final String MANU_WORD  = "intr_table.docx"; 		// WORD
	public static final String MANU_EXCEL  = "intr_data.xlsx"; 		// EXCEL
	public static final String MANU_PPT  = "intr_project.pptx"; 		// PPT
	
	//--------------------------------------------------------------------------------------------
	// 내부규정
	//--------------------------------------------------------------------------------------------
	public static final String TAB_CORP  = "corp"; 		// 사규 (탭)
	public static final String TAB_HRM  = "hrm"; 			// 인사관리 (탭)
	public static final String TAB_WEL  = "wel"; 			// 복리후생 (탭)
	
	public static final String RULE_CORP  = "rule_corp.pdf"; 	// 사규
	public static final String RULE_HRM  = "rule_hrm.pdf";		// 인사관리
	public static final String RULE_WEL  = "rule_wel.pdf"; 		// 복리후생
	
	//--------------------------------------------------------------------------------------------
	// 페이징
	//--------------------------------------------------------------------------------------------
	public final static int BLOCKLIST = 10; 		// 페이지 목록 수
	public final static int BLOCKPAGE = 5; 		// 페이지 페이지 수 
	
	//--------------------------------------------------------------------------------------------
	// 폴더 경로
	//--------------------------------------------------------------------------------------------
	public static final String INTR_PATH  					= "/WEB-INF/views/intr";				// 프로젝트
	public static final String VIEW_PATH_POPUP 		= INTR_PATH + "/comm/popup/"; 	// 팝업
	public static final String VIEW_PATH_MAIN 		= INTR_PATH + "/main/"; 				// 메인
	public static final String VIEW_PATH_LOGIN 		= INTR_PATH + "/login/"; 				// 로그인
	public static final String VIEW_PATH_MYPAGE 		= INTR_PATH + "/mypage/"; 			// 내 정보
	public static final String VIEW_PATH_BOARD 		= INTR_PATH + "/board/"; 				// 공지사항
	public static final String VIEW_PATH_TASK 			= INTR_PATH + "/task/"; 				// 업무
	public static final String VIEW_PATH_EMP 			= INTR_PATH + "/emp/";	 				// 사원
	public static final String VIEW_PATH_TEMP 			= INTR_PATH + "/temp/";	 			// 기안문 양식
	public static final String VIEW_PATH_ROLE 			= INTR_PATH + "/role/";	 				// 권한
	public static final String VIEW_PATH_APRV 			= INTR_PATH + "/aprv/";	 			// 결재
	public static final String VIEW_PATH_QUERY 		= INTR_PATH + "/query/";	 			// 쿼리
	public static final String VIEW_PATH_PROJ 			= INTR_PATH + "/project/"; 			// 프로젝트
	public static final String VIEW_PATH_MTG 			= INTR_PATH + "/meeting/"; 			// 회의
	public static final String VIEW_PATH_BANR 			= INTR_PATH + "/banr/"; 				// 배너
	public static final String VIEW_PATH_REGS 			= INTR_PATH + "/regs/"; 				// 내부규정
	public static final String VIEW_PATH_LOG 			= INTR_PATH + "/log/"; 					// 로그
	
	//--------------------------------------------------------------------------------------------
	// 파일 다운로드 경로
	//--------------------------------------------------------------------------------------------
	public static final String FILE_PATH = "Intr\\File"; 				// 파일
	public static final String TEMP_PATH = "Intr\\Temp"; 			// 임시
	public static final String MANU_PATH  = "Intr\\Manual"; 		// 매뉴얼
	public static final String REGS_PATH  = "Intr\\Regs"; 			// 내부규정
	
	//--------------------------------------------------------------------------------------------
	// 로그인
	//--------------------------------------------------------------------------------------------
	public static final String INTR_LOGIN_INQY_1010 	= "intr_login_inqy_1010.jsp"; 	// 로그인
	public static final String INTR_LOGIN_INQY_1020 	= "intr_login_inqy_1020.jsp"; 	// 정보 찾기
	
	//--------------------------------------------------------------------------------------------
	// 메인
	//--------------------------------------------------------------------------------------------
	public static final String INTR_MAIN_INQY_1010 	= "intr_main_inqy_1010.jsp"; 	// 메인 (유저)
	public static final String INTR_MAIN_INQY_2010 	= "intr_main_inqy_2010.jsp"; 	// 메인 (관리자)
	
	//--------------------------------------------------------------------------------------------
	// 내정보
	//--------------------------------------------------------------------------------------------
	public static final String INTR_MYPAGE_INQY_1010 = "intr_mypage_detl_1010.jsp"; 	// 내 정보
	
	//--------------------------------------------------------------------------------------------
	// 팝업
	//--------------------------------------------------------------------------------------------
	public static final String INTR_POPUP_INQY_1010 = "intr_popup_inqy_1010.jsp";			// 담당자 팝업
	public static final String INTR_POPUP_INQY_1011 = "intr_popup_inqy_1011.jsp";			// 담당자 트리
	
	public static final String INTR_POPUP_INQY_1020 = "intr_popup_inqy_1020.jsp";		// 회원정보 찾기 팝업
	public static final String INTR_POPUP_INQY_1021 = "intr_popup_inqy_1021.jsp";			// 팝업 (아이디 찾기)
	public static final String INTR_POPUP_INQY_1022 = "intr_popup_inqy_1022.jsp";		// 팝업 (비밀번호 찾기)

	public static final String INTR_POPUP_INQY_1030 = "intr_popup_inqy_1030.jsp";		// 프로젝트 팝업
	public static final String INTR_POPUP_INQY_1031 = "intr_popup_inqy_1031.jsp";			// 프로젝트 트리
	
	public static final String INTR_POPUP_INQY_1040 = "intr_popup_inqy_1040.jsp";		// 결재선 팝업
	public static final String INTR_POPUP_INQY_1041 = "intr_popup_inqy_1041.jsp";			// 결재선 트리
	public static final String INTR_POPUP_INQY_1042 = "intr_popup_inqy_1042.jsp";		// 결재선 목록
	public static final String INTR_POPUP_INQY_1043 = "intr_popup_inqy_1043.jsp";		// 결재선 상세

	public static final String INTR_POPUP_INQY_1050 = "intr_popup_inqy_1050.jsp";		// 결재의견 팝업
	public static final String INTR_POPUP_INQY_1051 = "intr_popup_inqy_1051.jsp";			// 결재의견 입력

	public static final String INTR_POPUP_INQY_1060 = "intr_popup_inqy_1060.jsp";		// 물품 팝업
	public static final String INTR_POPUP_INQY_1061 = "intr_popup_inqy_1061.jsp";			// 물품 등록
	public static final String INTR_POPUP_INQY_1062 = "intr_popup_inqy_1062.jsp";		// 물품 조회
	
	public static final String INTR_POPUP_INQY_1070 = "intr_popup_inqy_1070.jsp";		// 정산내역 팝업
	public static final String INTR_POPUP_INQY_1071 = "intr_popup_inqy_1071.jsp";			// 정산내역 등록
	public static final String INTR_POPUP_INQY_1072 = "intr_popup_inqy_1072.jsp";		// 정산내역 조회
	
	public static final String INTR_POPUP_INQY_1080 = "intr_popup_inqy_1080.jsp";		// 휴가 팝업
	public static final String INTR_POPUP_INQY_1081 = "intr_popup_inqy_1081.jsp";			// 휴가 조회

	public static final String INTR_POPUP_INQY_1090 = "intr_popup_inqy_1090.jsp";		// 회의 팝업
	public static final String INTR_POPUP_INQY_1091 = "intr_popup_inqy_1091.jsp";			// 회의 조회
	
	public static final String INTR_POPUP_INQY_1100 = "intr_popup_inqy_1100.jsp";			// 조직도 팝업
	public static final String INTR_POPUP_INQY_1101 = "intr_popup_inqy_1101.jsp";			// 조직도 트리
	public static final String INTR_POPUP_INQY_1102 = "intr_popup_inqy_1102.jsp";			// 조직도 트리 조회
	
	public static final String INTR_POPUP_INQY_1110 = "intr_popup_inqy_1110.jsp";			// API 팝업
	public static final String INTR_POPUP_INQY_1111 = "intr_popup_inqy_1111.jsp";			// API 조회

	public static final String INTR_POPUP_INQY_1120 = "intr_popup_inqy_1120.jsp";			// 업무 캘린더 팝업
	public static final String INTR_POPUP_INQY_1121 = "intr_popup_inqy_1121.jsp";			// 업무 캘린더 등록
	public static final String INTR_POPUP_INQY_1122 = "intr_popup_inqy_1122.jsp";			// 업무 캘린더 상세
	public static final String INTR_POPUP_INQY_1123 = "intr_popup_inqy_1123.jsp";			// 업무 캘린더 상세 (메인)
	
	public static final String INTR_POPUP_INQY_2010 = "intr_popup_inqy_2010.jsp";		// 비밀번호 변경 팝업 (마이페이지)
	public static final String INTR_POPUP_INQY_2011 = "intr_popup_inqy_2011.jsp";			// 비밀번호 변경 (마이페이지)

	public static final String INTR_POPUP_INQY_2020 = "intr_popup_inqy_2020.jsp";		// 로그 메세지 팝업
	public static final String INTR_POPUP_INQY_2021 = "intr_popup_inqy_2021.jsp";		// 로그 메세지 상세
	
	//--------------------------------------------------------------------------------------------
	// 공지사항
	//--------------------------------------------------------------------------------------------
	public static final String INTR_BOARD_LIST_1010 = "intr_board_list_1010.jsp";			// 공지사항 목록
	public static final String INTR_BOARD_DETL_1010 = "intr_board_detl_1010.jsp";			// 공지사항 상세
	public static final String INTR_BOARD_DETL_1020 = "intr_board_detl_1020.jsp";		// 공지사항 등록
	public static final String INTR_BOARD_DETL_1030 = "intr_board_detl_1030.jsp";		// 공지사항 수정

	public static final String INTR_BOARD_LIST_2010 = "intr_board_list_2010.jsp";			// 공지사항 목록
	public static final String INTR_BOARD_DETL_2010 = "intr_board_detl_2010.jsp";		// 공지사항 상세
	
	//--------------------------------------------------------------------------------------------
	// 업무일지
	//--------------------------------------------------------------------------------------------
	public static final String INTR_TASK_LIST_1010 = "intr_task_list_1010.jsp";			// 업무 작성
	public static final String INTR_TASK_LIST_1011 = "intr_task_list_1011.jsp";			// 업무 작성 (AJAX)
	public static final String INTR_TASK_LIST_2010 = "intr_task_list_2010.jsp";			// 업무 조회
	public static final String INTR_TASK_LIST_2011 = "intr_task_list_2011.jsp";			// 업무 조회 (AJAX)
	public static final String INTR_TASK_LIST_3010 = "intr_task_list_3010.jsp";			// 업무 캘린더 조회
	public static final String INTR_TASK_DETL_1010 = "intr_task_detl_1010.jsp";			// 업무 상세
	
	//--------------------------------------------------------------------------------------------
	// 사원
	//--------------------------------------------------------------------------------------------
	public static final String INTR_EMP_LIST_1010 = "intr_emp_list_1010.jsp";				// 사원 목록 (사용자)
	public static final String INTR_EMP_LIST_2010 = "intr_emp_list_2010.jsp";				// 사원 목록 (관리자)
	public static final String INTR_EMP_LIST_3010 = "intr_emp_list_3010.jsp";				// 담당업무 조회
	public static final String INTR_EMP_LIST_3011 = "intr_emp_list_3011.jsp";				// 담당업무 조회 (AJAX)
	public static final String INTR_EMP_LIST_3012 = "intr_emp_list_3012.jsp";				// 담당업무 등록 (AJAX)
	public static final String INTR_EMP_LIST_4010 = "intr_emp_list_4010.jsp";				// 인사통계 조회
	public static final String INTR_EMP_DETL_1010 = "intr_emp_detl_1010.jsp";				// 사원 등록
	public static final String INTR_EMP_DETL_1020 = "intr_emp_detl_1020.jsp";			// 사원 수정
	public static final String INTR_EMP_DETL_1030 = "intr_emp_detl_1030.jsp";			// 사원 상세
	public static final String INTR_EMP_DETL_2010 = "intr_emp_detl_2010.jsp";			// 사원 조회

	//--------------------------------------------------------------------------------------------
	// 기안문 양식
	//--------------------------------------------------------------------------------------------
	public static final String INTR_TEMP_LIST_1010 = "intr_temp_list_1010.jsp"; 			// 기안문 양식 목록
	public static final String INTR_TEMP_LIST_1011 = "intr_temp_list_1011.jsp"; 			// 기안문 양식 목록 (트리)

	public static final String INTR_TEMP_DETL_1010 = "intr_temp_detl_1010.jsp";			// 기안문 양식 상세

	//--------------------------------------------------------------------------------------------
	// 권한
	//--------------------------------------------------------------------------------------------
	public static final String INTR_ROLE_LIST_1010 = "intr_role_list_1010.jsp"; 			// 권한 목록 (권한)
	public static final String INTR_ROLE_LIST_1011 = "intr_role_list_1011.jsp"; 			// 권한 목록 

	public static final String INTR_ROLE_DETL_1010 = "intr_role_detl_1010.jsp";			// 권한 상세
	public static final String INTR_ROLE_DETL_1020 = "intr_role_detl_1020.jsp";			// 권한 등록
	public static final String INTR_ROLE_DETL_1030 = "intr_role_detl_1030.jsp";			// 권한 수정

	public static final String INTR_ROLE_LIST_2010 = "intr_role_list_2010.jsp"; 			// 권한 목록 (메뉴 권한)
	public static final String INTR_ROLE_LIST_2011 = "intr_role_list_2011.jsp"; 			// 권한 목록
	
	public static final String INTR_ROLE_LIST_3010 = "intr_role_list_3010.jsp"; 			// 권한 목록 (사용자 권한)
	public static final String INTR_ROLE_LIST_3011 = "intr_role_list_3011.jsp"; 			// 권한 목록

	//--------------------------------------------------------------------------------------------
	// 결재
	//--------------------------------------------------------------------------------------------
	public static final String INTR_APRV_LIST_1010 = "intr_aprv_list_1010.jsp"; 				// 기안 작성 목록
	public static final String INTR_APRV_DETL_1010 = "intr_aprv_detl_1010.jsp"	;			// 기안 작성 상세 (휴가 신청서)
	public static final String INTR_APRV_DETL_1011 = "intr_aprv_detl_1011.jsp"	;			// 기안 작성 상세 (가지급결의서)
	public static final String INTR_APRV_DETL_1012 = "intr_aprv_detl_1012.jsp"	;			// 기안 작성 상세 (물품반출입 신청서)
	public static final String INTR_APRV_DETL_1013 = "intr_aprv_detl_1013.jsp"	;			// 기안 작성 상세 (법인카드 정산서)
	
	public static final String INTR_APRV_LIST_2010 = "intr_aprv_list_2010.jsp"; 				// 결재 조회
	public static final String INTR_APRV_DETL_2010 = "intr_aprv_detl_2010.jsp"	;			// 결재 상세 (휴가 신청서)
	public static final String INTR_APRV_DETL_2011 = "intr_aprv_detl_2011.jsp"	;			// 결재 상세 (가지급결의서)
	public static final String INTR_APRV_DETL_2012 = "intr_aprv_detl_2012.jsp"	;			// 결재 상세 (물품반출입 신청서)
	public static final String INTR_APRV_DETL_2013 = "intr_aprv_detl_2013.jsp"	;			// 결재 상세 (법인카드 정산서)

	public static final String INTR_APRV_LIST_3010 = "intr_aprv_list_3010.jsp";				// 일정 관리

	public static final String INTR_APRV_LIST_4010 = "intr_aprv_list_4010.jsp";				// 결재선 관리
	public static final String INTR_APRV_LIST_4011 = "intr_aprv_list_4011.jsp";				// 결재선 관리 (AJAX)
	public static final String INTR_APRV_LIST_4012 = "intr_aprv_list_4012.jsp";				// 결재선 등록
	public static final String INTR_APRV_LIST_4013 = "intr_aprv_list_4013.jsp";				// 결재선 상세

	//--------------------------------------------------------------------------------------------
	// 쿼리
	//--------------------------------------------------------------------------------------------
	public static final String INTR_QUERY_DETL_1010 = "intr_query_detl_1010.jsp";			// 쿼리 입력
	public static final String INTR_QUERY_DETL_1011 = "intr_query_detl_1011.jsp";			// 쿼리 결과
	
	//--------------------------------------------------------------------------------------------
	// 프로젝트
	//--------------------------------------------------------------------------------------------
	public static final String INTR_PROJ_LIST_1010 = "intr_proj_list_1010.jsp"; 				// 프로젝트 목록
	public static final String INTR_PROJ_DETL_1010 = "intr_proj_detl_1010.jsp"	;			// 프로젝트 상세
	public static final String INTR_PROJ_DETL_1020 = "intr_proj_detl_1020.jsp"	;			// 프로젝트 등록
	public static final String INTR_PROJ_DETL_1030 = "intr_proj_detl_1030.jsp";				// 프로젝트 수정
	
	//--------------------------------------------------------------------------------------------
	// 회의
	//--------------------------------------------------------------------------------------------
	public static final String INTR_MTG_LIST_1010 = "intr_mtg_list_1010.jsp"; 				// 회의 목록
	public static final String INTR_MTG_DETL_1010 = "intr_mtg_detl_1010.jsp"	;			// 회의 상세
	public static final String INTR_MTG_DETL_1020 = "intr_mtg_detl_1020.jsp"	;			// 회의 등록
	public static final String INTR_MTG_DETL_1030 = "intr_mtg_detl_1030.jsp";			// 회의 수정
	public static final String INTR_MTG_DETL_2010 = "intr_mtg_detl_2010.jsp"	;			// 캘린더 목록
	
	//--------------------------------------------------------------------------------------------
	// 배너
	//--------------------------------------------------------------------------------------------
	public static final String INTR_BANR_LIST_1010 = "intr_banr_detl_1010.jsp"; 		// 배너 관리

	//--------------------------------------------------------------------------------------------
	// 내부규정
	//--------------------------------------------------------------------------------------------
	public static final String INTR_REGS_DETL_1010 = "intr_regs_detl_1010.jsp"; 			// 내부규정 조회
	public static final String INTR_REGS_DETL_1020 = "intr_regs_detl_1020.jsp"; 		// PDF 뷰어
	
	//--------------------------------------------------------------------------------------------
	// 로그
	//--------------------------------------------------------------------------------------------
	public static final String INTR_LOG_LIST_1010 = "intr_log_list_1010.jsp"; 				// 로그 목록 조회
}
