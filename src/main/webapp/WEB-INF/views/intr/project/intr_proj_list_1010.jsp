<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 검색 조회
	function listCall(f){
		try {
			//
			formSubmit("intrProjInqy1010.do");
			
		} catch (error) {
	        console.error("[Error] 검색 조회 : ", error.message);
		}
	}

	// 등록 화면 조회
	function regCall(){
		try {
			//
			formSubmit("intrProjInqy1020.do");
			
		} catch (error) {
	        console.error("[Error] 등록 화면 조회 : ", error.message);
		}
	}
	
	// 상세 화면 조회
	function detCall(sequenceId) {
		try {
			//
			$("#sequenceId").val(sequenceId);
			formSubmit("intrProjInqy1030.do");
			
		} catch (error) {
	        console.error("[Error] 상세 화면 조회 : ", error.message);
		}
	}
	
	// 공지사항 삭제
	function delProc(f){
		try {
			// 삭제 배열 저장
			var deleteList = [];
			$(".deleteIdx").each(function(idx, tag){
				if($("#deleteIdx"+idx).is(':checked')){
					//				
					deleteList.push($("#deleteIdx"+idx).val());
				}
			});
			// 유효성 체크
			if(deleteList.length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}	
			//				
			if(confirm('삭제하시겠습니까?')){
				//
	   			$.ajax({
	   				type:	"post" , 
	   				traditional: true,
	   				url:	"intrProjProc1020.do",
	   				data:	{
	   					"deleteList":deleteList
	   				},
	   				success : function(data){
	   					var json = eval(data);
	   					
	   					if(json[0].res=="YES"){
	   						alert("<spring:message code="PROC.SUCCESS"/>");
	   	   					location.href="intrProjInqy1010.do?pageUrl=Proj";
	   	   					
	   					} else {
	   						alert("<spring:message code="PROC.ERROR"/>");
	   						return;
	   					}
	   				},
	   				error : function(res, status, error){
	   					alert("<spring:message code="PROC.ERROR"/>");
	   				}
	   			});
			}
			
		} catch (error) {
	        console.error("[Error] 공지사항 삭제 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" name="form" method="POST">
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
									<input type="hidden" id="sequenceId" name="sequenceId" value="">
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									
                                    <h2 class="content_heading">프로젝트 관리
										<span class="float_right">
                                            <input type="button" class="btn_blue_thin btn_action action_compact" value="등록" onclick="regCall();">
                                            <input type="button" class="btn_gray_thin btn_action action_compact" value="삭제" onclick="delProc(this.form);">
										</span>
									</h2>
									
									<div class="srch_wrap">
											<div class="right_srch_area">
												<!-- 수행일자 -->
												<div class="srch_area">
													<label class="srch_label">수행일자</label>
													<input type="text" class="srch_cdt_date srchDt" id="srchSdt" name="srchDt" value="${param.srchDt}" readonly="readonly" />
												</div>
												
												<!-- 진행상태 -->
												<div class="srch_area">
													<label class="srch_label">진행상태</label>
													<div class="select_wrap">
														<div id="statList" class="sList select_box choice_value">${empty param.srchStatNm ? '전체' : param.srchStatNm}</div>
														<input type="hidden" name="srchStatCd" value="${param.srchStatCd}">
														<input type="hidden" name="srchStatNm" value="${param.srchStatNm}">
													
														<ul class="sUl select_ul scroll_wrap choice_options">
															<c:forEach var="list" items="${statList}">
																<li class="choice_item" setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
															</c:forEach>
														</ul>
													</div>
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
												
												<!-- 담당자 -->
												<div class="srch_area">
													<label class="srch_label">담당자</label>
													<input type="text" id="srchIdx" name="srchIdx" class="srch_cdt_text" value="${param.srchIdx}" onkeydown="enterListCall(this.form);">
												</div>
												
												<!-- 프로젝트명 -->
												<div class="float_right">
													<div class="srch_area">
														<label class="srch_label">프로젝트명</label>
														<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
													
                                                        <input type="button" class="btn_blue btn_action" value="조회" onclick="listCall(this.form);">
                                                        <input type="button" class="btn_gray btn_action" value="초기화" onclick="initCall();">
													</div>
			                                	</div>
											</div>
										</div>
									
									<div class="post_table_wrap">
										<table class="post_table data_table">
											<caption>프로젝트 목록 조회</caption>
											<colgroup>
												<col class="w5per">
												<col class="w15per">
												<col class="auto">
												<col class="w20per">
												<col class="w15per">
												<col class="w15per">
											</colgroup>
											<thead>
												<tr>
                                                    <th class="table_header" scope="col">
														<span class="check_box">
                                                            <input type="checkbox" class="checkbox_input check_box everyChk">
                                                            <label class="checkbox_label" for="check_label"><span class="checkbox_mark check_label"></span></label>
														</span>
													</th>
                                                    <th class="table_header" scope="col">진행상태</th>
                                                    <th class="table_header" scope="col">프로젝트명</th>
                                                    <th class="table_header" scope="col">담당자</th>
                                                    <th class="table_header" scope="col">시작일</th>
                                                    <th class="table_header" scope="col">종료일</th>
												</tr>
											</thead>
											<tbody>
		                                    	<c:forEach var="list" items="${defaultList}" varStatus="status"> 
													<tr>
                                                        <td class="table_cell">
					                                       <span class="check_box">
                                                                <input type="checkbox"  name="checkBox" class="checkbox_input check_box deleteIdx" id="deleteIdx${status.index}" value="${list.projCd}">
                                                                <label class="checkbox_label" for="check_label"><span class="checkbox_mark"></span></label>
															</span>
														</td>
                                                        <td class="table_cell">${list.statusNm}</td>
                                                        <td class="_title table_cell">
															<c:if test="${list.fileYn eq 'Y'}">
																<img id="fileImg" src='resources/images/icon/icon_file.png' width="15" height="15" />
															</c:if>
															<a class="show_view a_title" onclick="detCall('${list.projCd}');">${list.projTitle}</a>
														</td>
                                                        <td class="table_cell">${list.orgNm} ${list.ownerNm} ${list.rankNm}</td>
                                                        <td class="table_cell">
															<span class="date">
																<fmt:parseDate value="${list.projSdt}" var="parseDt" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
																
																${formatDt}
															</span>
														</td>
                                                        <td class="table_cell">
															<span class="date">
																<fmt:parseDate value="${list.projEdt}" var="parseDt" pattern="yyyyMMdd"/>
																<fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
																
																${formatDt} 
															</span>	
														</td>
			                                        </tr>
		                                        </c:forEach>
		                                        
		                                        <!-- 글이 없는 경우 -->
		                                        <c:if test="${empty defaultList}">
		                                            <tr>
                                                        <td class="table_cell" align="center" colspan="6">
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
