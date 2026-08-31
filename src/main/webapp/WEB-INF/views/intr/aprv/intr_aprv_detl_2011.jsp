<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<head>
<script type="text/javascript">
	$(document).ready(function() {
		// 에디터
		CKEDITOR.replace('editor',{height: 710});
	});

	// 목록으로
	function listCall() {
		try {
			//
			formSubmit('intrAprvInqy2010.do');
			
		} catch (error) {
	        console.error("[Error] 목록으로 : ", error.message);
		}
	}
</script>
</head>
<body id="main">
<form id="form" method="POST" onsubmit="return false;">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>

	<!-- 프로젝트 팝업 -->
 	<div id="projArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1030.jsp"></c:import>	
	</div>
	
	<!-- 결재선 팝업 -->
 	<div id="lineArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1040.jsp"></c:import>	
	</div>
	
	<!-- 결재의견 팝업 -->
	<div id="opinArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1050.jsp"></c:import>	
	</div>
	
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
								<input type="hidden" id="page" name="page" value="${param.page}">
								<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
								<input type="hidden" id="sequenceId" name="sequenceId" value="${param.sequenceId}">
								<input type="hidden" id="currAprvSno" name="currAprvSno" value="${defaultInfo.currAprvSno}">
								<input type="hidden" id="empIdx" name="empIdx" value="${empVO.empIdx}">
								<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
								<input type="hidden" id="tempCd" name="tempCd" value="${param.tempCd}">
								<input type="hidden" id="temptypeCd" name="temptypeCd" value="${param.temptypeCd}">
								<input type="hidden" id="returnUrl" name="returnUrl" value="${param.returnUrl}">
								<input type="hidden" id="filetypeCd" name="filetypeCd" value="APRV">
								<input type="hidden" id="srchSdt" name="srchSdt" value="${param.srchSdt}">
								<input type="hidden" id="srchEdt" name="srchEdt" value="${param.srchEdt}">
								<input type="hidden" id="srchStepCd" name="srchStepCd" value="${param.srchStepCd}">								
										
								<div class="post_wrap">
		                        	<h2>가지급결의서
											<button type="button" class="btn_blue_thin main_ie" onclick="listCall();">목록으로</button>											
		                        	</h2>
									<div class="post_view">
										<dl>
											<dt>
												<label for="post-title">기안명</label>
											</dt>
											<dd>
												${defaultInfo.aprvTitle}
											</dd>
										</dl>
										<dl>
											<dt>
												<label for="post-title">프로젝트명</label>
											</dt>
											<dd>
												${defaultInfo.projTitle}
											</dd>
											<dt>
												<label for="post-title">결재 단계</label>
											</dt>
											<dd>
												${defaultInfo.aprvstepNm}
											</dd>
										</dl>
										<dl>
											<dt>결재선</dt>
											<dd>
												<input type="button" class="btn_gray align_top mb5" value="조회" onclick="lineCall('${defaultInfo.aprvId}');">
											</dd>
											
											<dt>지급 방법</dt>
											<dd class="sel_2part">
									        	${defaultInfo.methodNm}
									    	</dd>
										</dl>
								        <dl>
								        	<dt>지급 일자</dt>
											<dd>
												<fmt:parseDate value="${defaultInfo.prepayDt}" var="parseDt" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
												${fomatDt}
											</dd>
											
											<dt>청구 금액</dt>
											<dd>
												${defaultInfo.prepayAmt}		
											</dd>
								        </dl>
								        <dl>
								        	<dt>사유</dt>
											<dd>
												${defaultInfo.prepayRsn}
											</dd>
								        </dl>
								        <dl>
											<dt><label for="post_text">기안내용</label></dt>
											<dd class="post_text">
												<textarea id="editor" name="aprvCont" title="기안내용">${defaultInfo.aprvCont}</textarea>
											</dd>
										</dl>
										<dl class="post_info">
											<dt>첨부파일</dt>
											<dd class="post_file">
												<div class="file_wrap">
													<!-- 파일 목록 -->
													<c:import url="/WEB-INF/views/intr/comm/include/intr_include_1040.jsp">
														<c:param name="fileNm"></c:param>
													</c:import>
												</div>
											</dd>
										</dl>
									</div><!-- End post_write -->
									
									<div class="btn_wrap align_right">
										<div class="float_left">
											<c:if test="${not empty fileList and fileList ne '' and fileList.size() > 1}">
												<button type="button" class="btn_navy_thin" onclick="zipProc();">전체 다운로드</button>
											</c:if>
										</div>
										
										 <!-- 결재 단계 -->
										<div class="float_right">
											<c:import url="/WEB-INF/views/intr/comm/btn/intr_btn_inqy_1010.jsp"></c:import>	
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
