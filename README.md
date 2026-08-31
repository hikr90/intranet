# Intranet
(1) 개요
	- 업무 관리를 위한 Spring MVC & MyBatis 웹 기반 인트라넷 프로젝트
	- 사용자별 권한에 따라 메뉴를 제공하며, 공지사항·사원·업무일지·프로젝트·회의·결재 등의 업무 기능을 제공합니다.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(2) 기술 스택
	- Backend : Spring MVC 3.1.1.Release, Java 1.8
	- Front : JSP / JSTL
	- Database : Oracle
	- SQL Mapper : MyBatis
	- Build : Maven / WAR
	- Logging : Log4j 
	- Server : Apache Tomcat 9
	- Version Control : Git

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(3) 디렉토리 구조
Intranet/
├ pom.xml                            		# Maven 프로젝트 및 WAR 빌드 설정
├ src/main/java/com/intr/
│  ├ ctr/                              		# Controller
│  ├ svc/                              		# Service 인터페이스
│  ├ svcImpl/                        		# Service 구현 및 트랜잭션 처리
│  ├ dao/                             		# DAO 및 MyBatis SQL 호출
│  ├ utils/                             		# 공통 유틸리티 및 인증/암호화 처리
│  └ vo/                               		# Value Object
│
├ src/main/resources/
│  ├ config/spring/                		# Spring 설정
│  ├ config/mybatis/mapper/ 		# MyBatis Mapper XML
│  ├ config/aes/                    		# AES 암호화 설정
│  ├ message/                      		# 메시지 리소스
│  └ log4j.xml                       		# Logging 설정
│
└ src/main/webapp/
   ├ WEB-INF/
   │  ├ web.xml                     		# DispatcherServlet 및 Root Context 설정
   │  └ views/intr/                  		# JSP 화면
   │     ├ comm/                   		# 공통 화면 및 팝업
   │     ├ aprv/, board/, emp/, ...   	# 업무별 화면
   │     ├ main/                       		# 메인 화면
   │     ├ login/                      		# 로그인 화면
   │     └ mypage/                     	# 마이페이지
   │
   └ resources/
      ├ css/                           		# CSS
      ├ js/                            		# JavaScript
      ├ images/                        		# 이미지
      ├ font/                          		# 폰트
      ├ ckeditor4/                     		# CKEditor 4
      ├ pdfjs/                         		# PDF.js
      └ fullcalendar-5.10.2/           		# FullCalendar

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(4) 애플리케이션 아키텍처
(4.1) 기본 화면
Browser
  ├ 화면 요청(.do) -> DispatcherServlet -> Controller
  │                                             └> Service -> DAO -> MyBatis Mapper -> Oracle
  │       											                  │   
  └ JSP 렌더링 <───────────────────────────── Model

(4.2)  Ajax
Browser -> AJAX / multipart -> @ResponseBody Controller -> Service/DAO
												 ㄴ> @ResponseBody -> Browser

(4.3) 주요 구현 특징
- Controller는 @RequestMapping을 사용하여 .do URL을 처리합니다. 일반 조회 요청은 JSP 경로를 반환하고, 등록·수정·삭제 요청은 주로 @ResponseBody를 통해 결과를 반환합니다.
- 모든 svcImpl 클래스에 @Transactional(rollbackFor = Exception.class)을 적용하여 트랜잭션을 처리합니다.
- DAO는 SqlSessionTemplate을 사용하여 namespace.statementId 형식으로 MyBatis Mapper를 호출합니다.
  - 예시) board.boardInqyDao1020

- 요청 및 조회 결과 데이터는 주로 HashMap<String, Object> 형태로 처리합니다.
- CamelHashMap은 조회 결과의 컬럼명을 lowerCamelCase로 변환하고 CLOB 데이터를 문자열로 처리합니다.

- web.xml의 DispatcherServlet이 / 요청을 처리하며, CharacterEncodingFilter를 통해 *.do 요청에 UTF-8 인코딩을 적용합니다.
- EmpVO는 로그인 사용자 정보를 저장하는 VO이며, 로그인 성공 시 세션의 empVO 키에 저장됩니다. 


(4.4) 실제 요청 흐름 예시 (공지사항 예시)
	- (4.1) 브라우저가 intrBoardInqy1010.do를 요청합니다.
	- (4.2) BoardController.intrBoardInqy1010이 요청을 처리합니다.
		- 메뉴 정보 조회를 위해 CoreService.coreInqyService1010을 호출합니다.
   		- 공지사항 목록 조회를 위해 BoardService.boardInqyService1010을 호출합니다.
	- (4.3) BoardServiceImpl이 BoardDao.boardInqyDao1020을 호출합니다.
	- (4.4) BoardDao가 Board_Sql.xml의 boardInqyDao1020 Mapper를 MyBatis를 통해 실행합니다.
	- (4.5) 조회 결과를 Model의 defaultList에 담고, WEB-INF/views/intr/board/intr_board_list_1010.jsp를 렌더링하여 브라우저에 반환합니다.

	[참고] MainController와 PopupController에는 Service 계층을 거치지 않고 여러 DAO를 직접 주입하여 호출하는 흐름도 존재합니다. 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

