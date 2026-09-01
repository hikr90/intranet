# 🏢 Intranet System

> **업무 관리를 위한 Spring MVC & MyBatis 기반 사내 웹 인트라넷 시스템**  
사용자별 권한에 따른 메뉴 제어, 공지사항, 사원·조직 관리, 업무일지, 회의실 예약, 전자결재 등 핵심 사내 업무 기능을 제공합니다.

---

## 🛠 1. 기술 스택 (Tech Stack)

| 구분 | 사용 기술 |
| :--- | :--- |
| **Backend** | Java 1.8, Spring MVC 3.1.1.Release |
| **Persistence** | MyBatis, Oracle Database |
| **Frontend** | JSP, JSTL, JavaScript, CSS |
| **Server / Build** | Apache Tomcat 9, Maven (WAR) |
| **Libraries** | Log4j, CKEditor 4, FullCalendar 5.10.2, PDF.js |
| **VCS** | Git, GitHub |

---

## 📁 2. 디렉토리 구조 (Directory Structure)

```text
Intranet/
├── pom.xml                                   # Maven 프로젝트 및 WAR 빌드 설정
├── src/main/java/com/intr/
│   ├── ctr/                                  # Controller
│   ├── svc/                                  # Service 인터페이스
│   ├── svcImpl/                              # Service 구현 및 트랜잭션 처리
│   ├── dao/                                  # DAO 및 MyBatis SQL 호출
│   ├── utils/                                # 공통 유틸리티 및 인증/암호화(AES) 처리
│   └── vo/                                   # Value Object (EmpVO 등)
│
├── src/main/resources/
│   ├── config/spring/                        # Spring 설정 파일
│   ├── config/mybatis/mapper/                # MyBatis Mapper XML
│   ├── config/aes/                           # AES 암호화 프로퍼티
│   ├── message/                              # 메시지 리소스
│   └── log4j.xml                             # Logging 설정
│
└── src/main/webapp/
    ├── WEB-INF/
    │   ├── web.xml                           # DispatcherServlet 및 Root Context 설정
    │   └── views/intr/                       # JSP 화면
    │       ├── comm/                         # 공통 화면 및 팝업
    │       ├── aprv/, board/, emp/, ...      # 업무별 화면
    │       ├── main/                         # 메인 화면
    │       ├── login/                        # 로그인 화면
    │       └── mypage/                       # 마이페이지
    │
    └── resources/
        ├── css/                              # CSS
        ├── js/                               # JavaScript
        ├── images/                           # 이미지 리소스
        ├── font/                             # 폰트
        ├── ckeditor4/                        # 웹 에디터
        ├── pdfjs/                            # PDF 뷰어
        └── fullcalendar-5.10.2/              # 캘린더 라이브러리
```

---

## 🏗 3. 애플리케이션 아키텍처 (Application Architecture)

### 3.1 기본 화면 요청 처리 흐름
```text
[ Browser ]
    │  1. 화면 요청 (*.do)
    ▼
[ DispatcherServlet ]
    │  2. 요청 라우팅
    ▼
[ Controller ]
    │  3. 비즈니스 로직 호출
    ▼
[ Service / ServiceImpl ]
    │  4. 데이터 처리 요청
    ▼
[ DAO / MyBatis Mapper ]
    │  5. SQL 쿼리 실행
    ▼
[ Oracle Database ]
    │  6. 조회 결과 반환 (CamelHashMap / VO)
    ▼
[ Controller ]
    │  7. Model에 데이터 바인딩 및 View 지정
    ▼
[ JSP (View Resolver) ]
    │  8. HTML 렌더링 결과 전달
    ▼
[ Browser ]
```

### 3.2 비동기 데이터 통신 (AJAX)
```text
[ Browser ]
    │
    │  1. 비동기 요청 ($.ajax / multipart)
    ▼
[ Controller (@ResponseBody) ]
    │
    │  2. 서비스 실행 및 데이터 가공
    ▼
[ Service / DAO / DB ]
    │
    │  3. 처리 결과 반환 (JSON)
    ▼
[ Browser ] (DOM 동적 갱신 및 모달 제어)
```

---

