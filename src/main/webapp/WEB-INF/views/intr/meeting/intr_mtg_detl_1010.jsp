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
				formSubmit('intrMtgInqy1010.do');
				
			} catch (error) {
		        console.error("[Error] 목록으로 : ", error.message);
			}
		}
		
		// 수정 화면
		function modCall() {
			try {
				//
				formSubmit('intrMtgInqy1040.do');
				
			} catch (error) {
		        console.error("[Error] 수정 화면 : ", error.message);
			}
		}
		
		// 삭제 처리
		function delProc(sequenceId) {
			try {
				//
				if(confirm('삭제하시겠습니까?')){
					//
		   			$.ajax({
		   				type:	"post" , 
		   				traditional: true,
		   				url:	"intrMtgProc1020.do",
		   				data:	{
		   					"sequenceId" : sequenceId
		   				},
		   				success : function(data){
		   					var json = eval(data);
		   					
		   					if(json[0].res=="YES"){
		   						alert("<spring:message code="PROC.SUCCESS"/>");
		   	   					location.href="intrMtgInqy1010.do?pageUrl=Mtg";
		   	   					
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
		        console.error("[Error] 삭제 처리 : ", error.message);
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
								<input type="hidden" id="sequenceId" name="sequenceId" value="${defaultInfo.mtgCd}">
								<input type="hidden" id="page" name="page" value="${param.page}">
								<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
								<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}"> 
								<input type="hidden" id="srchDt" name="srchDt" value="${param.srchDt}">
								<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
								<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
								<input type="hidden" id="srchIdx" name="srchIdx" value="${param.srchIdx}">
								
								<div class="post_wrap">
		                            <h2>회의 상세
		                       			<span class="float_right">
			                            	<button type="button" class="btn_blue_thin" onclick="listCall();">목록으로</button>
		                            	</span>
		                            </h2>
									<div class="post_view">
										<dl>
											<dt>회의명</dt>
											<dd>${defaultInfo.mtgTitle}</dd>
											<dt>회의 일자</dt>
											<dd>
												<span class="date">
													<fmt:parseDate value="${defaultInfo.mtgDt}" var="parseDt" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
													${fomatDt} 
												</span>	
											</dd>
										</dl>
										<dl>
											<dt>회의장소</dt>
											<dd>${defaultInfo.mtgLocNm}</dd>
											
											<dt>회의시간</dt>
											<dd>
												<fmt:parseDate value="${defaultInfo.mtgStm}" var="parseStm" pattern="HHmm"/>
												<fmt:formatDate value="${parseStm}" var="formatStm" pattern="HH:mm"/>

												<fmt:parseDate value="${defaultInfo.mtgEtm}" var="parseEtm" pattern="HHmm"/>
												<fmt:formatDate value="${parseEtm}" var="formatEtm" pattern="HH:mm"/>
												${formatStm} ~ ${formatEtm}
											</dd>
										</dl>
										<dl>
											<dt>설명/개요</dt>
											<dd class="post_text h310p">
												<pre>${defaultInfo.mtgCont}</pre>
											</dd>
										</dl>
										<dl class="post_file">
											<dt>회의자료</dt>
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
											<c:if test="${empVO.empIdx eq defaultInfo.mtgIdx}">
												<button type="button" class="btn_navy_thin" onclick="modCall();">수정</button>
												<button type="button" class="btn_gray_thin" onclick="delProc('${defaultInfo.mtgCd}');">삭제</button>
											</c:if>
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
