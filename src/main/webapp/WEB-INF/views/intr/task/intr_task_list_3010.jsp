<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.10.2/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.10.2/lib/main.js'></script>
<script>
	var defaultList = JSON.parse('${defaultList}');
	//
	document.addEventListener('DOMContentLoaded', function() {
		//
		var calendar = document.getElementById('calendar');
	    var tldrCont = new FullCalendar.Calendar(calendar, {
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
			// 일정 선택 시	
			eventClick: function(info) {
				var obj = new Object();
				//
				obj["mappingId"] = "intrPopupInqy1122.do";
				obj["areaType"] = "tldr";
				obj["sequenceId"] = info.event.id;
				obj["width"] = "700"
				obj["height"] = "460";
				//		
				ajaxPopup(obj);
			},
			// 데이터
			events : defaultList,
			eventColor: '#214b97'
		});
	    //
	    tldrCont.render();
	});
	
	// 검색 조회
	function listCall(f){
		try {
			//
			formSubmit("intrTaskInqy3010.do");
			
		} catch (error) {
	        console.error("[Error] 검색 조회 : ", error.message);
		}
	}
	
	// 업무 캘린더 등록
	function regCall(){
		try {
			//
			var obj = new Object();
			//
			obj["mappingId"] = "intrPopupInqy1121.do";
			obj["areaType"] = "tldr";
			obj["width"] = "700"
			obj["height"] = "460";
			//		
			ajaxPopup(obj);
			
		} catch (error) {
			console.error("[Error] 업무 캘린더 등록 : ", error.message);
		}
	}
	
	// 업무 캘린더 등록 처리
	function regProc(){
		try {
			// 유효성 검증
			if(!requiredProc()){return;};
			
			// 등록 처리
			if(confirm("등록하시겠습니까?")){
				//
	   			$.ajax({
					url:"intrTaskProc2010.do",
					data: {
						'tldrTitle': $("#tldrTitle").val(),
				        'tldrSdt':   $("#tldrSdt").val(),
				        'tldrEdt':   $("#tldrEdt").val(),
				        'tldrCont':  $("#tldrCont").val(),
				        'empIdx':   "${empVO.empIdx}"
					},
					type : 'post',
	   				success : function(data){
	   						var json = eval(data);
	   						
	   						if(json[0].res=='YES'){
	   							alert("<spring:message code="PROC.SUCCESS"/>");
	   							popClose('tldr');	// 팝업 종료
	   							$("#listBtn").trigger('click');	// 조회
		   						
	   						}else{
	   							alert("<spring:message code="PROC.FAIL"/>");
								return;
	   						}								
	   				},
	   				error : function(res, status, error){
	   					alert("<spring:message code="PROC.ERROR"/>");
	   				}
	   			});
			}				
			
		} catch (error) {
			console.error("[Error] 업무 캘린더 등록 처리 : ", error.message);
		}
	}
	
	// 업무 캘린더 수정 처리
	function modProc(){
		try {
			// 유효성 검증
			if(!requiredProc()){return;};
			//
			if(confirm("수정하시겠습니까?")){
	   			$.ajax({
					url:"intrTaskProc2020.do",
					data: {
						'tldrTitle': $("#tldrTitle").val(),
				        'tldrSdt':   $("#tldrSdt").val(),
				        'tldrEdt':   $("#tldrEdt").val(),
				        'tldrCont':  $("#tldrCont").val(),
				        'tldrId': 	  $("#tldrId").val(),
				        'empIdx':   "${empVO.empIdx}"
					},
					type : 'post',
	   				success : function(data){
	   						var json = eval(data);
	   						
	   						if(json[0].res=='YES'){
	   							alert("<spring:message code="PROC.SUCCESS"/>");
	   							popClose('tldr');	// 팝업 종료
	   							$("#listBtn").trigger('click');	// 조회
		   						
	   						}else{
	   							alert("<spring:message code="PROC.FAIL"/>");
								return;
	   						}								
	   				},
	   				error : function(res, status, error){
	   					alert("<spring:message code="PROC.ERROR"/>");
	   				}
	   			});
			}
			
		} catch (error) {
			console.error("[Error] 업무 캘린더 수정 처리 : ", error.message);
		}
	}
	
	// 업무 캘린더 삭제 처리
	function delProc(){
		try {
			//
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url:"intrTaskProc2030.do",
					data: {
						'tldrId': $("#tldrId").val()
					},
					type : 'post',
	   				success : function(data){
	   						var json = eval(data);
	   						
	   						if(json[0].res=='YES'){
	   							alert("<spring:message code="PROC.SUCCESS"/>");
	   							popClose('tldr');	// 팝업 종료
	   							$("#listBtn").trigger('click');	// 조회
		   						
	   						}else{
	   							alert("<spring:message code="PROC.FAIL"/>");
								return;
	   						}								
	   				},
	   				error : function(res, status, error){
	   					alert("<spring:message code="PROC.ERROR"/>");
	   				}
	   			});
			}
			
		} catch (error) {
			console.error("[Error] 업무 캘린더 삭제 처리 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" name="form" method="POST">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>

	<!-- 업무 캘린더 팝업 -->
 	<div id="tldrArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1120.jsp"></c:import>	
	</div>

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
						<input type="hidden" id="empIdx" name="empIdx" value="${empVO.empIdx}">
					
						<div class="sub_content">					
							<div class="form_area">
								<div class="post_wrap">
									<h2>업무 캘린더
										<span class="float_right">
											<input type="button" class="btn_blue_thin" value="등록" onclick="regCall();">
										</span>
									</h2>
									
									<div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 업무명 -->
											<div class="srch_area">
													<label class="srch_label">업무명</label>
													<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
													
													<input type="button" id="listBtn" class="btn_blue" value="조회" onclick="listCall(this.form);">
												</div>	
		                                </div>
									</div>
								
									<div class="tldr_wrap">
										<div class="tldr_area">
											<div id="calendar">
												
											</div>
										</div><!-- End post_write -->
									</div><!-- End tldr_wrap -->
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
