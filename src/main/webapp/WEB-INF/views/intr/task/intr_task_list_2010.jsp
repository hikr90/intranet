<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 목록 조회
	function listCall(){
		try {
			// 부서 선택
		    let orgCd = $("#orgCd").val();
		    $("a[orgCd='" + orgCd + "']").trigger('click');
			
		} catch (error) {
	        console.error("[Error] 목록 조회 : ", error.message);
		}
	}
	
	// +/- 처리
	function spreadProc(taskId){
		try {
			//
			var spreadType = $("#"+taskId).attr("spreadType");
			//		
			if(spreadType=="Y") {
				// close
				$("."+taskId).removeClass('hide');
				$("."+taskId).addClass('show');	
				$("#"+taskId).find('.spread').text("-");	
				$("#"+taskId).attr('spreadType','N');
	
			} else {
				// open
				$("."+taskId).removeClass('show');
				$("."+taskId).addClass('hide');	
				$("#"+taskId).find('.spread').text("+");	
				$("#"+taskId).attr('spreadType','Y');
			}
			
		} catch (error) {
	        console.error("[Error] +/- 처리 : ", error.message);
		}
	}
	
	// 업무 상세 조회
	function detCall(taskId){
		try {
			//
			$("#taskId").val(taskId);
			formSubmit("intrTaskInqy2030.do");
			
		} catch (error) {
	        console.error("[Error] 업무 상세 조회 : ", error.message);
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
										<input type="hidden" id="orgCd" name="orgCd" value="${param.orgCd}">
										<input type="hidden" id="taskId" name="taskId" value="">
										
										<h2>업무일지 조회</h2><br>
										<div class="srch_wrap mt5">
											<div class="right_srch_area">
												<!-- 작성일자 -->
												<div class="srch_area">
													<label class="srch_label">작성일자</label>
													<input type="text" id="srchSdt" class="srch_cdt_date" id="srchSdt" name="srchSdt" value="${param.srchSdt}" readonly="readonly"/>
													~
													<input type="text" id="srchEdt" class="srch_cdt_date" id="srchEdt" name="srchEdt" value="${param.srchEdt}" readonly="readonly"/>
												</div>
												
												<!-- 부서 -->
												<div class="srch_area">
													<label class="srch_label">부서</label>
													<div class="select_wrap">
														<div id="orgList" class="sList select_box">${empty param.orgNm ? '전체' : param.orgNm}</div>
														<input type="hidden" name="orgCd" value="${param.orgCd}">
														<input type="hidden" name="orgNm" value="${param.orgNm}">
													
														<ul class="sUl select_ul scroll_wrap">
															<c:forEach var="list" items="${orgList}">
																<li setNm="${list.orgNm}" setCd="${list.orgCd}">${list.orgNm}</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											
												<!-- 작성자 -->
												<div class="float_right">
													<div class="srch_area">
														<label class="srch_label">작성자</label>
														<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
														
														<input type="button" class="btn_blue" value="조회" onclick="listCall();">
														<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
													</div>
			                                	</div>
			                                </div>
										</div>
										
										<!-- 탭 내용 -->
										<div id="tabArea" class="tab_content_area">
											<table class="post_table">
												<caption>업무일지 조회</caption>
												<colgroup>
													<col class="w5per">
													<col class="auto">
													<col class="w10per">
													<col class="w10per">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">+/-</th>
														<th scope="col">업무 제목</th>
														<th scope="col">등록 시간</th>
														<th scope="col">등록자</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="list" items="${defaultList}" varStatus="status"> 
											        	<c:set var="none" value="none${status.index}" />
														<tr id="${list.rowNum eq 1 ? list.taskId : none}" class="${list.rowNum eq 1 ? '' : list.taskId} ${list.rowNum eq 1 ? 'show' : 'hide'}" spreadType="${list.rowNum eq 1 ? 'Y' : 'N'}">
													        <c:if test="${list.rowNum eq 1}">
													            <td rowspan="${list.rowCnt}">
													                <a class="spread" onclick="spreadProc('${list.taskId}');">+</a>
													            </td>
													        </c:if>
											
													        <td class="_title">
											    		        <a href="javascript:void(0);" class="show_view a_title c_214b97" onclick="detCall('${list.taskId}');">${list.taskTitle}</a>
											    		    </td>
											
													        <c:if test="${list.rowNum eq 1}">
													            <td rowspan="${list.rowCnt}">
													                <span class="date">
													                    <fmt:parseDate value="${list.taskDt}" var="parseDt" pattern="yyyyMMdd"/>
													                    <fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
													                
													                    ${formatDt}
													                </span>
													            </td>
													            <td rowspan="${list.rowCnt}">${list.orgNm} ${list.empNm}</td>
													        </c:if>
													</tr>
												</c:forEach>
											
													<!-- 글이 없는 경우 -->
													<c:if test="${empty defaultList}">
												    	<tr>
															<td align="center" colspan="4">등록된 글이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
											
											<c:if test="${not empty defaultList}">
												<div class="paging_area">
													<div class="list_cnt">총 건수 : ${defaultList[0].listCnt}건</div>
														<ul class="paging">
															<li class="">${pageMenu}</li>
														</ul>
												</div><!-- End paging_wrap -->
											</c:if>
										</div>
										
								</div><!-- End post_wrap  -->
							</div><!-- End form_area -->
						</div><!-- End content -->
					</div><!-- End wrap -->
				</article>
			</div>
		</div>
	</div>
</form>
</body>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>
