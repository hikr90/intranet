<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 사원 등록
	function regCall(){
		try {
			//
			formSubmit("intrEmpInqy1020.do");
			
		} catch (error) {
	        console.error("[Error] 사원 등록 : ", error.message);
		}
	}
	
	// 검색 조회
	function listCall(f){
		try {
			//
			formSubmit("intrEmpInqy1010.do");
			
		} catch (error) {
	        console.error("[Error] 검색 조회 : ", error.message);
		}
	}
	
	// 사원 상세보기
	function detCall(empIdx){
		try {
			// 시퀀스, 사원 번호 지정
			$("#sequenceId").val(empIdx);
			$("#empIdx").val(empIdx);
			//
			formSubmit("intrEmpInqy1030.do");
			
		} catch (error) {
	        console.error("[Error] 사원 상세보기 : ", error.message);
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
						<div id="sub_content">					
							<div class="form_area">
								<div class="post_wrap">
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="sequenceId" name="sequenceId" value="">
									<input type="hidden" id="empIdx" name="empIdx" value="">

									<h2>사원 조회
										<span class="float_right">
											<input type="button" class="btn_navy_thin" value="등록" onclick="regCall();">
										</span>
									</h2>
									
									<div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 입사일자 -->
											<div class="srch_area">
												<label class="srch_label">입사일자</label>
												<input type="text" class="srch_cdt_date srchSdt" id="srchSdt" name="srchSdt" value="${param.srchSdt}" readonly="readonly" />
												~
												<input type="text" class="srch_cdt_date srchEdt" id="srchEdt" name="srchEdt" value="${param.srchEdt}" readonly="readonly"/>
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
											
											<!-- 재직여부 -->
											<div class="srch_area">
												<label class="srch_label">재직여부</label>
												<div class="select_wrap">
													<div id="hireList" class="sList select_box">${empty param.hireNm ? '전체' : param.hireNm}</div>
													<input type="hidden" name="hireCd" value="${param.hireCd}">
													<input type="hidden" name="hireNm" value="${param.hireNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${hireList}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:forEach>
													</ul>
												</div>
											</div>
												
											<!-- 사원명 -->
											<div class="float_right">
												<div class="srch_area">
													<label class="srch_label">사원명</label>
													<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
												
													<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
													<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
												</div>
		                                	</div>
		                                </div>
									</div>
									
									<div class="post_table_wrap">
										<table class="post_table">
											<caption>사원 목록페이지 입니다.</caption>
											<colgroup>
												<col class="w12per">
												<col class="w12per">
												<col class="w12per">
												<col class="w12per">
												<col class="w8per">
												<col class="w8per">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">입사일</th>
													<th scope="col">부서</th>
													<th scope="col">직급</th>
													<th scope="col">사원명</th>
													<th scope="col">연락처</th>
													<th scope="col">재직여부</th>
												</tr>
											</thead>
											<tbody>
		                                    	<c:forEach var="list" items="${defaultList}"> 
													<tr>
														<td class="first_td">
															<span class="date">
																<fmt:parseDate value="${list.hireDt}" var="parseDt" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
																${fomatDt} 
															</span>
														</td>
														<td>${list.orgNm}</td>
														<td>${list.rankNm}</td>
														<td>
															<a class="show_view a_title" onclick="detCall('${list.empIdx}');">${list.empNm}</a>
														</td>
														<td>${list.mobNo}</td>
														<td>${list.leavYn}</td>
			                                        </tr>
		                                        </c:forEach>
		                                        
		                                        <!-- 글이 없는 경우 -->
		                                        <c:if test="${empty defaultList}">
		                                            <tr>
		                                                <td align="center" colspan="6">
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