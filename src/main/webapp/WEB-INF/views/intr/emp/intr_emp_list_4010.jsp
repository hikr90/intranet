<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 인사 통계 조회
	function listCall(f){
		try {
			//
			formSubmit("intrEmpInqy4010.do");
			
		} catch (error) {
	        console.error("[Error] 인사 통계 조회 : ", error.message);
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
									<h2>인사 통계</h2>
									<div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 연도 -->
											<div class="srch_area">
												<label class="srch_label">연도</label>
												<div class="select_wrap">
													<div id="yearList" class="sList select_box">${empty param.srchYearNm ? yearList[0].commcodeNm : param.srchYearNm}</div>
													<input type="hidden" name="srchYearCd" value="${param.srchYearCd}">
													<input type="hidden" name="srchYearNm" value="${param.srchYearNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${yearList}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:forEach>
													</ul>
												</div>
											</div>
											
											<!-- 재직여부 -->
											<div class="srch_area">
												<label class="srch_label">재직여부</label>
												<div class="select_wrap">
													<div id="hireList" class="sList select_box">${empty param.srchHireNm ? '전체' : param.srchHireNm}</div>
													<input type="hidden" name="srchHireCd" value="${param.srchHireCd}">
													<input type="hidden" name="srchHireNm" value="${param.srchHireNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${hireList}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:forEach>
													</ul>
												</div>
											</div>
											
											<div class="float_right">
												<div class="srch_area">
													<label class="srch_label">부서명</label>
													<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
												
													<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
													<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
												</div>
											</div>
		                                </div>
									</div>
									<div class="post_table_wrap scroll_wrap h550p">
										<table class="post_table">
										    <caption>인사통계 목록페이지 입니다.</caption>
										    <colgroup>
										        <col class="w30per">
										        <c:forEach var="col" begin="1" end="12">
										            <col class="w12per">
										        </c:forEach>
										        <col class="w15per"> </colgroup>
										    <thead>
										        <!-- 연도 + 합계 (부서) -->
										        <tr>
										            <th>부서</th>
										            <c:forEach var="ym" items="${ymList}">
										                <th>${ym.yearNm}</th> 
										            </c:forEach>
										            <th class="bg_total">합계 (부서)</th>
										        </tr>
										    </thead>
										    <tbody>
										        <c:forEach var="org" items="${orgList}">
										            <tr>
										                <td class="">${org.orgNm}</td>
										                
										                <c:forEach var="ym" items="${ymList}">
										                    <%-- 통계(01 ~ 12) --%>
										                    <c:set var="key" value="${org.orgNm}_${ym.yearMm}" />
										                    <c:set var="data" value="${statList[key]}" />
										                    
										                    <td>
										                    	<c:choose>
										                    		<c:when test="${param.srchHireNm eq 'Y'}">${not empty data ? data.hireTotal : 0}</c:when>
										                    		<c:when test="${param.srchHireNm eq 'N'}">${not empty data ? data.leavTotal : 0}</c:when>
										                    		<c:otherwise>${not empty data ? data.hireTotal : 0} / ${not empty data ? data.leavTotal : 0}</c:otherwise>
										                    	</c:choose>
										                    </td>
										                </c:forEach>
										                
										                <%-- 합계(부서) --%>
										                <c:set var="rowKey" value="${org.orgNm}_연간 소계" />
										                <c:set var="rowData" value="${statList[rowKey]}" />

										                <td class="bold">
										              		<c:choose>
										                    	<c:when test="${param.srchHireNm eq 'Y'}">${not empty rowData ? rowData.hireTotal : 0}</c:when>
										                    	<c:when test="${param.srchHireNm eq 'N'}">${not empty rowData ? rowData.leavTotal : 0}</c:when>
										                    	<c:otherwise>${not empty rowData ? rowData.hireTotal : 0} / ${not empty rowData ? rowData.leavTotal : 0}</c:otherwise>
										                    </c:choose>
										                </td>
										            </tr>
										        </c:forEach>
										    </tbody>
										    
										    <tfoot>
										        <tr>
										            <td class="bg_total fw_700 c_214b97 bc_f3f6f8">합계 (월)</td>
										            <c:forEach var="ym" items="${ymList}">
										                <%-- 합계(월) --%>
										                <c:set var="colKey" value="전체 합계_${ym.yearMm}" />
										                <c:set var="colData" value="${statList[colKey]}" />
										                
										                <td class="bold">
										                	<c:choose>
										                    	<c:when test="${param.srchHireNm eq 'Y'}">${not empty colData ? colData.hireTotal : 0}</c:when>
										                    	<c:when test="${param.srchHireNm eq 'N'}">${not empty colData ? colData.leavTotal : 0}</c:when>
										                    	<c:otherwise>${not empty colData ? colData.hireTotal : 0} / ${not empty colData ? colData.leavTotal : 0}</c:otherwise>
										                    </c:choose>
										                </td>
										            </c:forEach>
										            
										            <%-- 전체 총합 : 합계(월) + 합계(부서) --%>
										            <c:set var="grandKey" value="전체 합계_연간 소계" />
										            <c:set var="grandData" value="${statList[grandKey]}" />
										            
										            <td class="bold">
										            	<c:choose>
									                    	<c:when test="${param.srchHireNm eq 'Y'}">${not empty grandData ? grandData.hireTotal : 0}</c:when>
									                    	<c:when test="${param.srchHireNm eq 'N'}">${not empty grandData ? grandData.leavTotal : 0}</c:when>
									                    	<c:otherwise>${not empty grandData ? grandData.hireTotal : 0} / ${not empty grandData ? grandData.leavTotal : 0}</c:otherwise>
									                    </c:choose>
										            </td>
										        </tr>
										    </tfoot>
										</table>
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
