<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		// 결재선 UI 초기화
		AprvLineUI.init();
		
		// 첫 결재선 선택
		$("#lineTree").find("ul li:first-child").find('.a_btn').trigger('click');
	});
	
	// 결재선 선택
	$(document).on('click','.a_btn',function() {
		$(".a_btn").each(function() {
			$(this).removeClass('list_bg');
		});
		$(this).addClass('list_bg');
	});	

	// 결재선 조회
	function listCall(f){
		try {
			var param = $("#form").serialize();
			//
			$.ajax({
	    		type : 'post',
	        	url : 'intrAprvInqy4011.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	            	$("#lineTree").html(data);
	            	$("#empArea").css("display", "none");
	            },
	            error : function(data){
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 결재선 조회 : ", error.message);
		}
	}

	// 결재선 등록
	function regCall(){
		try {
			//
			$(".a_btn").removeClass('list_bg');
			var param = $("#form").serialize();
			//
			$.ajax({
	    		type : 'post',
	        	url : 'intrAprvInqy4012.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	            	    $("#aprvlineTb").html(data);
	            	    $("#empArea").css("display","inline-flex");
	            },
	            error : function(data){
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 결재선 등록 : ", error.message);
		}
	}
	
	// 결재선 상세
	function detCall(aprvlineId){
		try {
			// 결재선 지정
			$(".aprvlineId").val(aprvlineId);
			var param = $("#form").serialize();
			//
			$.ajax({
	    		type : 'post',
	        	url : 'intrAprvInqy4013.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	            	    $("#aprvlineTb").html(data);
	            	    $("#empArea").css("display","inline-flex");
	            },
	            error : function(data){
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 결재선 상세 : ", error.message);
		}
	}
	
	// 결재선 추가
	function moveBtn(f){
		try {
			//
			var cIdx = $("input[name=radioIdx]:checked");
			var obj = new Object();
			//			
			if(cIdx.length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}
			//
			obj["aprvIdx"] = cIdx.val();										// 사번
			obj["empNm"] = cIdx.attr("empNm");							// 사원
			obj["orgNm"] = cIdx.attr("orgNm");							// 부서
			obj["rankNm"] = cIdx.attr("rankNm");						// 직급
			obj["aprvNm"] = "";													// 결재 유형
			
			// 목록 생성
			addLine(obj);
			
		} catch (error) {
	        console.error("[Error] 결재선 추가 : ", error.message);
		}
	}
	
	// 화면 상 제거
	function delCall(t){
		try {
			//
			$(t).closest("tr").remove();
			
		} catch (error) {
	        console.error("[Error] 화면 상 제거 : ", error.message);
		}
	}
	
	// 유효성 검증
	function isAprvLine(){
		var isLine = true;		// 검증 여부
		var aprvCnt = 0;		// 결재자 수
		
		// 결재선 명칭이 없는 경우
		if($("#aprvlineNm").val() == ''){
			alert("<spring:message code="APRV.LINE.NM.NONE"/>");
			isLine = false;
			return;
		}
		//
		$(".setListTr").each(function(idx){
			// 결재자 확인
			var aprvtypeCd = $(this).find("input[name='aprvtypeCd']").val();
			
			if(aprvtypeCd == 'TYPE_0020'){		// 결재
				aprvCnt++;
			}
			
			// 결재 유형이 선택되지 않음
			if(idx != 0 && (aprvtypeCd == '' || aprvtypeCd == null || aprvtypeCd == 'undefined')){
				alert((idx + 1) + "번째 항목의 결재 유형이 선택되지 않았습니다.");
				isLine = false;
				return false;
			}
		});
		
		// 결재자가 없는 경우
		if(aprvCnt<1){
			alert("<spring:message code="APRV.LINE.ONE"/>");
			isLine = false;
			return;
		};
		//
		return isLine;
	}
	
	
	// 결재선 저장 처리
	function saveProc(aprvlineId){
		try {
			// 유효성 검증
			if(!isAprvLine()) return;
			
			// 결재선 저장
			if(confirm("<spring:message code="APRV.LINE.SAVE"/>")){
				//
				let  aprvlineList = [];
				
				$(".setListTr").each(function(idx){
		   			let aprvtypeCd = $(this).find("input[name='aprvtypeCd']").val();
		   			let aprvIdx = $(this).find("input[name='aprvIdx']").val();
					//		   			
		   			aprvlineList.push({
		   				"aprvtypeCd": aprvtypeCd,
		   				"aprvIdx": aprvIdx
		   			})
				});
				//
				$.ajax({
		    		type : 'post',
		        	url : 'intrAprvProc2010.do',
		            data : {
		            	sequenceId: aprvlineId,
		            	aprvlineNm: $("#aprvlineNm").val(),
		            	regIdx: "${empVO.empIdx}",
		            	aprvlineList: JSON.stringify(aprvlineList)
		            },
		            success : function(data){
						alert("<spring:message code="PROC.SUCCESS"/>");
		            	$("#srchLine").trigger('click');
		            },
		            error : function(data){
						alert("<spring:message code="PROC.ERROR"/>");
		            }
		      	});
			}
			
		} catch (error) {
	        console.error("[Error] 결재선 저장 처리 : ", error.message);
		}
	}
	
	// 새로고침
	function initCall(aprvlineId){
		try {
			//
			if(aprvlineId != ''){
				$("#" + aprvlineId).trigger("click");
			} else {
				$("#regBtn").trigger("click");
			}
			
		} catch (error) {
	        console.error("[Error] 결재선 새로고침 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" onsubmit="return false;">
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
								<input type="hidden" id="aprvlineId" class="aprvlineId" name="aprvlineId" value="">
							
								<div class="post_wrap">
									<h2>결재선 관리												
										<span class="float_right">
											<input type="button" id="regBtn" class="btn_blue_thin" value="등록" onclick="regCall();">
										</span>
									</h2>
	                                <div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 제목 -->
											<div class="srch_area">
												<label class="srch_label">제목</label>		
												<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
											
												<input type="button" id="srchLine" class="btn_blue" value="조회" onclick="listCall(this.form);">
												<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
											</div>
	                                	</div>
	                                </div>
	                                <!-- end Form srch_wrap  -->
										
									<div class="tree_wrap">
										<div id="treeArea" class="tree_area w400p h475p">
											<div id="lineTree" class="tree">
												<c:if test="${not empty defaultList}">
													<ul class="ul_1">
														<c:forEach var="list" items="${defaultList}" varStatus="status">
					           						   		<c:set var="spanIcon" 	value="icon_list"/> 
			
															<li class="li_1 ml15">
																<span class="${spanIcon}"></span>
																<a class="a_btn" id="${list.aprvlineId}" href="#" onclick="detCall('${list.aprvlineId}');">${list.aprvlineNm}</a>
															</li>
														</c:forEach>
													</ul>
												</c:if>
												<c:if test="${empty defaultList}">
													<ul class="ul_1">
														<li class="li_1 ml15">
															등록된 결재선이 없습니다.
														</li>
													</ul>
												</c:if>
											</div>	
										</div>
										
										<div id="empArea" class="emp_area" style="display: none;">
											<!-- 사용자 목록 -->
											<div id="empInfo" class="tree_area ml20 w400p h475p">
												<div class="tree">
													<ul class="ul_1">
																					
													<c:forEach var="list" items="${empList}" varStatus="status">
														<c:set var="spanIcon"	value="icon_folder"/>
														<c:set var="spanNm"	value="${list.orgNm}"/>
										
														<c:set var="nextLv"	value=""/>
														<c:set var="prevLv"	value=""/>
																						
														<c:if test="${list.isleaf eq 'Y'}">
															<c:set var="spanIcon" 	value="icon_list"/> 
															<c:set var="spanNm"	value="${list.empNm}"/>
														</c:if>
																						
														<c:if test="${empty list.lv }">
															<c:set var="nextLv"	value="1"/>
														</c:if>
																							
														<!-- 태그 열기 -->
														<c:choose>
															<c:when test="${list.lv gt prevLv}">
																<ul class="ul_${list.lv}">
																	<li class="li_${list.lv}">
																		<c:if test="${list.isleaf eq 'N'}">
																			<span class="${spanIcon}"></span>
																		</c:if>
																		<c:if test="${list.isleaf eq 'Y'}">
																			<img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
																			<span class="${spanIcon}"></span>
																			<input type="radio" id="radio${status.index}" name="radioIdx" value="${list.empIdx}" orgNm="${list.orgNm}" empNm="${list.empNm}" rankNm="${list.rankNm}">
																		</c:if>
																		<label for="radio${status.index}">${spanNm}</label>
															</c:when>
															<c:when test="${list.lv eq prevLv}">
																<c:if test="${list.isleaf eq 'Y'}">
																	<img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
																	<span class="${spanIcon}"></span>
																	<input type="radio" id="radio${status.index}" name="radioIdx" value="${list.empIdx}" orgNm="${list.orgNm}" empNm="${list.empNm}" rankNm="${list.rankNm}">
																</c:if>
																<label for="radio${status.index}">${spanNm}</label>
															</c:when>
														</c:choose>
												
														<!-- 태그 닫기 -->										
														<c:choose>
															<c:when test="${list.lv gt nextLv}">
																</li>
																									
																<c:forEach begin="1" end="${list.lv - nextLv}" varStatus="status">
																	<c:if test="${list.lv ne '1'}">
																			</ul>
																		</li>
																	</c:if>
																</c:forEach>
																									
															</c:when>
															<c:when test="${list.lv eq nextLv}">
																</li>
															</c:when>
														</c:choose>
																								
														<c:set var="prevLv" value="${list.lv}" />
													</c:forEach>
												</div>	
											</div>

											<!-- 화살표 -->
											<div id="treeArrow" class="tree_arrow" onclick="moveBtn(this.form);"></div>
											
											<!-- 사용자 목록 -->
											<div id="aprvlineTb" class="tree_info w646p"></div>
										</div><!-- End emp_area -->
									</div><!-- End tree_wrap -->
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
