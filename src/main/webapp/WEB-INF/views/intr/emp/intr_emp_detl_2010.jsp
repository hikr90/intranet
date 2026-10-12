<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	// 목록으로
	function listCall() {
		try {
			//
			formSubmit('intrEmpInqy1010.do');
			
		} catch (error) {
	        console.error("[Error] 목록으로 : ", error.message);
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
		<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1031.jsp" %>

		<div class="content_wrap">
			<div class="content_area">
				<article class="sub_article">
					<div class="content">
						<div id="sub_content">					
							<div class="form_area">
								<div class="post_wrap">
									<input type="hidden" id="page" name="page" value="${param.page}">
									<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
									<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
									<input type="hidden" id="srchSdt" name="srchSdt" value="${param.srchSdt}">
									<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
									<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
									<input type="hidden" id="srchEdt" name="srchEdt" value="${param.srchEdt}">
									<input type="hidden" id="empIdx" name="empIdx" value="${param.empIdx}">
									<input type="hidden" id="sequenceId" name="sequenceId" value="${param.empIdx}">
		
                                    <h2 class="content_heading">사원 상세</h2>
                                    <div class="form_panel">
                                        <dl class="form_row">
                                            <dt class="form_label"><label>프로필</label></dt>
                                            <dd class="form_value">
	                                        	<div>
	                                        	<div class="emp_profile">
	                                        		<c:choose>
														<c:when test="${defaultInfo.profileYn eq 'Y'}">
                                 							<img id="empImg" class="emp_img" width="200" height="200" src="intrEmpInqy1099.do?sequenceId=${defaultInfo.empIdx}">
	                                        			</c:when>
	                                        			<c:otherwise>
			                                        		<img class="emp_img" id="empImg" width="200" height="200" src="resources/images/icon/icon_profile.png">
	                                        			</c:otherwise>
	                                        		</c:choose>
	                                        	</div>
	                                        	</div>
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>z사원명</label></dt>
                                            <dd class="form_value form_pair">
	                                            ${defaultInfo.empNm}
	                                        </dd>
	                                        
                                            <dt class="form_label"><label>성별</label></dt>
                                            <dd class="form_value form_pair">
	                                        	<c:choose>
	                                        		<c:when test="${defaultInfo.isMale eq 'Y'}">남자</c:when>
	                                        		<c:otherwise>여자</c:otherwise>
	                                        	</c:choose>
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>부서</label></dt>
                                            <dd class="form_value form_pair">
												${defaultInfo.orgNm}
	                                        </dd>
	                                        
                                            <dt class="form_label"><label>직급</label></dt>
                                            <dd class="form_value form_pair">
												${defaultInfo.rankNm}
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>연락처</label></dt>
                                            <dd class="form_value form_pair">
												${defaultInfo.mobNo}
	                                        </dd>
	                                    
                                            <dt class="form_label"><label>재직 여부</label></dt>
                                            <dd class="form_value">${defaultInfo.leavYn}</dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>주소</label></dt>
                                            <dd class="form_value form_pair">
	                                        	${defaultInfo.addr}
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>메일 주소</label></dt>
                                            <dd class="form_value form_pair">
	                                        	${defaultInfo.email}
	                                        </dd>
	                                    </dl>
                                        <dl class="form_row">
                                            <dt class="form_label"><label>아이디</label></dt>
                                            <dd class="form_value form_pair">
	                                        	${defaultInfo.empId}
	                                        </dd>
	                                	</dl>    
									</div>
		                                
	                                <div class="float_right">
                                        <button type="button" class="btn_blue_thin btn_action action_compact" onclick="listCall();">목록으로</button>
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