### 3.3 주요 구현 특징
* **요청 라우팅**: Controller는 `@RequestMapping`을 통해 `.do` URL을 처리하며, 일반 조회 요청은 JSP 경로를 반환하고 등록·수정·삭제 요청은 주로 `@ResponseBody`를 통해 JSON 결과를 반환합니다.
* **선언적 트랜잭션**: 모든 `svcImpl` 클래스에 `@Transactional(rollbackFor = Exception.class)`을 적용하여 비즈니스 로직 전반의 트랜잭션 무결성을 보장합니다.
* **SQL 매핑 표준화**: DAO는 `SqlSessionTemplate`을 사용하여 `namespace.statementId` 형식(예: `board.boardInqyDao1020`)으로 MyBatis Mapper를 호출합니다.
* **데이터 컨테이너 및 변환**:
  * 요청 및 조회 결과 데이터는 주로 `HashMap<String, Object>` 형태로 처리합니다.
  * `CamelHashMap`을 도입하여 조회 결과 컬럼명을 `lowerCamelCase`로 자동 매핑하고 Oracle CLOB 데이터를 문자열로 일괄 변환 처리합니다.
* **인코딩 및 세션 관리**:
  * `web.xml`의 `CharacterEncodingFilter`를 통해 `*.do` 요청에 UTF-8 인코딩을 강제 적용합니다.
  * 로그인 성공 시 사용자 정보는 `EmpVO`에 담겨 세션의 `empVO` 키에 보관되며, 전역 인터셉터에서 권한을 검증합니다.

### 3.4 실제 요청 흐름 예시 (공지사항)
1. 브라우저가 `intrBoardInqy1010.do`를 호출합니다.
2. `BoardController.intrBoardInqy1010`이 요청을 수신합니다.
   * 공통 메뉴 정보 조회를 위해 `CoreService.coreInqyService1010` 호출
   * 공지사항 목록 조회를 위해 `BoardService.boardInqyService1010` 호출
3. `BoardServiceImpl`이 `BoardDao.boardInqyDao1020`을 호출합니다.
4. `BoardDao`가 `Board_Sql.xml`의 `boardInqyDao1020` Mapper를 MyBatis를 통해 실행합니다.
5. 조회 결과를 Model의 `defaultList`에 담고, `WEB-INF/views/intr/board/intr_board_list_1010.jsp`를 렌더링하여 브라우저에 반환합니다.

> **[참고]** `MainController`와 `PopupController`의 경우 단순 조회 및 집계 목적에 따라 Service 계층 없이 여러 DAO를 직접 주입받아 처리하는 흐름도 포함되어 있습니다.

---

## 🖥 4. 화면 처리 및 프론트엔드 구조

* **SSR & JSTL 기반 화면 구성**: JSP 기반 Server-Side Rendering을 중심으로, JSTL(`<c:forEach>`, `<c:if>`, `<c:choose>`, `fmt`)을 활용하여 조건 분기 및 데이터 포맷팅을 수행합니다.
* **화면 분할 및 비동기 갱신**: 기본 조회는 SSR로 동작하며, 업무일지·권한·회의·프로젝트 등 부분 데이터 갱신 및 CRUD 작업은 jQuery `$.ajax()`를 사용합니다. 필요 시 AJAX로 HTML 조각을 받아 모달 영역에 동적 렌더링합니다.
* **공통 레이아웃 모듈화**: `views/intr/comm/include` 내의 공통 head, header, left menu, footer, 파일 목록 JSP를 각 화면에서 include하여 재사용합니다.
* **공통 JavaScript 라이브러리 (`resources/js`)**:
  * `head_script.js`: 메뉴 이동, 공통 폼 제출 및 전역 UI 제어
  * `http_request.js`: XMLHttpRequest 기반 HTTP 통신 모듈
  * `popup_script.js`, `tree_script.js`: 모달 팝업 및 조직도/메뉴 트리 UI 제어
  * `date_script.js`: 날짜 선택 및 캘린더 연동 UI
  * `file_script.js`: FormData 기반 파일 업로드/다운로드 처리
  * `aprv_script.js`: 전자결재선 지정 및 기안 클라이언트 유효성 검증
* **동적 메뉴 체계**: DB의 `mappingId`를 기준으로 사용자 권한(`EMP_ROLE`, `MENU_ROLE`)에 맞는 메뉴 목록을 `CoreService`에서 조회하여 동적으로 Left Menu와 헤더를 구성합니다.

---

## 📋 5. 주요 기능 명세

