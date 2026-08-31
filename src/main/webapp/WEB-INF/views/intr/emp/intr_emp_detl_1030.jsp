<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	// 취소
	function detCall() {
		//
		formSubmit('intrEmpInqy1030.do');
	}

	// 수정 처리
	function modProc(f){
		try {
			// 유효성 검증
			if(!requiredProc()){return;};
			
			// 부서
			if($("#setOrgCd").val()==""){
				alert("<spring:message code="EMP.ORG.NONE"/>");
				return;
			}
			// 직급
			if($("#setRankCd").val()==""){
				alert("<spring:message code="EMP.RANK.NONE"/>");
				return;
			}
			// 연락처
			var regex = /^010-\d{4}-\d{4}$/;
			
			if(!regex.test($("#mobNo").val())){
				alert("<spring:message code="EMP.MOB.FAIL"/>");
				return;
			}
			// 계정
			if($("#empPwd").val()!=$("#chqPwd").val()){
				alert("<spring:message code="EMP.PWD.DIFF"/>");
				return;
			}
			//
			if(confirm("수정하시겠습니까?")){
				var fileList = setFormData();
				//
	   			$.ajax({
					url:"intrEmpProc1020.do",
					processData : false,
					contentType : false,
					data: fileList,
					type : 'POST',
	   				success : function(data){
	   						var json = eval(data);
	   						
	   						if(json[0].res=='YES'){
	   							alert("<spring:message code="PROC.SUCCESS"/>");
		   						location.href = "intrEmpInqy1010.do?pageUrl=Emp";
		   						
	   						}else{
	   							alert("<spring:message code="PROC.FAIL"/>");
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
	        console.error("[Error] 수정 처리 : ", error.message);
		}
	}	
</script>
</head>
<body id="main">
<form id="form" name="form" method="POST">
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
									<input type="hidden" id="empIdx" name="empIdx" value="${param.empIdx}">
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
									<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
									<input type="hidden" id="sequenceId" name="sequenceId" value="${param.empIdx}">
									<input type="hidden" id="hireCd" name="hireCd" value="${param.hireCd}">
									<input type="hidden" id="hireNm" name="hireNm" value="${param.hireNm}">
									<input type="hidden" id="filetypeCd" name="filetypeCd" value="EMP">
								
		                            <h2>사원 상세</h2>
	                                <div class="post_write">
	                                    <dl>
	                                        <dt><label>프로필</label></dt>
	                                        <dd>
	                                        	<div class="profile_wrap inline_flex">
		                                        	<div class="profile_area">
		                                        		<c:choose>
															<c:when test="${defaultInfo.profileYn eq 'Y'}">
                                 								<img id="empImg" class="emp_img" width="200" height="200" src="intrEmpInqy1099.do?sequenceId=${empVO.empIdx}">
		                                        			</c:when>
		                                        			<c:otherwise>
				                                        		<img class="emp_img" id="empImg" width="200" height="200" src="resources/images/icon/icon_profile.png">
		                                        			</c:otherwise>
		                                        		</c:choose>
		                                        	</div>
	                                        	
		                                        	<div class="profile_box ml20">
		                                        		<br>
		                                        		<c:choose>
		                                        			<c:when test="${empty fileList}">
		                                        				<span id="profText">사진을 등록해주세요.</span>
		                                        			</c:when>
		                                        			<c:otherwise>
		                                        				<span id="profText">${fileList[0].fileNm}</span>
		                                        			</c:otherwise>
		                                        		</c:choose>
			                                        	<div class="mt5">
			                                        		<label for="profBtn" class="btn_blue">등록</label> 
															<input type="file" id="profBtn">
															<input type="hidden" id="isUploadImg" name="isUploadImg" value="">
		                                        			<input type="button" class="btn_gray" id="profDel" value="삭제"> 
		                                        		</div>
		                                        	</div>
	                                        	</div>
	                                        </dd>
	                                    </dl>
	                                    <dl>
	                                        <dt><label>&#10003; 사원명</label></dt>
	                                        <dd class="sel_2part">
	                                            <input type="text" title="사원명" id="empNm" name="empNm" value="${defaultInfo.empNm}" isRequired="Y">
	                                        </dd>
	                                        
	                                        <dt></dt>
	                                        <dd></dd>
	                                    </dl>
	                                    <dl>
	                                    	<dt><label>&#10003; 부서</label></dt>
	                                        <dd class="sel_2part">
												<div class="select_wrap">
													<div id="orgList" class="sList select_box">${defaultInfo.orgNm}</div>
													<input type="hidden" name="setOrgCd" value="${defaultInfo.orgCd}">
													<input type="hidden" name="setOrgNm" value="${defaultInfo.orgNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${orgList}">
															<c:if test="${not empty list.orgCd}"><li setNm="${list.orgNm}" setCd="${list.orgCd}">${list.orgNm}</li></c:if>
														</c:forEach>
													</ul>
												</div>
	                                        </dd>
	                                        
	                                        <dt><label>&#10003; 직급</label></dt>
	                                        <dd class="sel_2part">
												<div class="select_wrap">
													<div id="rankList" class="sList select_box">${defaultInfo.rankNm}</div>
													<input type="hidden" name="setRankCd" value="${defaultInfo.rankCd}">
													<input type="hidden" name="setRankNm" value="${defaultInfo.rankNm}">
												
													<ul class="sUl select_ul scroll_wrap">
														<c:forEach var="list" items="${rankList}">
															<c:if test="${not empty list.rankCd}"><li setNm="${list.rankNm}" setCd="${list.rankCd}">${list.rankNm}</li></c:if>
														</c:forEach>
													</ul>
												</div>
	                                        </dd>
	                                    </dl>
	                                    <dl>
	                                        <dt><label>&#10003; 연락처</label></dt>
	                                        <dd class="sel_2part">
	                                            <input type="text" title="연락처" id="mobNo" name="mobNo" maxlength="13" value="${defaultInfo.mobNo}" onkeyup="mobProc(this);" isRequired="Y">
	                                        </dd>
	
	                                        <dt><label>성별</label></dt>
	                                        <dd class="sel_2part">
	                                        	<div class="radio_box enter-check_box">
	                                            	<span class="radio-area">
	                                                	<input type="radio" id="chk-yes" class="isMale" name="isMale" value="Y" <c:if test="${defaultInfo.isMale eq 'Y'}">checked="checked"</c:if>>
	                                                	<label for="chk-yes">남자<span></span></label>
	                                            	</span>
	                                            	<span class="radio-area">
	                                                	<input type="radio" id="chk-no" class="isMale" name="isMale" value="N" <c:if test="${defaultInfo.isMale eq 'N'}">checked="checked"</c:if>>
	                                                	<label for="chk-no">여자<span></span></label>
	                                            	</span>
	                                            </div>
	                                        </dd>
	                                    </dl>
	                                    <dl>
	                                        <dt><label>&#10003; 주소</label></dt>
	                                        <dd class="sel_2part">
	                                            <input type="text" title="주소" readonly="readonly" id="addr" name="addr" value="${defaultInfo.addr}" isRequired="Y">
	                                            <input type="button" class="btn_blue align_top" value="주소 검색" onclick="addrProc();">
	                                        </dd>
	                                        
	                                        <dt><label>&#10003; 상세 주소</label></dt>
	                                        <dd class="sel_2part">
	                                            <input type="text" title="상세주소" id="addrInfo" name="addrInfo" value="${defaultInfo.addrInfo}" isRequired="Y">
	                                        </dd>
	                                    </dl>
	                                    <dl>
											<dt><label>&#10003; 메일 주소</label></dt>
	                                        <dd class="sel_2part">
	                                            <input type="text" title="메일 주소" id="email" name="email" value="${defaultInfo.email}" isRequired="Y">
	                                        </dd>
	                                        
	                                        <dt></dt>
	                                        <dd></dd>
	                                    </dl>
										<dl>
	                                        <dt><label>&#10003; 아이디</label></dt>
	                                        <dd class="sel_2part">
	                                            <input type="text" title="아이디" id="empId" name="empId" value="${defaultInfo.empId}" readonly="readonly" isRequired="Y">
	                                        </dd>
	                                        
	                                        <dt></dt>
	                                        <dd></dd>
										</dl>	                                    
									</div>
		                                
	                                <div class="btn_wrap align_right">
										<div class="float_right">
											<button type="button" class="btn_navy_thin" onclick="modProc('${empInfo.empIdx}')">수정완료</button>
											<button type="button" class="btn_gray_thin" onclick="detCall();">취소</button>
										</div>
									</div>
		                            </div><!-- End post_wrap -->
		                        </div>
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