5. 화면 처리 방식
	- JSP는 서버 사이드 렌더링(SSR)의 중심이며, JSTL의 <c:forEach>, <c:if>, <c:choose>, fmt 태그를 사용하여 목록·조건·날짜 등의 화면 데이터를 처리합니다.
	- 기본 형태의 단순 화면 조회는 SSR 방식으로 JSP를 렌더링하며, 등록·수정·삭제 등의 처리에는 AJAX를 사용합니다.
	- 예외적으로 화면을 분할하여 구성하는 경우, AJAX를 통해 HTML을 반환받아 화면에 렌더링합니다.

	- 공통 화면은 comm/include에 위치하며, 공통 head, header, left menu, footer, 파일 목록 등의 JSP를 각 화면에서 include하여 사용합니다.
	- 공통 JavaScript는 resources/js에 위치하며, 주요 기능은 다음과 같습니다.
		- (5.1) head_script.js: 메뉴 이동, 공통 폼 제출 및 UI 동작
		- (5.2) http_request.js: XMLHttpRequest 기반 HTTP 요청 처리
		- (5.3) popup_script.js, tree_script.js: 팝업 및 트리 UI 처리
		- (5.4) date_script.js: 날짜 관련 UI 처리
		- (5.5) file_script.js: FormData 및 첨부 파일 처리
		- (5.6) aprv_script.js: 결재 관련 클라이언트 처리

	- 업무일지·권한·회의·프로젝트·사원 등 동작 처리에서는 jQuery $.ajax()를 사용하여 처리 및 부분 화면을 갱신합니다.
	- 메뉴는 DB의 mappingId를 기준으로 동적으로 구성되며, CoreService와 Core_Sql.xml에서 사용자 권한에 따른 메뉴 목록을 조회 및 페이징, 이동 정보를 구성합니다.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

6. 주요 기능
	- (6.1) 로그인 및 사용자 관리 : 로그인, 사용자·관리자 메인 화면, 마이페이지 등의 기능을 제공합니다.
	- (6.2) 공지사항 : 공지사항의 조회, 등록, 수정, 삭제 등의 기능을 제공합니다.
	- (6.3) 사원 및 조직 관리 : 사원 정보, 담당업무, 인사 통계 등의 기능을 제공합니다.
	- (6.4) 권한 관리 : 사용자 및 메뉴에 대한 권한을 관리하고, 권한에 따라 메뉴를 제공합니다.
	- (6.5) 업무 관리 : 업무일지 및 업무 캘린더를 통해 업무를 등록하고 관리할 수 있습니다.
	- (6.6) 프로젝트 관리 : 프로젝트 관련 정보를 등록하고 조회·관리할 수 있습니다.
	- (6.7) 회의 관리 : 회의 일정 및 관련 정보를 관리하고 캘린더를 통해 조회할 수 있습니다.
	- (6.8) 결재 관리 : 기안문 작성, 결재 및 결재선 관리 기능을 제공합니다. 휴가 신청서, 가지급결의서, 물품반출입 신청서, 법인카드 정산서 등의 결재 유형이 구현되어 있습니다.
	- (6.9) 기안문 양식 관리 : 결재에 사용되는 기안문 양식을 관리합니다.
	- (6.10) 내부규정 관리 : 사내 내부규정 문서를 PDF 형태로 조회할 수 있습니다.
	- (6.11) 배너 관리 : 시스템 내 배너를 관리합니다.
	- (6.12) 로그 관리 : 사용자 접속 및 시스템 오류 등의 로그를 관리합니다.
	- (6.13) 파일 및 공통 기능 : 파일 업로드·다운로드, 메일 발송 등의 공통 기능을 제공합니다.
	- (6.14) SQL 실행 및 Excel 다운로드 : SQL 실행 기능과 조회 결과의 Excel 다운로드 기능을 제공합니다.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(7) DB 및 MyBatis 구조
	- DB : Oracle
	- SQL Mapper : MyBatis
	- MyBatis 설정은 config/mybatis/mybatis-config.xml에서 관리하며, Camel Case 변환과 CLOB 처리, EmpVO 및 CamelHashMap 등의 Alias를 설정합니다.
	- 업무별 Mapper XML을 통해 SQL을 관리하며, Controller → Service → DAO → MyBatis Mapper → DB 구조로 데이터를 처리합니다.
	- 검색 조건은 MyBatis의 <if>를 이용하여 화면별 검색 조건에 따라 동적으로 SQL을 구성합니다.

	주요 테이블은 다음과 같이 구성되어 있습니다.
		(7.1) 공통/권한 : EMP_INFO, EMP_ROLE, ORG, RANK, MENU, MENU_ROLE, ROLE, COMMCODE
		(7.2) 업무 : BOARD, TASK, TASK_CALENDAR, PROJECT, MEETING, TEMPLATE, BANR, LOG
		(7.3) 결재 : APRV_MAST, APRV_LINE_MAST, APRV_LINE_DETL, APRV_HIST, APRV_REL_LEAV, APRV_REL_EXP, APRV_REL_ITEM, APRV_REL_CORP
		(7.4) 파일 : FILE_INFO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(8) 주요 설정 파일	
	- (8.1) pom.xml : Maven 의존성 및 WAR 패키징 설정
	- (8.2) WEB-INF/web.xml : Spring Root Context, DispatcherServlet, 인코딩 필터 설정
	- (8.3) servlet-context.xml : Spring MVC, 인터셉터, 정적 리소스, 트랜잭션, 메시지 설정
	- (8.4) context-1-datasource.xml : Oracle DataSource 설정
	- (8.5) context-2-mybatis.xml : MyBatis SqlSessionFactory, SqlSessionTemplate 설정
	- (8.6) context-3-fileupload.xml : 파일 업로드 설정
	- (8.7) context-4-mail.xml : SMTP 메일 발송 설정
	- (8.8) mybatis-config.xml : MyBatis 전역 설정 및 Mapper 설정
	- (8.9) aes.properties : AES 암호화 설정

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