| 기능 구분 | 주요 제공 기능 |
| :--- | :--- |
| **로그인 & 계정 관리** | 로그인/로그아웃, 사용자/관리자 메인 대시보드, 마이페이지, 비밀번호 변경 (암복호화) |
| **전자결재 시스템** | 결재선 등록/조회/저장, 기안문 (휴가, 가지급, 반출입, 정산서) 기안/결재/반송 |
| **프로젝트 관리** | 프로젝트 등록/조회/수정, 담당자 연동 및 계약 문서 업로드 |
| **사원 & 조직 관리** | 사원 목록/상세/등록/수정, 트리형 사내 조직도 팝업, 담당업무 관리, 인사 통계(그리드 형태) |
| **업무 & 일정 관리** | 업무일지 관리(동적 행 추가 방식, 접기/펼치기), FullCalendar 기반 개인 업무 캘린더 |
| **회의실 예약 관리** | 회의실 예약 등록/수정/삭제, 시간대별 버튼형 UI, 장소/시간 중복 방지 유효성 검증 |
| **공지사항** | 공지사항 CRUD, 페이징, 3일 이내 신규 글 [NEW] 뱃지, 첨부파일 (단건, 압축) 다운로드 |
| **권한 관리 (RBAC)** | Role 기반 메뉴 접근 제어, 사용자별 권한 부여, 세션 인터셉터(`preHandle`) 비인가 접근 차단 |
| **사내 내부규정** | PDF.js를 연동한 사내 내규 규정 뷰어 제공 |
| **배너 관리** | 대시보드 배너 관리(쿠키 기반 팝업 제어) |
| **시스템 로그 관리** | 관리자 접속 로그 모니터링 팝업, 시스템 오류 로그 적재 및 모니터링 |
| **데이터 관리 도구** | SQL 쿼리 실행기(DML 포함, REST API 응답) 및 조회 결과 Excel 다운로드 |

---

## 💾 6. 데이터베이스 및 MyBatis 구조

* **Database**: Oracle
* **SQL Mapper**: MyBatis (`config/mybatis/mybatis-config.xml`)
* **동적 쿼리**: 검색 조건별 `<if>`, `<choose>` 태그를 활용해 화면별 동적 검색 조건을 최적화된 SQL로 조합합니다.

### 📌 주요 테이블 명세
공통 / 권한
  EMP_INFO (사원정보), EMP_ROLE (사원권한), ORG (조직도), RANK (직급), 
  MENU (메뉴정보), MENU_ROLE (메뉴권한), ROLE (권한), COMMCODE (공통코드)

업무 / 일정
  BOARD (게시판), TASK (업무일지), TASK_CALENDAR (캘린더일정), 
  PROJECT (프로젝트), MEETING (회의실), TEMPLATE (서식), BANR (배너), LOG (접속/에러로그)

전자결재
  APRV_MAST (기안마스터), APRV_LINE_MAST (결재선마스터), APRV_LINE_DETL (결재선상세), APRV_HIST (결재이력)
  APRV_REL_LEAV (휴가신청), APRV_REL_EXP (가지급결의), APRV_REL_ITEM (물품반출입), APRV_REL_CORP (법인카드정산)

파일
  FILE_INFO (첨부파일 관리 - 연/월 디렉토리 분기)

---

## ⚙️ 7. 주요 설정 파일 명세

* `pom.xml`: Maven 의존성(Spring, MyBatis, OJDBC, Log4j 등) 및 WAR 패키징 빌드 설정
* `WEB-INF/web.xml`: Spring Root Context, `DispatcherServlet`, UTF-8 `CharacterEncodingFilter` 설정
* `servlet-context.xml`: Spring MVC 설정, 세션 인터셉터, 정적 리소스 매핑, 트랜잭션 및 메시지 프로퍼티 설정
* `context-1-datasource.xml`: Oracle DataSource(커넥션 풀) 설정
* `context-2-mybatis.xml`: MyBatis `SqlSessionFactoryBean`, `SqlSessionTemplate` 빈 설정
* `context-3-fileupload.xml`: `CommonsMultipartResolver` 기반 파일 업로드 제약 설정
* `context-4-mail.xml`: `JavaMailSender` 기반 SMTP 메일 발송 설정
* `mybatis-config.xml`: MyBatis Type Alias, TypeHandler(CLOB 등), CamelCase 설정
* `aes.properties`: AES 양방향 암복호화 시크릿 키 관리 프로퍼티

---

## 📅 8. 개발 히스토리 & 주요 마일스톤 (Changelog)

> 학원 프로젝트 기반에서 시작하여 직장을 다니며 주말 및 개인 시간을 활용해 비즈니스 로직 추가 및 고도화, 보안 강화, 아키텍처 리팩토링을 꾸준히 진행한 개발 기록입니다.

### 📍 2026년: 시스템 안정화, 아키텍처 리팩토링 및 보안 강화
* **아키텍처 및 공통 모듈 개선**
    * Oracle CLOB 데이터 변환 공통 로직 모듈화 및 MyBatis 페이징 쿼리 튜닝
    * 불필요한 의존성 및 미사용 파라미터 정리
    * 공통 코드 조회 모듈화 및 자바스크립트 공통 함수 (유효성 검증, 검색 초기화, 폼 태그 동작 등) 리팩토링  
