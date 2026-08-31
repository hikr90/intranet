<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 오늘 (yyyy-mm-dd)
	var d = new Date();
	var today = getDateStamp(d);
	//
	$(document).ready(function() {
		// 오늘 지정
		var srchDt = "${param.srchDt}";
		if(srchDt=="") $("#srchDt").val(today);
		
		// 데이터 조회
		var isDefaultListEmpty = ${empty defaultList};
		if(isDefaultListEmpty) {
			addTask(true); // 기본 항목 추가
		}
	});
	
	// 목록 추가
	function addTask(isDef) {
		let html = ``;
		
		try {
			//
			if(isDef){
				html = `
						<div class="taskArea">
							<div>
								<input type="button" class="btn_gray_thin" value="행 삭제" onclick="removeCall(this);">
							</div>

							<div class="post_view">
								<dl>
									<dt>&#10003; 업무 제목</dt>
									<dd>
										<input type="text" class="taskTitle" title="업무 제목" isRequired="Y">
									</dd>
									<dt>등록 일자</dt>
									<dd>` + today + `</dd>
								</dl>
								<dl class="post_info">
									<dt>&#10003; 업무 시간</dt>
									<dd>
										<input type="text" class="width20 taskHh" title="업무(시간)" placeholder="HH" oninput="numProc(this);" isRequired="Y">
										<input type="text" class="width20 taskMm" title="업무(분)" placeholder="MM" oninput="numProc(this);" isRequired="Y">
									</dd>
									<dt>등록자</dt>
									<dd>` + "${empVO.orgNm}" + " " + "${empVO.empNm}" + `</dd>
								</dl>
	
								<dl>
									<dt>&#10003; 업무 내용</dt>
									<dd class="post_text" style="height: 300px;">
										<textarea name="taskCont" class="taskCont" title="업무 내용" isRequired="Y"></textarea>
									</dd>
								</dl>
							</div>
						</div>
				`
			}			
			//
			$("#taskWrap").append(html);
			
		} catch (error) {
	        console.error("[Error] 목록 추가 : ", error.message);
		}
	}
	
	// 목록 조회
	function listCall(f){
		var param = $("#form").serialize();
		//
		$.ajax({
	    	type : 'post',
	    	url : "intrTaskInqy1011.do",
			data : param,
			dataType : 'text',
			success : function(data){
				$("#taskWrap").html("");	// 초기화
				if(data.trim() != ''){
					$("#taskWrap").html(data);
				} else {
					addTask(true);
				}
			},
			error : function(xhr, status, error){
				alert("<spring:message code="PROC.ERROR"/>");				
	    	}
		})
	}

	// 목록 초기화
	function initTask(){
		try {
			//
			if(confirm("초기화하시겠습니까?")){
				$.ajax({
			    	type : 'post',
			    	url : "intrTaskInqy1011.do",
					data : {
						'empIdx':'${empVO.empIdx}',
						'srchDt':$('#srchDt').val()
					},
					dataType : 'text',
					success : function(data){
						$("#taskWrap").html("");	// 초기화

						// 데이터가 있는 경우
						if(data.trim() != ''){
							$("#taskWrap").html(data);
						} else {
							// 데이터가 없고, 행이 한건도 없는 경우
							if($(".taskArea").length == 0){
								addTask(true);								
							}
						}
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");				
			    	}
				});
			}

		} catch (error) {
	        console.error("[Error] 목록 초기화 : ", error.message);
		}
	}
	
	// 목록 저장
	function regProc(f){
		//
		try {
			// 유효성 검증
			let isValidate = true;
			$(".taskArea").each(function(idx) {
				var taskTitle = $(this).find(".taskTitle").val();
				var taskHh = $(this).find(".taskHh").val();
				var taskMm = $(this).find(".taskMm").val();
				var taskCont = $(this).find(".taskCont").val();
				//	
				if(taskTitle == ''){
					alert((idx + 1) + "행의 업무제목을 입력해주세요.");
					isValidate = false;
					return false;
				}
				if(taskHh == '' || taskMm == ''){
					alert((idx + 1) + "행의 업무시간을 입력해주세요.");
					isValidate = false;
					return false;
				}
				if(taskCont == ''){
					alert((idx + 1) + "행의 업무내용을 입력해주세요.");
					isValidate = false;
					return false;
				}
			});
			// 검증
			if(!isValidate){
				return;
			}
			// Data 생성
			let data = setTaskData();
			//
			if(confirm("저장하시겠습니까?")){
				$.ajax({
			    	type : 'post',
			    	url : "intrTaskProc1010.do",
					data : {
						'taskList':JSON.stringify(data),
						'empIdx':'${empVO.empIdx}',
						'srchDt':$("#srchDt").val()
					},
					dataType : 'text',
					success : function(data){
			    		//
   						var json = eval(data);
   						if(json[0].res=="YES"){
   							alert("<spring:message code="PROC.SUCCESS"/>");
							$("#srchBtn").trigger("click");
   							
   						} else {
   							alert("<spring:message code="PROC.FAIL"/>");
	   					}
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");				
				    }
				});
			}
			
		} catch (error) {
	        console.error("[Error] 목록 저장 : ", error.message);
		}
	}
	
	// 전송 데이터 생성
	function setTaskData(){
		let jObj = [];
		//
		$(".taskArea").each(function(idx) {
			var taskTitle = $(this).find(".taskTitle").val();
			var taskHh = $(this).find(".taskHh").val();
			var taskMm = $(this).find(".taskMm").val();
			var taskCont = $(this).find(".taskCont").val();
			var taskDt = $("#srchDt").val();
			//	
			var rObj = {
					'taskTitle':taskTitle,
					'taskHh':taskHh,
					'taskMm':taskMm,
					'taskCont':taskCont,
					'taskDt':taskDt,
					'empIdx':'${empVO.empIdx}'
			}
			//
			jObj.push(rObj);
		});
		//
		return jObj;
	}
	
	// 화면 상 삭제
	function removeCall(btn){
		try {
			// 유효성 검증
 			if($(".taskArea").length <= 1){
				alert("<spring:message code="TASK.CNT.NONE"/>");
				return;
			}
			// 업무 삭제
			$(btn).closest('.taskArea').remove();
			
		} catch (error) {
	        console.error("[Error] 화면 상 삭제 : ", error.message);
		}
	}
	
	// 업무일지 삭제
	function delProc(btn){
		try {
			//
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
			    	type : 'post',
			    	url : "intrTaskProc1020.do",
					data : {
						'empIdx':'${empVO.empIdx}',
						'srchDt':$("#srchDt").val()
					},
					dataType : 'text',
					success : function(data){
			    		//
   						var json = eval(data);
   						if(json[0].res=="YES"){
   							alert("<spring:message code="PROC.SUCCESS"/>");
							$("#srchBtn").trigger("click");
   							
   						} else {
   							alert("<spring:message code="PROC.FAIL"/>");
	   					}
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");				
				    }
				});
			}
			
		} catch (error) {
	        console.error("[Error] 업무일지 삭제 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" name="form" method="POST" onsubmit="return false;">
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
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="empIdx" name="empIdx" value="${empVO.empIdx}">
											
									<h2>업무일지
										<span class="float_right">
											<button type="button" class="btn_blue_thin" onclick="regProc(this.form);">저장</button>
											<button type="button" class="btn_gray_thin" onclick="delProc(this.form);">삭제</button>
										</span>
									</h2>
									<div class="srch_wrap">
										<div class="srch_area">
											<label class="srch_label">작성일자</label>
											<input type="text" class="srch_cdt_date srchDt" id="srchDt" name="srchDt" value="${param.srchDt}" readonly="readonly" />
											<input type="button" id="srchBtn" class="btn_blue" value="조회" onclick="listCall(this.form);">
										</div>
										
										<div class="srch_area float_right mt27">
											<button type="button" class="btn_navy" onclick="addTask(true);">추가</button>
											<button type="button" class="btn_gray" onclick="initTask();">초기화</button>
										</div>
									</div>
									
									<div id="taskWrap">
										<!-- 업무 작성 -->
										<c:forEach var="list" items="${defaultList}" varStatus="status"> 
											<div class="taskArea">
												<div>
													<input type="button" class="btn_gray_thin" value="행 삭제" onclick="removeCall(this);">
												</div>
												
												<div class="post_view">
													<dl>
														<dt>&#10003; 업무 제목</dt>
														<dd>
															<input type="text" class="taskTitle" title="업무 제목" value="${list.taskTitle}" isRequired="Y">
														</dd>
														<dt>등록 일자</dt>
														<dd>
															<fmt:parseDate value="${list.taskDt}" var="parseDt" pattern="yyyyMMdd"/>
															<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
															${fomatDt}
														</dd>
													</dl>
													<dl class="post_info">
														<dt>&#10003; 업무 시간</dt>
														<dd>
															<input type="text" class="width20 taskHh" title="업무(시간)" value="${list.taskHh}" placeholder="HH" oninput="numProc(this);" isRequired="Y">
															<input type="text" class="width20 taskMm" title="업무(분)" value="${list.taskMm}" placeholder="MM" oninput="numProc(this);" isRequired="Y">
														</dd>
														<dt>등록자</dt>
														<dd>${empVO.orgNm} ${empVO.empNm}</dd>
													</dl>
													
													<dl>
														<dt>&#10003; 업무 내용</dt>
														<dd class="post_text h300p">
															<textarea class="taskCont" title="업무 내용" isRequired="Y">${list.taskCont}</textarea>
														</dd>
													</dl>
												</div><!-- End post_view -->
											</div>
										</c:forEach>
										<!-- 업무 작성 -->
									</div>
								</div><!-- End post_wrap -->
							</div><!-- End content_area form_area -->
						</div><!-- End sub_content -->
					</div><!-- End content -->
				</article>
			</div>
		</div>
	</div>
</form>
</body>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>	