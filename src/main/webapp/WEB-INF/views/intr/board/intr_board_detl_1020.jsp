<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<head>
	<script type="text/javascript">
		// 공지사항 등록 처리
		function regProc(f){
			try {
	  			// 유효성 검증
				if(!requiredProc()){return;};
				
				if(confirm("등록하시겠습니까?")){
					var fileList = setFormData();
					//
		   			$.ajax({
						url:"intrBoardProc1010.do",
						processData : false,
						contentType : false,
						data: fileList,
						type : 'post',
		   				success : function(data){
	   						//
	   						var json = eval(data);
	   						if(json[0].res=='YES'){
	   	   						//
	   							alert("<spring:message code="PROC.SUCCESS"/>");
		   						location.href = "intrBoardInqy1010.do?pageUrl=Board";
		   						
	   						}else if(json[0].res=='NO'){
	   	   						//
	   							alert("<spring:message code="PROC.FAIL"/>");
								return;	   							
	   						}else{
	   	   						//
	   							alert("<spring:message code="PROC.EXISTS"/>");
								return;	   							
	   						}
		   				},
		   				error : function(res, status, error){
		   					//
		   					alert("<spring:message code="PROC.ERROR"/>");
		   				}
		   			});
				}
				
			} catch (error) {
		        console.error("[Error] 공지사항 등록 처리 : ", error.message);
			}
		}
		
		// 목록으로
		function listCall() {
			try {
				//
				formSubmit('intrBoardInqy1010.do');
				
			} catch (error) {
		        console.error("[Error] 목록으로 : ", error.message);
			}
		}
	</script>
</head>

<body id="main">
<form id="form" method="POST" enctype="multipart/form-data">
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
					<div class="sub_content">					
						<div class=" form_area">
							<input type="hidden" id="empIdx" name="empIdx"  value="${empVO.empIdx}">
							<input type="hidden" id="page" name="page" value="${param.page}">
							<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
							<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
							<input type="hidden" id="srchSdt" name="srchSdt" value="${param.srchSdt}">
							<input type="hidden" id="srchEdt" name="srchEdt" value="${param.srchEdt}">
							<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
							<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
							<input type="hidden" id="srchIdx" name="srchIdx" value="${param.srchIdx}">
							<input type="hidden" id="filetypeCd" name="filetypeCd" value="BOARD">
								
							<div class="post_wrap">
								<h2>공지사항 등록</h2>
								<div class="post_view">
									<dl>
										<dt>
											<label for="post-title">&#10003; 제목</label>
										</dt>
										<dd>
											<input type="text" id="brdTitle" title="제목" name="brdTitle" isRequired="Y">
										</dd>
										<dt>사용여부</dt>
                                        <dd class="sel_2part">
                                        	<div class="radio_box enter-check_box">
                                            	<span class="radio-area">
                                                	<input type="radio" id="chk-yes" name="useYn" value="Y" checked="checked">
                                                	<label for="chk-yes">Y<span></span></label>
                                            	</span>
                                            	<span class="radio-area">
                                                	<input type="radio" id="chk-no" name="useYn" value="N" >
                                                	<label for="chk-no">N<span></span></label>
                                            	</span>
                                            </div>
                                        </dd>
									</dl>
									<dl>
										<dt>부서</dt>
										<dd>${empVO.orgNm}</dd>
										<dt>작성자</dt>
										<dd>${empVO.empNm} ${empVO.rankNm}</dd>
									</dl>
									<dl>
										<dt><label for="post_text">&#10003; 내용</label></dt>
										<dd class="post_text">
											<textarea id="brdCont" name="brdCont" title="내용" isRequired="Y"></textarea>
										</dd>
									</dl>
									<dl class="post_info">
										<dt>첨부 파일</dt>
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
								<div class="btn_wrap align_right">
									<button type="button" class="btn_navy_thin" onclick="regProc(this.form);">등록</button>
									<button type="button" class="btn_gray_thin" onclick="listCall();">취소</button>
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