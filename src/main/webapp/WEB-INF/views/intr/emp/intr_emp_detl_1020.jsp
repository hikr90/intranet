<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	// 아이디 중복 여부
	var chqEmpYn = "N";
	//
	$(document).ready(function(){
		// 그룹코드 변경 감지
		$(document).on('change','#empId',function() {
			chqEmpYn = "N";
		});
		
		// 주소 입력란 클릭 시, 주소 검색 동작
		$("#addr").on('click',function(){
			addrProc();
		});
	});
	
	// 아이디 중복 조회
	function chqEmpId(f) {
		try {
			// 유효성 검증
			if($("#empId").val()==""){
				alert("아이디를 입력해주세요.");
				return;			
			}
			
			// 변수 저장
			var param = $("#form").serialize();
			
			$.ajax({
	    		type : 'post',
	        	url : 'intrEmpInqy2020.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	     				//
	     				var json = eval(data);
	   					if(json[0].res=="NO"){
	   	     				chqEmpYn = "Y";
	   						alert("<spring:message code="EMP.ID.SUCCESS"/>"); // ALERT
	   						
	   					} else {
	   	     				chqEmpYn = "N";
							alert("<spring:message code="EMP.ID.FAIL"/>"); // ALERT
	   					}
	            },
	            error : function(data){
	            	//
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 아이디 중복 조회 : ", error.message);
		}
	}

	// 사원 등록 처리
	function regProc(f){
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
			if(confirm("등록하시겠습니까?")){
				var fileList = setFormData();
				//
				$.ajax({
					url:"intrEmpProc1010.do",
					processData : false,
					contentType : false,
					data: fileList,
					type : 'post',
		            success : function(data){
		     				var json = eval(data);
		     				
		     				if(json[0].res=='YES'){
	   							alert("<spring:message code="PROC.SUCCESS"/>");
		   						location.href = "intrEmpInqy1010.do?pageUrl=Emp";
		   						
		     				} else {
		     					alert("<spring:message code="PROC.FAIL"/>");
								return;	
		     				}
		            },
		            error : function(data){
		            	//
						alert("<spring:message code="PROC.ERROR"/>");
		            }
		      	});
			}
			
		} catch (error) {
	        console.error("[Error] 사원 등록 처리 : ", error.message);
		}
	}
	
	// 목록으로
	function listCall() {
		formSubmit('intrEmpInqy1010.do');
	}
</script>
</head>
<body id="main">
<form id="form" method="POST" enctype="multipart/form-data">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>

	<div class="main_wrap">
		<!-- 좌측 메뉴 -->
		<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1031.jsp" %>
		
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
		
                                    <h2 class="content_heading">사원 등록</h2>
                                    <div class="form_panel">
                                        <dl class="form_row">
                                            <dt class="form_label">
	                                        	<label>사진 등록</label>
	                                        </dt>
                                            <dd class="form_value">
	                                        	<div class="profile_wrap inline_flex">

		                                        		<img class="emp_img" id="empImg" width="200" height="200" src="resources/images/icon/icon_profile.png">

	    
                                                    <div class="profile_box ml20 form_profile">
		                                        		<br><span id="profText">사진을 등록해주세요.</span>
			                                        	<div class="mt5">
                                                            <label for="profBtn" class="btn_blue btn_action upload_label">등록</label>
                                                            <input class="upload_input" type="file" id="profBtn">
															<input type="hidden" id="isUploadImg" name="isUploadImg" value="N">
                                                            <input type="button" class="btn_gray btn_action" id="profDel" value="삭제">
		                                        		</div>
		                                        	</div>
	                                        	</div>
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>&#10003; 사원명</label></dt>
                                            <dd class="form_value form_pair">
                                                <input class="form_input" type="text" title="사원명" id="empNm" name="empNm" isRequired="Y">
	                                        </dd>
	                                        
                                            <dt class="form_label"><label>성별</label></dt>
                                            <dd class="form_value form_pair">
	                                        	<div class="radio_box enter-check_box">
	                                            	<span class="radio-area">
                                                        <input class="radio_input" type="radio" id="chk-yes" name="isMale" value="Y" checked="checked">
                                                        <label class="radio_label_lead radio_label" for="chk-yes">남자<span class="radio_mark"></span></label>
	                                            	</span>
	                                            	<span class="radio-area">
                                                        <input class="radio_input" type="radio" id="chk-no" name="isMale" value="N" >
                                                        <label class="radio_label" for="chk-no">여자<span class="radio_mark"></span></label>
	                                            	</span>
	                                            </div>
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>&#10003; 부서</label></dt>
                                            <dd class="form_value form_pair">
												<div class="select_wrap">
													<div id="orgList" class="sList select_box choice_value">부서를 선택해주세요.</div>
													<input type="hidden" id="setOrgCd" name="setOrgCd" value="">
													<input type="hidden" id="setOrgNm" name="setOrgNm" value="">
												
													<ul class="sUl select_ul scroll_wrap choice_options">
														<c:forEach var="list" items="${orgList}">
															<c:if test="${not empty list.orgCd}"><li class="choice_item" setNm="${list.orgNm}" setCd="${list.orgCd}">${list.orgNm}</li></c:if>
														</c:forEach>
													</ul>
												</div>
	                                        </dd>
	                                        
                                            <dt class="form_label"><label>&#10003; 직급</label></dt>
                                            <dd class="form_value form_pair">
	                                        	<div class="select_wrap">
													<div id="rankList" class="sList select_box choice_value">직급을 선택해주세요.</div>
													<input type="hidden" id="setRankCd" name="setRankCd" value="">
													<input type="hidden" id="setRankNm" name="setRankNm" value="">
												
													<ul class="sUl select_ul scroll_wrap choice_options">
														<c:forEach var="list" items="${rankList}">
															<c:if test="${not empty list.rankCd}"><li class="choice_item" setNm="${list.rankNm}" setCd="${list.rankCd}">${list.rankNm}</li></c:if>
														</c:forEach>
													</ul>
												</div>
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>&#10003; 연락처</label></dt>
                                            <dd class="form_value form_pair">
                                                <input class="form_input" type="text" title="연락처" id="mobNo" name="mobNo" maxlength="13" onkeydown="mobProc(this);" isRequired="Y" >
	                                        </dd>
											
                                            <dt class="form_label"></dt>
                                            <dd class="form_value"></dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>&#10003; 주소</label></dt>
                                            <dd class="form_value form_pair">
                                                <input class="form_input" type="text" title="주소" readonly="readonly" id="addr" name="addr" isRequired="Y">
                                                <input type="button" class="btn_blue vertical_top btn_action" value="주소 검색" onclick="addrProc();">
	                                        </dd>
	                                        
                                            <dt class="form_label"><label>&#10003; 상세 주소</label></dt>
                                            <dd class="form_value form_pair">
                                                <input class="form_input" type="text" title="상세주소" id="addrInfo" name="addrInfo" isRequired="Y">
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>&#10003; 아이디</label></dt>
                                            <dd class="form_value form_pair">
                                                <input class="form_input" type="text" title="아이디" name="empId" id="empId" oninput="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'')" isRequired="Y">
                                                <input type="button" class="btn_blue vertical_top btn_action" value="중복 확인" onclick="chqEmpId(this.form)">
	                                        </dd>
	                                        
                                            <dt class="form_label"><label>&#10003; 메일 주소</label></dt>
                                            <dd class="form_value form_pair">
                                                <input class="form_input" type="text" title="메일 주소" id="email" name="email" isRequired="Y">
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>&#10003; 비밀번호</label></dt>
                                            <dd class="form_value form_pair">
	                                            <input type="password" title="비밀번호" id="empPwd" name="empPwd" isRequired="Y">
	                                        </dd>
                                            <dt class="form_label"><label>&#10003; 비밀번호 확인</label></dt>
                                            <dd class="form_value form_pair">
	                                        	<input type="password" title="비밀번호 (확인)" id="chqPwd" name="chqPwd" isRequired="Y">
	                                       	</dd>
	                                    </dl>
									</div><!-- End post_write -->
										
                                    <div class="btn_right btn_wrap">
                                        <button type="button" class="btn_navy_thin btn_action action_compact" onclick="regProc(this.form);">등록</button>
                                        <button type="button" class="btn_gray_thin btn_action action_compact" onclick="listCall();">취소</button>
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