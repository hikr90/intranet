<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<head>
	<script type="text/javascript">
		// 목록으로
		function listCall() {
			try {
				//
				formSubmit('intrTaskInqy2010.do');
				
			} catch (error) {
		        console.error("[Error] 목록으로 : ", error.message);
			}
		}
	</script>
</head>
<body id="main">
<form id="form" method="POST">
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
								<input type="hidden" id="empIdx" name="empIdx"  value="${empVO.empIdx}">
								<input type="hidden" id="page" name="page" value="${param.page}">
								<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
								<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
								<input type="hidden" id="srchSdt" name="srchSdt" value="${param.srchSdt}">
								<input type="hidden" id="srchEdt" name="srchEdt" value="${param.srchEdt}">
								<input type="hidden" id="orgCd" name="orgCd" value="${param.orgCd}">
								
								<div class="post_wrap">
                                    <h2 class="content_heading">업무일지 상세
                                        <button type="button" class="btn_blue_thin float_right btn_action action_compact" onclick="listCall();">목록으로</button>
		                            </h2>
									<div id="taskWrap">
										<!-- 업무 작성 -->
										<c:forEach var="list" items="${defaultList}" varStatus="status"> 
											<div class="taskArea">
                                                <div class="post_view form_panel">
                                                    <dl class="form_row">
                                                        <dt class="form_label">업무 제목</dt>
                                                        <dd class="form_value">
															${list.taskTitle}
														</dd>
                                                        <dt class="form_label">등록 일자</dt>
                                                        <dd class="form_value">
															<fmt:parseDate value="${list.taskDt}" var="parseDt" pattern="yyyyMMdd"/>
															<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
															${fomatDt}
														</dd>
													</dl>
                                                    <dl class="post_info form_row">
                                                        <dt class="form_label">업무 시간</dt>
                                                        <dd class="form_value">
															${list.taskHh}시간 ${list.taskMm}분
														</dd>
                                                        <dt class="form_label">등록자</dt>
                                                        <dd class="form_value">${list.orgNm} ${list.empNm}</dd>
													</dl>
													
                                                    <dl class="form_row">
                                                        <dt class="form_label">업무 내용</dt>
                                                        <dd class="post_text form_value form_content form_content_short">
															${list.taskCont}
														</dd>
													</dl>
												</div><!-- End post_view -->
											</div>
										</c:forEach>
										<!-- 업무 작성 -->
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
