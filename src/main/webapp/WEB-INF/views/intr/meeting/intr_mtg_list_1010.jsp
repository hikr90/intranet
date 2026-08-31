<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	var defaultList = JSON.parse('${defaultList}');
	document.addEventListener('DOMContentLoaded', function() {
		//
		var calendar = document.getElementById('calendar');
	    var mtgCont = new FullCalendar.Calendar(calendar, {
	    	//
	        locale: 'en',  							// 언어
			eventLimit: true,						// 이벤트 내용 초과 시, MORE로 표현
			displayEventTime: false, 			// 이벤트 시간 여부
			navLinks: false, 						// 날짜 선택할 경우 상세 데이터 조회 
			selectable: false,						// 네모 선택 여부
			headerToolbar: {
				start: 'prev,next today',
				center: 'title',
			    end: 'dayGridMonth,listMonth'
			},
			// 네모 선택 시
			dateClick: function(info) {
				//
			},
			// 회의 선택 시
			eventClick: function(info) {
				//
				$("#sequenceId").val(info.event.id);
				formSubmit("intrMtgInqy1030.do");
			},
			// 데이터
			events : defaultList,
			eventColor: '#214b97'
		});
	    //
	    mtgCont.render();
	});

	// 검색 조회
	function listCall(f){
		try {
			//
			formSubmit("intrMtgInqy1010.do");
			
		} catch (error) {
	        console.error("[Error] 검색 조회 : ", error.message);
		}
	}

	// 등록 화면 조회
	function regCall(){
		try {
			//
			formSubmit("intrMtgInqy1020.do");
			
		} catch (error) {
	        console.error("[Error] 등록 화면 조회 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" name="form" method="POST">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>

	<div class="main_wrap">
		<!-- 좌측 메뉴 -->
		<div class="left_wrap">
			<div class="left_area">
				<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1031.jsp" %>
			</div>
		</div>
		
		<div class="content_wrap">
			<div class="content_area">
				<article class="sub_article">
					<div class="content">
						<div id="sub_content">
							<div class="form_area">
								<div class="post_wrap">
									<input type="hidden" id="sequenceId" name="sequenceId" value="">
									<h2>회의 관리
										<span class="float_right">
											<input type="button" class="btn_blue_thin" value="등록" onclick="regCall();">
										</span>
									</h2>
									
									<div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 회의실 종류 -->
											<div class="srch_area">
												<label class="srch_label">회의실 종류</label>
												<div class="select_wrap">
													<div id="locList" class="sList select_box">${empty param.srchLocNm ? '전체' : param.srchLocNm}</div>
													<input type="hidden" name="srchLocCd" value="${param.srchLocCd}">
													<input type="hidden" name="srchLocNm" value="${param.srchLocNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${locList}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										
											<!-- 등록자 -->
											<div class="srch_area">
												<label class="srch_label">등록자</label>
												<input type="text" id="srchIdx" name="srchIdx" class="srch_cdt_text" value="${param.srchIdx}" onkeydown="enterListCall(this.form);">
											</div>
											
											<!-- 부서 -->
											<div class="srch_area">
												<label class="srch_label">부서</label>
												<input type="text" id="orgNm" name="orgNm" class="srch_cdt_text" value="${param.orgNm}" onkeydown="enterListCall(this.form);">
											</div>

											<!-- 직급 -->
											<div class="srch_area">
												<label class="srch_label">직급</label>
												<input type="text" id="rankNm" name="rankNm" class="srch_cdt_text" value="${param.rankNm}" onkeydown="enterListCall(this.form);">
											</div>
											
											<!-- 제목 -->
											<div class="float_right">
												<div class="srch_area">
													<label class="srch_label">제목</label>
													<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
												
													<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
													<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
												</div>
		                                	</div>
										</div>
									</div>
									
									<div class="mtg_wrap">
										<div class="mtg_area">
											<div id="calendar">
												
											</div>
										</div><!-- End post_write -->
									</div><!-- End leav_wrap -->
								</div><!-- End post_wrap -->
							</div><!-- End form_area -->
						</div><!-- End sub_content -->
					</div><!-- End content -->
				</article>
			</div>
		</div>
	</div>
</form>
</body>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>
