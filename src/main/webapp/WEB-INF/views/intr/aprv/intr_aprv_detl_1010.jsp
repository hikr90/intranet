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
			formSubmit('intrAprvInqy1010.do');
			
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

	<!-- 담당자 팝업 -->
 	<div id="empArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1010.jsp"></c:import>	
	</div>

	<!-- 프로젝트 팝업 -->
 	<div id="projArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1030.jsp"></c:import>	
	</div>
	
	<!-- 결재선 팝업 -->
 	<div id="lineArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1040.jsp"></c:import>	
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
								<input type="hidden" id="empIdx" name="empIdx" value="${empVO.empIdx}">
								<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
								<input type="hidden" id="tempCd" name="tempCd" value="${param.tempCd}">
								<input type="hidden" id="temptypeCd" name="temptypeCd" value="${param.temptypeCd}">
								<input type="hidden" id="returnUrl" name="returnUrl" value="${param.returnUrl}">
								<input type="hidden" id="filetypeCd" name="filetypeCd" value="APRV">
								<input type="hidden" id="formtypeCd" name="formtypeCd" value="LEAV">
										
								<div class="post_wrap">
		                        	<h2>휴가 신청서
											<button type="button" class="btn_blue_thin main_ie" onclick="listCall();">목록으로</button>											
		                        	</h2>
									<div class="post_view">
										<dl>
											<dt>
												<label for="post-title">&#10003; 기안명</label>
											</dt>
											<dd>
												<input type="text" id="aprvTitle" title="기안명" name="aprvTitle" isRequired="Y">
											</dd>
										</dl>
										<dl>
											<dt>
												<label for="post-title">&#10003; 프로젝트명</label>
											</dt>
											<dd>
												<input type="button" class="btn_blue align_top" value="선택" onclick="projCall();">
												<input type="text" id="projPnm" class="w1320p" title="프로젝트명" name="projPnm" readonly="readonly" isRequired="Y">
												<input type="hidden" id="projPcd" name="projPcd" value="">
											</dd>
										</dl>
										<dl>
								        	<dt>&#10003; 휴가기간</dt>
											<dd>
												<input type="text" class="srch_cdt_date srchDt" id="leavSdt" name="leavSdt" title="휴가기간 (시작)" value="" readonly="readonly" isRequired="Y" />
													~
												<input type="text" class="srch_cdt_date srchDt" id="leavEdt" name="leavEdt" title="휴가기간 (종료)" value="" readonly="readonly" isRequired="Y" />
											</dd>
											<dt>&#10003; 휴가 타입</dt>
											<dd class="sel_2part">
									        	<div class="select_wrap">
													<div id="leavList" class="sList select_box">${leavList[1].commcodeNm}</div>
													<input type="hidden" id="leavtypeCd" name="leavtypeCd" value="${leavList[1].commcodeCd}">
													<input type="hidden" id="leavtypeNm" name="leavtypeNm" value="${leavList[1].commcodeNm}">
											
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${leavList}">
															<c:if test="${list.commcodeCd != null and  list.commcodeCd != ''}">
																<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
															</c:if>
														</c:forEach>
													</ul>
												</div>
									    	</dd>
									    	<dt>&#10003; 대직자</dt>
											<dd>
												<input type="button" class="btn_blue align_top" value="선택" onclick="empCall();">
												<input type="text" id="empPnm" class="width30" name="leavSubst" title="대직자" value="" readonly="readonly" isRequired="Y">
											</dd>
										</dl>
								        <dl>
								        	<dt>&#10003; 사유</dt>
											<dd>
												<input type="text" id="leavRsn" title="사유" name="leavRsn" isRequired="Y">
											</dd>
								        </dl>
								        <dl>
											<dt><label for="post_text">&#10003; 기안내용</label></dt>
											<dd class="post_text">
												<textarea id="editor" name="aprvCont" title="기안내용" isRequired="Y">${tempInfo.tempCont}</textarea>
											</dd>
										</dl>
								        <dl class="post_info">
											<dt>파일 첨부</dt>
											<dd>
												<div class="file_box">
													<label for="fileUpd">업로드</label>
													<h4 class="file_text">업로드할 파일을 선택해주세요.</h4>
													<input type="file" id="fileUpd" name="fileUpd" class="btn_blue" multiple="multiple">
												</div>
											</dd>
										</dl>
										<dl class="post_info">
											<dt></dt>
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
									
									<div class="btn_wrap">
										<div class="float_right">
											<button type="button" class="btn_gray_thin" onclick="lineReg();">기안하기</button>
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
