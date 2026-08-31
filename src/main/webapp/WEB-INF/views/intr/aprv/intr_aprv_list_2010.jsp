<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 양식 선택
	function detCall(temptypeCd, mappingId, sequenceId){
		try {
				//	
				$("#sequenceId").val(sequenceId);
				$("#temptypeCd").val(temptypeCd);
				//
				formSubmit(mappingId);
				
		} catch (error) {
	        console.error("[Error] 양식 선택 : ", error.message);
		}
	}
	
	// 검색 조회
	function listCall(f){
		try {
			//
			formSubmit("intrAprvInqy2010.do");
			
		} catch (error) {
	        console.error("[Error] 목록으로 : ", error.message);
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
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="temptypeCd" name="temptypeCd" value="">
									
									<h2>결재 조회</h2>
									<div class="srch_wrap">
										<div class="right_srch_area">
											<!-- 기안일자 -->
											<div class="srch_area">
												<label class="srch_label">기안일자</label>
												<input type="text" class="srch_cdt_date srchSdt" id="srchSdt" name="srchSdt" value="${param.srchSdt}" readonly="readonly" />
												~
												<input type="text" class="srch_cdt_date srchEdt" id="srchEdt" name="srchEdt" value="${param.srchEdt}" readonly="readonly"/>
											</div>
											
											<!-- 결재 단계 -->
											<div class="srch_area">
												<label class="srch_label">결재단계</label>
												<div class="select_wrap">
													<div id="workList" class="sList select_box">${empty param.srchStepNm ? '전체' : param.srchStepNm}</div>
													<input type="hidden" name="srchStepCd" value="${param.srchStepCd}">
													<input type="hidden" name="srchStepNm" value="${param.srchStepNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${stepList}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:forEach>
													</ul>
												</div>
											</div>
											
											<!-- 기안문 양식 -->
											<div class="srch_area">
												<label class="srch_label">기안문 양식</label>
												<div class="select_wrap">
													<div id="tempList" class="sList select_box">${empty param.srchTempNm ? '전체' : param.srchTempNm}</div>
													<input type="hidden" name="srchTempCd" value="${param.srchTempCd}">
													<input type="hidden" name="srchTempNm" value="${param.srchTempNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${tempList}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:forEach>
													</ul>
												</div>
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
									
									<div class="post_table_wrap">
										<table class="post_table">
											<caption>결재내역 목록 조회</caption>
											<colgroup>
												<col class="w7per">
												<col class="w15per">
												<col class="w15per">
												<col class="auto">
												<col class="w15per">
												<col class="w15per">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">순번</th>
													<th scope="col">기안문 양식</th>
													<th scope="col">결재단계</th>
													<th scope="col">제목</th>
													<th scope="col">기안자</th>
													<th scope="col">기안일자</th>
												</tr>
											</thead>
											<tbody>
		                                    	<c:forEach var="list" items="${defaultList}"> 
													<tr>
														<td class="first_td">${list.num}</td>
														<td>${list.tempNm}</td>
														<td>${list.aprvstepNm}</td>
														<td class="_title">
															<a class="show_view a_title" onclick="detCall('${list.temptypeCd}', '${list.detMappingId}', '${list.aprvId}');">
																<script>document.write(isNew('${list.regDt}'))</script>
																${list.aprvTitle}
															</a>
															<c:if test="${list.fileYn eq 'Y'}">
																<img id="fileImg" src='resources/images/icon/icon_file.png' width="15" height="15" />
															</c:if>
														</td>
														<td>${list.orgNm} ${list.empNm} ${list.rankNm}</td>
														<td>
															<span class="date">
																<fmt:parseDate value="${list.regDt}" var="parseDt" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
																
																<fmt:parseDate value="${list.regTm}" var="parseTm" pattern="HHmmss"/>
																<fmt:formatDate value="${parseTm}" var="formatTm" pattern="HH:mm:ss"/>
																${formatDt} ${formatTm}
															</span>
														</td>
			                                        </tr>
		                                        </c:forEach>
		                                        
		                                        <!-- 글이 없는 경우 -->
		                                        <c:if test="${empty defaultList}">
		                                            <tr>
		                                                <td align="center" colspan="6">
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
