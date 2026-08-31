<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		// 페이지 로드 후 탭 오버플로우 체크
	    isTabOverlow();
	    
	    // 윈도우 크기가 변경될 때도 체크 (반응형 대응)
	    $(window).resize(function() {
	    	isTabOverlow();
	    });
	});
	
	// 담당업무 조회
	function listCall(f){
		try {
			//
			formSubmit("intrEmpInqy3010.do");
			
		} catch (error) {
	        console.error("[Error] 담당업무 조회 : ", error.message);
		}
	}
	
	// 탭 선택 처리
	function tabCall(element){
		//
		try {
			// Active 추가
			let elt = $(element);
			$('.tab_item').removeClass('active');
			elt.parent('li').addClass('active');

			// 부서 코드 조회
			let tabCd = elt.attr('tabCd');
			$("#tabCd").val(tabCd);
			//
			let param = $("#form").serialize();
			$.ajax({
		    	type : 'post',
		    	url : (tabCd == 'list') ? "intrEmpInqy3011.do" : "intrEmpInqy3012.do",
				data : param,
				dataType : 'text',
				success : function(data){
					$("#tabArea").html("");
					$("#tabArea").html(data);
				},
				error : function(xhr, status, error){
					alert("<spring:message code="PROC.ERROR"/>");	
		    	}
			})
			
		} catch (error) {
			console.error("[Error] 탭 선택 처리 : ", error.message);
		}
	}
</script>

<body id="main">
<form id="form" method="POST">
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
						<div class="sub_content">					
							<div class="form_area">
								<div class="post_wrap">
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="tabCd" name="tabCd" value="${param.tabCd}">
									<input type="hidden" id="empIdx" name="empIdx" value="${empVO.empIdx}">
									<input type="hidden" id="sequenceId" name="sequenceId" value="">
									<h2 id="title">담당업무 조회</h2>

									<!-- 탭 목록 -->
								    <div class="tab_container">
									    <div class="tab_wrapper">
										    <ul class="tab_list">
								    			<li class="tab_item ${list.tabCd eq param.tabCd or empty list.tabCd ? 'active' : ''}"><a href="javascript:void(0);" onclick="tabCall(this);" tabCd="list">담당업무 조회</a></li>
								    			<li class="tab_item ${list.tabCd eq param.tabCd and not empty list.tabCd ? 'active' : ''}"><a href="javascript:void(0);" onclick="tabCall(this);" tabCd="reg">담당업무 등록</a></li>
										    </ul>
									    </div>
								    </div>
									
									<div id="tabArea">
										<!-- 담당업무 조회 -->
										<div class="srch_wrap mt5">
											<div class="right_srch_area">
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
												
												<!-- 사원명 -->
												<div class="float_right">
													<div class="srch_area">
														<label class="srch_label">업무명 및 상세</label>
														<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
													
														<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
														<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
													</div>
			                                	</div>
			                                </div>
										</div>
										
										<div class="post_table_wrap">
											<table class="post_table">
												<caption>담당업무 목록페이지 입니다.</caption>
												<colgroup>
													<col class="w8per">
													<col class="w8per">
													<col class="w15per">
													<col class="w30per">
													<col class="w8per">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">담당자</th>
														<th scope="col">연락처</th>
														<th scope="col">담당업무</th>
														<th scope="col">상세</th>
														<th scope="col">대직자</th>
													</tr>
												</thead>
												<tbody>
			                                    	<c:forEach var="list" items="${defaultList}" varStatus="status"> 
														<tr>
															<td class="first_td">${list.empInfo}</td>
															<td>${list.mobNo}</td>
															<td>${list.dutyTitle}</td>
															<td>${list.dutyCont}</td>
															<td>${list.tpicInfo}</td>
				                                        </tr>
			                                        </c:forEach>
			                                        
			                                        <!-- 글이 없는 경우 -->
			                                        <c:if test="${empty defaultList}">
			                                            <tr>
			                                                <td align="center" colspan="5">
			                                              	      등록된 사원이 없습니다.
			                                                </td>
			                                            </tr>
			                                        </c:if>
												</tbody>
											</table>
										</div>
									
										<c:if test="${not empty defaultList}">
											<div class="paging_area">
												<div class="list_cnt">총 건수 : ${defaultList[0].listCnt}건</div>
												<ul class="paging">
													<li class="">${pageMenu}</li>
												</ul>
											</div><!-- End paging_wrap -->
										</c:if>
										<!-- 담당업무 조회 -->
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
