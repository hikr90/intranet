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
				formSubmit('intrBoardInqy1010.do');
				
			} catch (error) {
		        console.error("[Error] 목록으로 : ", error.message);
			}
		}
		
		// 수정 화면
		function modCall() {
			try {
				//
				formSubmit('intrBoardInqy1040.do');
				
			} catch (error) {
		        console.error("[Error] 수정 화면 : ", error.message);
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
		                            <h2>공지사항 상세</h2>
									<div class="post_view">
										<dl>
											<dt>제목</dt>
											<dd>${defaultInfo.brdTitle}</dd>
											<dt>작성일</dt>
											<dd>
												<span class="date">
													<fmt:parseDate value="${defaultInfo.regDt}" var="parseDt" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
													${fomatDt} 
												</span>	
											</dd>
										</dl>
										<dl class="post_info">
											<dt>부서</dt>
											<dd>${defaultInfo.orgNm}</dd>
											<dt>작성자</dt>
											<dd>${defaultInfo.empNm}</dd>
										</dl>
										<dl>
											<dt>내용</dt>
											<dd class="post_text">
												<pre>${defaultInfo.brdCont}</pre>
											</dd>
										</dl>
										<dl class="post_file">
											<dt>첨부파일</dt>
											<dd class="post_file">
												<div class="file_wrap">
													<ul id="fileUl"> 
													<c:forEach var="list" items="${fileList}" varStatus="status">
														<li class="${status.index != 0 ? 'nbsp' : ''}">
															<img src='resources/images/icon/icon_file.png' width="15" height="15"/>
															<a href="#" onclick="fileProc('${list.fileId}', '${list.fileSno}');">${list.fileNm}</a>
															<input type="hidden" id="fileId" name="fileId" value="${list.fileId}">
														</li>
													</c:forEach>
													</ul>
												</div>
											</dd>
										</dl>
									</div><!-- End post_view -->
		
									<div class="btn_wrap align_right">
										<div class="float_right">
											<c:if test="${defaultInfo.empIdx eq empVO.empIdx}">
												<button type="button" class="btn_navy_thin" onclick="modCall();">수정</button>
											</c:if>
											<button type="button" class="btn_gray_thin" onclick="listCall();">목록으로</button>
										</div>
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
