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
				formSubmit('intrBoardInqy2010.do');
				
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
							<div class="sub_content">
								<div class="form_area">
									<input type="hidden" id="empIdx" name="empIdx"  value="${empVO.empIdx}">
									<input type="hidden" id="sequenceId" name="sequenceId" value="${defaultInfo.brdId}">
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
									<input type="hidden" id="srchSdt" name="srchSdt" value="${param.srchSdt}">
									<input type="hidden" id="srchEdt" name="srchEdt" value="${param.srchEdt}">
									<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
									<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
									<input type="hidden" id="useYn" name="useYn" value="${param.useYn}">	
									<input type="hidden" id="srchIdx" name="srchIdx" value="${param.srchIdx}">
									
									<div class="post_wrap">
                                           <h2 class="content_heading">공지사항 상세</h2>
									
                                        <div class="post_view form_panel">
                                            <dl class="form_row">
                                                <dt class="form_label">제목</dt>
                                                <dd class="form_value">${defaultInfo.brdTitle}</dd>
                                                <dt class="form_label">작성일</dt>
                                                <dd class="form_value">
													<span class="date">
														<fmt:parseDate value="${defaultInfo.regDt}" var="parseDt" pattern="yyyyMMdd"/>
														<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
														${fomatDt} 
													</span>	
												</dd>
                                                <dt class="form_label">조회수</dt>
                                                <dd class="form_value">${defaultInfo.readHit}</dd>
											</dl>
                                            <dl class="post_info form_row">
                                                <dt class="form_label">부서</dt>
                                                <dd class="form_value">${defaultInfo.orgNm}</dd>
                                                <dt class="form_label">직급</dt>
                                                <dd class="form_value">${defaultInfo.rankNm}</dd>
                                                <dt class="form_label">작성자</dt>
                                                <dd class="form_value">${defaultInfo.empNm}</dd>
											</dl>
				
                                            <dl class="post_file form_row">
                                                <dt class="form_label">첨부파일</dt>
                                                <dd class="post_file form_value form_attachments">
													<div class="file_wrap">
														<ul id="fileUl"> 
															<c:forEach var="list" items="${fileList}" varStatus="status">
																<li class="fileLi${status.index}">
																	<img src='resources/images/icon/icon_file.png' width="20" height="20" />
																	<a href="javascript:#" onclick="fileProc('${list.fileId}', '${list.fileSno}');">${list.fileNm}&nbsp;</a>
																	<input type="hidden" id="fileId" name="fileId" value="${list.fileId}">
																</li>
															</c:forEach>
														</ul>
													</div>
												</dd>
											</dl>
			
                                            <dl class="form_row">
                                                <dt class="form_label">내용</dt>
                                                <dd class="post_text form_value form_content">
													<pre>${defaultInfo.brdCont}</pre>
												</dd>
											</dl>
										</div><!-- End post_view -->
									
                                    <div class="btn_right btn_wrap">
										<div class="float_left">
											<c:if test="${not empty fileList and fileList ne '' and fileList.size() > 1}">
                                                <button type="button" class="btn_navy_thin btn_action action_compact" onclick="zipProc();">전체 다운로드</button>
											</c:if>
										</div>
										
										<div class="float_right">
                                            <button type="button" class="btn_gray_thin btn_action action_compact" onclick="listCall();">목록으로</button>
										</div>
									</div>
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