* **보안 및 권한 관리 체계화**
    * AES 암호화 키 프로퍼티 파일 분리 관리
    * 기안문 서식별 작성/조회 URL의 DB 메타데이터화 및 결재 프로세스 내 하드코딩 경로 제거
* **업무 기능 고도화**
    * 회의실 예약 관리 시스템 개선 (시간 선택형 UI 변경 및 장소/시간 중복 방지 검증 추가)
    * 사내 내규 규정 메뉴 신설 (PDF.js 뷰어 연동)
    * 인사 통계 (그리드 형태) 메뉴 및 화면 추가
    * 파일 업로드 구조 개선 (연/월 디렉터리 분기 저장 처리)

### 📍 2025년: 비즈니스 기능 전면 확장 및 UI/UX 리뉴얼
* **전자결재 엔진 및 결재 프로세스 구축**
    * 전자결재 테이블 전면 재설계 (APRV_MAST, APRV_HIST, APRV_REL_LEAV 등)
    * 전자결재 시스템 내 서식(휴가·가지급·반출입·정산) 템플릿화 및 웹 에디터 기반 기안문 작성·조회 통합 화면 개발
    * 결재/반송 프로세스 개발 및 결재 의견 입력 모달창 구현
    * 사용자별 결재선 관리 (조회, 등록, 수정, 삭제) 기능 구현
* **사내 업무 및 대시보드 기능 확장**
    * 메인 대시보드 리뉴얼 (캘린더 연동, 부서 현황 그래프, 프로필 사진)
    * 동적 행 추가 기반의 업무일지 작성 UI 개선 및 업무 캘린더 기능 고도화 (모달 형태 변경)
    * 사내 조직도 팝업 구현 및 쿠키 기반 메인 배너 관리 기능 추가
    * 사원별 담당업무 조회 및 등록 관리 기능 (탭 방식) 구현
    * 비밀번호 암·복호화 로직 구현 (AES 대칭키 기반 암·복호화 기능 모듈화)
    * 관리자 전용 데이터 관리 도구 개발: SQL(DQL/DML) 실행 및 결과 컬럼 맞춤형 엑셀 추출 지원
    * 인터셉터 (afterCompletion) 기반 전역 예외 로깅 체계 구축 및 관리자 오류 모니터링 메뉴 개발

### 📍 2024년: 공통 컴포넌트 생성 및 UI/데이터 처리 최적화
* **UI/UX 개선 및 공통 컴포넌트 모듈화**
    * 인트라넷 좌측 사이드 메뉴(Left Menu) 구조 개편 및 화면 CSS 스타일링
    * 커스텀 Select 박스 생성, Datepicker 등 공통 UI 스크립트 모듈화
* ** 인터셉터 구현 및 세션 처리**
    * 인터셉터를 이용한 전사 세션 유효성 검증 및 비인가 접근 제어 (리다이렉트) 구현
* **쿼리 최적화 및 공통 유틸 모듈화**
    * 전사 목록 조회를 위한 건수 쿼리 통합 및 페이징 공통 유틸리티(페이징, 파일 경로) 모듈화
    * 전체 목록 조회 화면 대상 페이징 적용 및 검색 조건 초기화 기능 구현
    * 서비스 메소드 내 선언적 트랜잭션(@Transactional) 적용

### 📍 2023년 : 레거시 시스템 구조 개편 및 실무 표준 아키텍처 전면 전환
* **레거시 의존성 제거 및 인트라넷 모듈 독립화**
    * 기존 통합 레거시 소스코드 분석을 통한 불필요 모듈 분리 및 단독 시스템 전환
    * 모듈 간 결합도 완화 및 단독 유지보수 최적화 환경 구축
* **MVC 계층 구조 및 네이밍 표준화**
    * Controller - Service - DAO 전 계층의 메서드명 및 파일 네이밍 규칙 일관화
    * 컨트롤러 요청 URL 패턴(*.do), 서비스 및 DAO, MyBatis Mapper ID 간 매핑 규칙 표준화
* **MyBatis 동적 SQL 및 데이터 처리 개선**
    * MyBatis XML 내 <if>, <choose> 등 동적 쿼리 전면 도입 및 다중 검색/필터링 최적화
    * 다중 파일 업로드/다운로드 공통 모듈화
* **화면 렌더링 방식 표준화 및 권한 체계(RBAC) 구축**
    * 단순 데이터 조회 (SSR) 및 동적 처리 (AJAX 비동기) 화면 렌더링 방식 통일
    * 사용자(User) - 권한(Role) - 메뉴(Menu) 매핑 기반의 사이트 메뉴 접근 제어 구조(RBAC) 설계 및 적용
