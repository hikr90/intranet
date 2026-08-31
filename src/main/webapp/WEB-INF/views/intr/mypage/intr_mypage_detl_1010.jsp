<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		$('.left_area').html('');
	});

	// 수정 처리
	function updProc(f){
		try {
			// 유효성 검증
			if($("#addr").val() == ''){
				alert("<spring:message code="MYPAGE.ADDR.NONE"/>");
				return;
			}
			if($("#addrInfo").val() == ''){
				alert("<spring:message code="MYPAGE.ADDR.INFO.NONE"/>");
				return;
			}
			if($("#email").val() == ''){
				alert("<spring:message code="MYPAGE.EMAIL.NONE"/>");
				return;
			}
			
			// 연락처
			var regex = /^010-\d{4}-\d{4}$/;
			
			if(!regex.test($("#mobNo").val())){
				alert("<spring:message code="EMP.MOB.FAIL"/>");
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
		   						$("#cancel").trigger('click');
		   						
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
	
	// 비밀번호 변경 팝업
	function popCall(){
		try {
   			// 비밀번호 변경 팝업
   			var obj = new Object();
   			//
   			obj["mappingId"] = "intrPopupInqy2011.do";
   			obj["areaType"] = "pwd";
   			obj["width"] = "650"
   			obj["height"] = "365";
   			//		
   			ajaxPopup(obj);
			
		} catch (error) {
	        console.error("[Error] 비밀번호 변경 팝업 : ", error.message);
		}
	}
	
	// 비밀번호 변경 검증
	function checkPwd(newPwdConfElement){
		try {
			//
			var newPwd = $("#newPwd").val();	// 변경 비밀번호
			var newPwdConf = newPwdConfElement.value;	// 변경 비밀번호 확인
			//
			if (newPwd == newPwdConf) {
		        $("#checkPwd").text("");
		    } else if(newPwd != newPwdConf) {
		        $("#checkPwd").text("비밀번호가 불일치합니다.");
		    }
			
		} catch (error) {
	        console.error("[Error] 비밀번호 변경 검증 : ", error.message);
		}
	}
</script>
<body id="main">
<!-- 비밀번호 변경 -->
<div id="pwdArea" class="hidden">
	<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_2010.jsp"></c:import>	
</div>

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
		                            <h2>My Page
		                            	<span class="float_right">
											<input type="button" class="btn_blue_thin" value="비밀번호 변경" onclick="popCall();">
										</span>
		                            </h2>
		                            <input type="hidden" name="empIdx" value="${defaultInfo.empIdx}">
		                            <input type="hidden" name="empId" value="${defaultInfo.empId}">
		                            <input type="hidden" name="setOrgCd" value="${defaultInfo.orgCd}">
		                            <input type="hidden" name="setRankCd" value="${defaultInfo.rankCd}">
		                            <input type="hidden" name="isMale" value="${defaultInfo.isMale}">
		                            
		                            <div class="post_write">
		                            	<dl>
			                           		<dt>
			                           			<label>프로필</label>
			                           		</dt>
			                                <dd>
			                                	<div>
			                                    	<div class="emp_profile">
			                                        	<c:choose>
															<c:when test="${defaultInfo.profileYn eq 'Y'}">
                                 								<img id="empImg" class="emp_img" width="200" height="200" src="intrEmpInqy1099.do?sequenceId=${empVO.empIdx}">
			                                        		</c:when>
			                                        		<c:otherwise>
					                                        	<img id="empImg" class="emp_img" width="200" height="200" src="resources/images/icon/icon_profile.png">
			                                        		</c:otherwise>
			                                        	</c:choose>
			                                        </div>
			                                        
			                                        <div class="profile_box"></div>
			                               		</div>
			                               </dd>
		                               </dl>
		                               <dl>
		                               		<dt><label>사원명</label></dt>
		                               		<dd class="sel_2part">
			                           			${defaultInfo.empNm}
		                               		</dd>
		                               		<dt>
		                               			<label>성별</label>
		                               		</dt>
		                               		<dd class="sel_2part">
		                               			<c:if test="${defaultInfo.isMale eq 'Y'}">남자</c:if> 
		                               			<c:if test="${defaultInfo.isMale ne 'Y'}">여자</c:if> 
		                                    </dd>
		                              	</dl>
		                              	<dl>
		                              		<dt><label>부서</label></dt>
		                                    <dd class="sel_2part">
		                                    	${defaultInfo.orgNm}
		                                    </dd>
		                                    <dt><label>직급</label></dt>
		                                    <dd class="sel_2part">
			                                	${defaultInfo.rankNm}
		                                    </dd>
		                              	</dl>
		                              	<dl>
		                              		<dt><label>연락처</label></dt>
		                                    <dd class="sel_2part">
		                                    	<input type="text" title="연락처" id="mobNo" name="mobNo" maxlength="13" value="${defaultInfo.mobNo}" onkeyup="mobProc(this);">
		                                    </dd>
		                                        
		                                    <dt><label>메일 주소</label></dt>
		                                    <dd class="sel_2part">
		                                    	<input type="text" title="메일 주소" id="email" name="email" value="${defaultInfo.email}">
		                                    </dd>
		                             	</dl>
		                             	<dl>
		                             		<dt><label>주소</label></dt>
		                                    <dd class="sel_2part">
		                                    	<input type="text" title="주소" id="addr" readonly="readonly" id="addr" name="addr" value="${defaultInfo.addr}">
		                                        <input type="button" class="btn_blue align_top" value="주소 검색" onclick="addrProc();">
		                                    </dd>
		                                    <dt><label>상세 주소</label></dt>
		                                    <dd class="sel_2part">
		                                    	<input type="text" title="상세주소" id="addrInfo" name="addrInfo" value="${defaultInfo.addrInfo}">
		                                    </dd>
		                             	</dl>
		                             	<dl>
		                             		<dt><label>아이디</label></dt>
		                                    <dd class="sel_2part">
		                                    	${defaultInfo.empId}
		                                        <input type="hidden" title="아이디" name="empId" value="${defaultInfo.empId}">
		                                    </dd>
		                                    <dt><label>관리자 여부</label></dt>
		                                    <dd class="sel_2part">${empVO.roleYn}</dd>
		                             	</dl>
									</div><!-- End post_write -->
		                              
		                            <div class="btn_wrap align_right">
		                            	<button type="button" class="btn_navy_thin" onclick="updProc(this.form);">수정완료</button>
		                                <button type="button" id="cancel" class="btn_gray_thin" onclick="location.href='${menuType eq '0' ? 'intrMainInqy1020.do' : 'intrMainInqy1030.do'}'">취소</button>
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
