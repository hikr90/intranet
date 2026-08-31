<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		// 첫번째 권한 클릭
		$("#roleTree").find("ul li:first-child").find('.a_btn').trigger('click');
	});
	
	$(document).on('click','.a_btn',function() {
		$(".a_btn").each(function() {
			$(this).removeClass('list_bg');
		});
		//
		$(this).addClass('list_bg');
	});	
	
	// 전체 선택 시 체크
	$(document).on('click','.totalIdx',function() {
		//
		var totalYn = $(this).is(':checked');
		$("input[name=empIdx]").each(function(){
			$(this).prop('checked',totalYn);
		});
	});	
		
	// 권한 조회
	function listCall(f){
		try {
			//
			var param = $("#form").serialize();
			
			$.ajax({
	    		type : 'post',
	        	url : 'intrRoleInqy1011.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	            	//
	            	$("#roleTree").html(data);
	            	$("#empArea").css("display","none");
	            },
	            error : function(data){
	            	//
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 권한 조회 : ", error.message);
		}
	}

	// 권한 상세보기
	function detCall(roleCd){
		try {
			// 권한 코드 지정
			$(".roleCd").val(roleCd);
			var param = $("#form").serialize();
			//
			$.ajax({
	    		type : 'post',
	        	url : 'intrRoleInqy3011.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	     				//
	            	    $("#empTree").html(data);
	            	    $("#empArea").css("display","inline-flex");
	            },
	            error : function(data){
	            	//
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 권한 상세보기 : ", error.message);
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
								<input type="hidden" id="roleCd" class="roleCd" name="roleCd" value="">
							
								<div class="post_wrap">
									<h2>사용자 권한 부여</h2>
		                                <div class="srch_wrap">
											<div class="right_srch_area">
												<!-- 제목 -->
												<div class="srch_area">
													<label class="srch_label">제목</label>		
													<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
												
													<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
													<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
												</div>
		                                	</div>
		                                </div>
		                                <!-- end Form srch_wrap  -->
										
										<div class="tree_wrap">
											<div id="treeArea" class="tree_area w400p h525p">
												<div id="roleTree" class="tree">
													<ul class="ul_1">
														<c:forEach var="list" items="${defaultList}" varStatus="status">
					           						   		<c:set var="spanIcon" 	value="icon_list"/> 
			
															<li class="li_1 ml15">
																<span class="${spanIcon}"></span>
																<a class="a_btn" id="${list.roleCd}" href="#" onclick="detCall('${list.roleCd}');">${list.roleNm}</a>
															</li>
														</c:forEach>
													</ul>
												</div>	
											</div>
											
											<div id="empArea" class="emp_area" style="display: none;">
												<!-- 사용자 목록 -->
												<div id="empInfo" class="tree_area ml20 w400p h525p">
													<div class="tree">
														<li class="li_1 ml15">
															<input type="checkbox" id="totalIdx" class="checkbox totalIdx" name="totalIdx">
															<span class="icon_total"></span>
															전체 선택
														</li>
																						
														<c:forEach var="list" items="${empList}" varStatus="status">
															<c:set var="spanIcon"	value="icon_folder"/>
															<c:set var="listNm"		value="${list.orgNm}"/>
															<c:set var="nextLv"		value="${empList[status.index+1].lv}"/>
															<c:set var="prevLv"		value=""/>
															
															<c:if test="${list.isleaf eq 'Y'}">
							           						   	<c:set var="spanIcon" 	value="icon_list"/> 
							           						   	<c:set var="listNm" 	value="${list.empNm}"/> 
							            					</c:if>
														
															<c:if test="${empty list.lv}">
							           						   	<c:set var="nextLv"	value="1"/>
							            					</c:if>

															<c:if test="${list.isleaf eq 'N'}">
																<ul>
															</c:if>
															
															<!-- 태그 열기 -->
															<c:choose>
																<c:when test="${list.lv gt prevLv}">
																	<li class="li_${list.lv}">
																		<c:if test="${list.isleaf eq 'Y'}">
																			&nbsp; <img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
																			<input type="checkbox" id="empIdx${status.index}" class="${list.isleaf eq 'N' ? 'orgCd' : 'empIdx'}" name="empIdx" value="${list.empIdx}" empNm="${list.empNm}" orgCd="${list.isleaf eq 'N' ? list.orgCd : list.upprorgCd}" orgNm="${list.orgNm}">
																		</c:if>
																		<span class="${spanIcon}"></span>
																		<label for="empIdx${status.index}">${listNm}</label>
																</c:when>
																<c:when test="${list.lv eq prevLv}">
																	<li class="li_${list.lv}">
																		<c:if test="${list.isleaf eq 'Y'}">
																			&nbsp; <img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
																			<input type="checkbox" id="empIdx${status.index}" class="${list.isleaf eq 'N' ? 'orgCd' : 'empIdx'}" name="empIdx" value="${list.empIdx}" empNm="${list.empNm}" orgCd="${list.isleaf eq 'N' ? list.orgCd : list.upprorgCd}" orgNm="${list.orgNm}">
																		</c:if>
																		<span class="${spanIcon}"></span>
																		<label for="empIdx${status.index}">${listNm}</label>
																</c:when>
															</c:choose>
				
															<!-- 태그 닫기 -->										
															<c:choose>
																<c:when test="${list.lv gt nextLv}">
																	</li>
																		</ul>
																	
																	<c:forEach begin="1" end="${list.lv - prevLv}" varStatus="status">
																		<c:if test="${list.lv ne '1'}">
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
														</ul>
													</div>	
												</div>

												<!-- 화살표 -->
												<div id="treeArrow" class="tree_arrow" onclick="moveBtn(this.form);"></div>
												
												<!-- 사용자 트리 -->
												<div id="empTree" class="tree_info w646p"></div>
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
