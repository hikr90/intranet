<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 검색 조회
	function listCall(f){
		formSubmit("intrAprvInqy1010.do");
	}

	// 양식 선택
	function detCall(tempCd, temptypeCd, mappingId){
		//
		try {
			//
			$("#tempCd").val(tempCd);
        	$("#temptypeCd").val(temptypeCd);
			//
			formSubmit(mappingId);
			
		} catch (error) {
	        console.error("[Error] 양식 선택 : ", error.message);
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
									<input type="hidden" id="temptypeCd" name="temptypeCd" value="">
									<input type="hidden" id="tempCd" name="tempCd" value="">
									
									<h2>기안 작성</h2>
									<div class="srch_wrap">
										<!-- 제목 -->
										<div class="srch_area">
											<label class="srch_label">제목</label>
											<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
										
											<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
											<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
										</div>
									</div>
									
									<div class="post_table_wrap scroll_wrap">
										<table class="post_table">
											<caption>결재내역 목록 조회</caption>
											<colgroup>
												<col class="w7per">
												<col class="auto">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">순번</th>
													<th scope="col">양식명</th>
												</tr>
											</thead>
											<tbody>
		                                    	<c:forEach var="list" items="${defaultList}"> 
													<tr>
														<td class="first_td">${list.num}</td>
														<td class="_title">
															<a class="show_view a_title" onclick="detCall('${list.tempCd}','${list.temptypeCd}', '${list.regMappingId}');">${list.tempNm}</a>
														</td>
			                                        </tr>
		                                        </c:forEach>
		                                        
		                                        <!-- 글이 없는 경우 -->
		                                        <c:if test="${empty defaultList}">
		                                            <tr>
		                                                <td align="center" colspan="2">
		                                              	      등록된 글이 없습니다.
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
