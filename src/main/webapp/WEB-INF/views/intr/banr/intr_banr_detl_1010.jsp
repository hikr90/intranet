<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<head>
	<script type="text/javascript">
		// 저장 처리
		function saveProc(){
			try {
				// 유효성 검증
				if(!requiredProc()){return;};

				// 확장자 검증
				var fileInput = $("#fileUpd");
				if (fileInput.val() != '') {
					// 정규표현식을 사용하여 확장자 검사 (jpg, jpeg, png)
					var fileName = fileInput.get(0).files[0].name;
					var allowedExt = /\.(jpe?g|png)$/i;
					
					if (!allowedExt.test(fileName)) {
						alert("<spring:message code="BANR.FILE.EXT"/>");
						fileInput.val('');
						return; 
					}
				}
				// Date 검증
			    var banrSdt = new Date($("input[name=banrSdt]").val());
			    var banrEdt = new Date($("input[name=banrEdt]").val());
			    
				if(banrSdt > banrEdt){
					alert("<spring:message code="BANR.DT.PAST"/>");
					return;
				}
				//
				if(confirm("등록하시겠습니까?")){
					//
					var fileList = setFormData();
		   			$.ajax({
						url:"intrBanrProc1010.do",
						processData : false,
						contentType : false,
						data: fileList,
						type : 'post',
		   				success : function(data){
		   						var json = eval(data);
		   						
		   						if(json[0].res=='YES'){
		   							alert("<spring:message code="PROC.SUCCESS"/>");
			   						location.href = "intrBanrInqy1010.do";
			   						
		   						}else{
		   							alert("<spring:message code="PROC.FAIL"/>");
									return;	   							
		   						}
		   				},
		   				error : function(res, status, error){
		   					alert("<spring:message code="PROC.ERROR"/>");
		   				}
		   			});
				}
				
			} catch (error) {
		        console.error("[Error] 저장 처리 : ", error.message);
			}
		}
		
		// 삭제 처리
		function deleteProc(){
			try {
				// 유효성 검증
				if($("#fileNm").val() == ''){
					alert("<spring:message code="BANR.FILE.NONE"/>");
					return;
				}
				//
				if(confirm("삭제하시겠습니까?")){
					var param = $("#form").serialize();
					//
					$.ajax({
		   				type:	"post" , 
		   				traditional: true,
		   				url:	"intrBanrProc1020.do",
		   				data:	param,
		   				success : function(data){
		   					var json = eval(data);

		   					if(json[0].res=="YES"){
		   						alert("<spring:message code="PROC.SUCCESS"/>");
		   	   					location.href="intrBanrInqy1010.do";
		   	   					
		   					} else {
		   						alert("<spring:message code="PROC.ERROR"/>");
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
		        console.error("[Error] 삭제 처리 : ", error.message);
			}
		}
		
		// 첨부파일 업로드 이벤트
		function fileUpload(f){
			if (f.files && f.files.length > 0) {
				//
				var fileName = f.files[0].name;
				$("#fileNm").val(fileName);
				$("#isUploadImg").val('Y');
				//
				var allowedExt = /\.(jpe?g|png)$/i;
				if (!allowedExt.test(fileName)) {
					alert("<spring:message code="BANR.FILE.EXT"/>");
					$("#fileNm").val('');
					f.value = '';
					return;
				}
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
						<div id="sub_content">					
							<div class="form_area">
								<input type="hidden" id="sequenceId" name="sequenceId" value="${defaultInfo.banrCd}">
								<input type="hidden" id="banrIdx" name="banrIdx" value="${empVO.empIdx}">
								<input type="hidden" id="filetypeCd" name="filetypeCd" value="BANR">
								<input type="hidden" id="fileId" name="fileId" value="${defaultInfo.fileId}">
								
								<div class="post_wrap">
		                            <h2>배너 관리</h2>
									<div class="post_view">
										<dl>
											<dt>&#10003; 첨부 파일</dt>
											<dd>
												<div class="file_box">
													<input type="text" id="fileNm" class="width87" title="첨부 파일" placeholder="이미지 파일은 jpg, jpeg, png 확장자만 지원됩니다." readonly="readonly" value="${defaultInfo.fileNm}">
													<label for="fileUpd" class="mb5">업로드</label>
													<input type="file" id="fileUpd" name="fileUpd" title="첨부파일" accept=".jpg,.jpeg,.png" onchange="fileUpload(this);">
													<input type="hidden" id="isUploadImg" name="isUploadImg" value="">
												</div>
											</dd>
											<dt>등록자</dt>
											<dd></dd>
										</dl>
										<dl class="post_info">
											<dt>&#10003; 게시일자</dt>
											<dd>
												<fmt:parseDate value="${defaultInfo.banrSdt}" var="parseSdt" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${parseSdt}" var="fomatSdt" pattern="yyyy-MM-dd"/>
												<input type="text" class="srch_cdt_date srchSdt" id="banrSdt" name="banrSdt" value="${fomatSdt}" title="게시일자 (시작)" readonly="readonly" isRequired="Y" />
													~
												<fmt:parseDate value="${defaultInfo.banrEdt}" var="parseEdt" pattern="yyyyMMdd"/>
												<fmt:formatDate value="${parseEdt}" var="fomatEdt" pattern="yyyy-MM-dd"/>
												<input type="text" class="srch_cdt_date srchEdt" id="srchEdt" name="banrEdt" value="${fomatEdt}" title="게시일자 (종료)" readonly="readonly" isRequired="Y" />
											</dd>
											<dt>&#10003; 사이즈</dt>
											<dd>
												<input type="text" id="width" name="width" class="width10" title="가로" value="${defaultInfo.width}" isRequired="Y">
												x
												<input type="text" id="height" name="height" class="width10" title="세로" value="${defaultInfo.width}" isRequired="Y">
											</dd>
										</dl>
										
										<dl class="post_info">
											<dt>링크 URL</dt>
											<dd>
												<input type="text" id="banrUrl" name="banrUrl" class="width100" value="${defaultInfo.banrUrl}" placeholder="예시, https://www.example.com">
											</dd>
											<dt>사용여부</dt>
	                                        <dd class="sel_2part">
	                                        	<div class="radio_box enter-check_box">
	                                            	<span class="radio-area">
	                                                	<input type="radio" id="chk-yes" name="useYn" value="Y" <c:if test="${defaultInfo.useYn eq 'Y' or empty defaultInfo}">checked="checked"</c:if>>
	                                                	<label for="chk-yes">Y<span></span></label>
	                                            	</span>
	                                            	<span class="radio-area">
	                                                	<input type="radio" id="chk-no" name="useYn" value="N" <c:if test="${defaultInfo.useYn eq 'N'}">checked="checked"</c:if>>
	                                                	<label for="chk-no">N<span></span></label>
	                                            	</span>
	                                            </div>
	                                        </dd>
										</dl>
			
										<dl>
											<dt>미리보기</dt>
											<dd class="post_text">
												<c:choose>
													<c:when test="${not empty defaultInfo}">
														<img id="banrImg" class="banr_img" width="480" height="380" src="intrBanrInqy1099.do?fileNm=${defaultInfo.saveFileNm}&sequenceId=${defaultInfo.banrCd}">
													</c:when>
													<c:otherwise>
														등록된 배너가 없습니다.													
													</c:otherwise>
												</c:choose>
												
											</dd>
										</dl>
									</div><!-- End post_view -->
		
									<div class="btn_wrap align_right">
										<div class="float_right">
											<button type="button" class="btn_blue_thin" onclick="saveProc();">저장</button>
											<button type="button" class="btn_gray_thin" onclick="deleteProc();">삭제</button>
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
