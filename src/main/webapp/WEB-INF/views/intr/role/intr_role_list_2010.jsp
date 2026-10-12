<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		// 첫번째 권한 클릭
		$(".tree_area").find("ul li:first-child").find('.a_btn').trigger('click');
	});
	
	// 선택 항목 음영 처리
	$(document).on('click','.a_btn',function() {
		$(".a_btn").each(function() {
			$(this).removeClass('list_bg');
		})
		//
		$(this).addClass('list_bg');
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
	            	$("#menuArea").css("display","inline-flex");
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
			
			$.ajax({
	    		type : 'post',
	        	url : 'intrRoleInqy2011.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	     				//
	            	    $("#roleInfo").html(data);
	            	    $("#menuArea").css("display","inline-flex");
	            },
	            error : function(data){
	            	//
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 권한 상세조회 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" onsubmit="return false;">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>
	
	<div class="main_wrap">
		<!-- 좌측 메뉴 -->
		<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1031.jsp" %>
		
		<div class="content_wrap">
			<div class="content_area"> 
				<article class="sub_article">
					<div class="content">
						<div id="sub_content">					
							<div class="form_area">
								<div class="post_wrap">
									<input type="hidden" id="roleCd" class="roleCd" name="roleCd" value="">
								
                                    <h2 class="content_heading">메뉴 권한 부여</h2>
	                                <div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 제목 -->
											<div class="srch_area">
												<label class="srch_label">제목</label>		
												<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
											
                                                <input type="button" class="btn_blue btn_action" value="조회" onclick="listCall(this.form);">
                                                <input type="button" class="btn_gray btn_action" value="초기화" onclick="initCall();">
											</div>
	                                	</div>
	                                </div>
										
									<div class="tree_wrap tree_workspace">
										<div id="tree_area" class="scroll_wrap tree_area tree_navigation">
											<div id="roleTree" class="tree">
												<c:if test="${not empty defaultList}">
													<ul class="ul_1">
													<c:forEach var="list" items="${defaultList}" varStatus="status">
					           						   	<c:set var="spanIcon" 	value="icon_list"/> 
			
                                                        <li class="tree_item li_1">
														<span class="tree_icon ${spanIcon}"></span>
														<a class="a_btn" id="${list.roleCd}" href="#" onclick="detCall('${list.roleCd}');">${list.roleNm}</a>
													</c:forEach>
													</ul>
												</c:if>
												<c:if test="${empty defaultList}">
													<ul class="ul_1">
                                                        <li class="tree_item li_1">
															등록된 권한이 없습니다.
														</li>
													</ul>
												</c:if>
											</div>	
										</div>
											
                                        <div id="menuArea" class="menu_area menu_assignment">
											<!-- 권한 메뉴 목록 -->
											<div id="menuInfo" class="tree_info tree_choices ml20">
												<div class="list_panel list_panel_fill">
													<div class="scroll_wrap list_body">
														<table class="post_table data_table menuTbl">
															<caption>권한 목록 테이블</caption>
															<colgroup>
																<col class="w5per">
																<col class="w30per">
															</colgroup>
															<thead>
																<tr>
                                                                    <th class="table_header" scope="col">
																		<span class="check_box">
                                                                            <input type="checkbox" class="checkbox_input check_box menuChk">
                                                                            <label class="checkbox_label_lead checkbox_label" for="chk-yes"><span class="checkbox_mark"></span></label>
																		</span>
																	</th>
                                                                    <th class="table_header" scope="col">전체 메뉴</th>
																</tr>
															</thead>
															<tbody>
										                       	<c:forEach var="list" items="${tMenuList}" varStatus="status"> 
																<tr>
                                                                    <td class="table_cell">
								                                       <span class="check_box">
                                                                            <input type="checkbox" class="checkbox_input check_box" id="menuCd" name="menuCd" value="${list.menuCd}" menuNm="${list.menuNm}" menutypeCd="${list.menutypeCd}" menuLv="${list.lv}">
                                                                            <label class="checkbox_label_lead checkbox_label" for="chk-yes"><span class="checkbox_mark"></span></label>
																		</span>
																	</td>
                                                                    <td class="align_left table_cell">
																		<c:if test="${list.lv ne '1'}">
																			&nbsp; <img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
																		</c:if>
																		${list.menuNm}
																	</td>
																</tr>
								                                </c:forEach>
															</tbody>
														</table>
													</div>
												</div><!-- End post_wrap -->
											</div>
											
											<!-- 화살표 -->
											<div id="treeArrow" class="tree_arrow" onclick="moveBtn(this.form);"></div>
											
											<!-- 권한 목록 -->
											<div id="roleInfo" class="tree_info tree_detail"></div>
										</div> <!-- End menu_area -->
									</div>
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