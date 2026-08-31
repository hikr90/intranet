<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<head>
	<script type="text/javascript">
		// 첨부파일 수
		var fileCnt = "${defaultList.size()}" != null && "${defaultList.size()}" != "" ? "${defaultList.size()}" : 0;
	
		// 담당자 선택
		function popCall(){
			try {
				//
				var obj = new Object();
				
				obj["mappingId"] = "intrPopupInqy1011.do";
	   			obj["areaType"] = "emp";
	   			obj["width"] = "550"
	   			obj["height"] = "420";
	   			//		
	   			ajaxPopup(obj);
	   			
			} catch (error) {
		        console.error("[Error] 담당자 선택 : ", error.message);
			}
		}
		
		// 취소
		function detCall() {
			try {
				//
				formSubmit('intrProjInqy1030.do');
				
			} catch (error) {
		        console.error("[Error] 취소 : ", error.message);
			}
		}
		
		// 수정 처리
		function modProc(f){
			try {
				// 유효성 검증
				if(!requiredProc()){return;};
				//
				var projSdt = $("input[name=projSdt]").val().replaceAll("-","")
				var projEdt = $("input[name=projEdt]").val().replaceAll("-","");
				var status = $("#statList").text();
				
				// 계약기간
				if(projSdt == ''){
					alert("<spring:message code="PROJ.SDT.NONE"/>");
					$("#projSdt").focus();
					return;
				}
				if(projEdt == ''){
					alert("<spring:message code="PROJ.EDT.NONE"/>");
					$("#projEdt").focus();
					return;
				}
				if(projSdt > projEdt){
					alert("<spring:message code="PROJ.DT.PAST"/>");
					$("#projSdt").focus();
					return;
				}
				// 진행상태
				if(status == ''){
					alert("<spring:message code="PROJ.STAT.NONE"/>");
					return;
				}
				//
				var fileList = setFormData();
				//
				if(confirm("수정하시겠습니까?")){
					// 
		   			$.ajax({
						url:"intrProjProc1030.do",
						processData : false,
						contentType : false,
						data: fileList,
						type : 'POST',
		   				success : function(data){
		   						var json = eval(data);
		   						
		   						if(json[0].res=='YES'){
		   							alert("<spring:message code="PROC.SUCCESS"/>");
			   						location.href = "intrProjInqy1010.do?pageUrl=Proj";
			   						
		   						}else if(json[0].res=='NO'){
		   							alert("<spring:message code="PROC.FAIL"/>");
									return;
									
		   						}else{
		   							alert("<spring:message code="PROC.EXISTS"/>");
									return;	   							
		   						}
		   				},
		   				error : function(res, status, error){
		   					alert("<spring:message code="PROC.ERROR"/>");
		   				}
		   			});
				}
				
			} catch (error) {
		        console.error("[Error] 수정 처리 : ", error.message);
			}
		}	
	</script>
</head>

<body id="main">
<form id="form" method="POST" enctype="multipart/form-data">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>
	
	<!-- 담당자 팝업 -->
 	<div id="empArea" class="popupArea hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1010.jsp"></c:import>	
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
					<div class="sub_content">					
						<div class=" form_area">
							<input type="hidden" id="empIdx" name="empIdx"  value="${empVO.empIdx}">
							<input type="hidden" id="sequenceId" name="sequenceId" value="${defaultInfo.projCd}">
							<input type="hidden" id="page" name="page" value="${param.page}">
							<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
							<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
							<input type="hidden" id="srchSdt" name="srchSdt" value="${param.srchSdt}">
							<input type="hidden" id="srchEdt" name="srchEdt" value="${param.srchEdt}">
							<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
							<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
							<input type="hidden" id="srchStatNm" name="srchStatNm" value="${param.srchStatNm}">
							<input type="hidden" id="srchStatCd" name="srchStatCd" value="${param.srchStatCd}">					
							<input type="hidden" id="srchIdx" name="srchIdx" value="${param.srchIdx}">
							<input type="hidden" id="empPcd" name="empPcd" value="${defaultInfo.owner}">
							<input type="hidden" id="filetypeCd" name="filetypeCd" value="PROJ">
								
							<div class="post_wrap">
								<h2>프로젝트 수정</h2>
								<div class="post_view">
									<dl>
										<dt>
											<label for="post-title">&#10003; 프로젝트명</label>
										</dt>
										<dd>
											<input type="text" id="projTitle" title="프로젝트명" name="projTitle" value="${defaultInfo.projTitle}" isRequired="Y">
										</dd>
										<dt>&#10003; 담당자</dt>
										<dd>
											<input type="button" class="btn_blue align_top" value="선택" onclick="popCall();">
											<input type="text" id="empPnm" class="w150p" title="담당자" value="${defaultInfo.ownerNm}" disabled="disabled" isRequired="Y">
										</dd>
									</dl>
									<dl>
										<dt>&#10003; 계약기간</dt>
										<dd>
											<input type="text" class="srch_cdt_date srchSdt" id="projSdt" name="projSdt" title="계약기간 (시작)" value="${defaultInfo.projSdt}" readonly="readonly" isRequired="Y" />
												~
											<input type="text" class="srch_cdt_date srchEdt" id="projEdt" name="projEdt" title="계약기간 (종료)" value="${defaultInfo.projEdt}" readonly="readonly" isRequired="Y" />
										</dd>
										<dt>&#10003; 진행상태</dt>
                                        <dd class="sel_2part">
                                        	<div class="select_wrap">
												<div id="statList" class="sList select_box">${empty defaultInfo.statusNm ? '' : defaultInfo.statusNm}</div>
												<input type="hidden" id="status" name="status" value="${defaultInfo.status}">
												<input type="hidden" id="statusNm" name="statusNm" value="${defaultInfo.statusNm}">
											
												<ul class="sUl select_ul scroll_wrap">
													<c:forEach var="list" items="${statList}">
														<c:if test="${list.commcodeCd != null and  list.commcodeCd != ''}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
                                        </dd>
									</dl>
									<dl>
										<dt>&#10003; 계약금</dt>
										<dd>
											<input type="text" id="deposit" class="width50" name="deposit" title="계약금" placeholder="₩0" oninput="amtProc(this);" value="${defaultInfo.deposit}" isRequired="Y">
											&nbsp; <span id="amtNm">${defaultInfo.depositNm}</span>
										</dd>
										<dt>태그</dt>
										<dd>
											<input type="text" id="tag" title="태그" name="tag" placeholder="#SI, #SM, #운영 등.." value="${defaultInfo.tag}">
										</dd>
									</dl>
									<dl>
										<dt><label for="post_text">&#10003; 개요/설명</label></dt>
										<dd class="post_text h310p">
											<textarea id="projCont" title="개요/설명" name="projCont" isRequired="Y">${defaultInfo.projCont}</textarea>
										</dd>
									</dl>
									<dl class="post_info">
										<dt>계약문서</dt>
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
									<button type="button" class="btn_navy_thin" onclick="modProc(this.form);">수정완료</button>
									<button type="button" class="btn_gray_thin" onclick="detCall();">취소</button>
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