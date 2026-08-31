<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
   		// 정보 찾기 팝업
   		function popCall(){
   			try {
   	   			// 정보 찾기 팝업
   	   			var obj = new Object();
   	   			//
   	   			obj["mappingId"] = "intrPopupInqy1021.do";
   	   			obj["areaType"] = "find";
   	   			obj["width"] = "650"
   	   			obj["height"] = "365";
   	   			//		
   	   			ajaxPopup(obj);
   				
   			} catch (error) {
   		        console.error("[Error] 정보 찾기 팝업 : ", error.message);
   			}
   		}
   		
   		// 로그인
   		function loginProc(f){
   			try {
   	   			// 유효성 검증
   				if(!requiredProc()){return;};
   				//   			
   				var param = $("#form").serialize();
   				
   	   			$.ajax({
   	   				type:	"post" , 
   	   				url:	"intrMainProc1010.do",
   	   				data:	param,
   	   				dataType:	"text" ,
   	   				success : function(data){
   	   					//
   	   					var json = eval(data);
   	   					if(json[0].res=="NO_ID"){
   	   						alert("<spring:message code="LOGIN.ID.FAIL"/>");
   	   						
   	   					} else if(json[0].res=="NO_PWD") {
   	   						alert("<spring:message code="LOGIN.PWD.FAIL"/>");
   	   						
   	   					} else {
   	   						location.href = "intrMainInqy1020.do";
   	   					}
   	   				},
   	   				error : function(res, status, error){
   	   					alert("<spring:message code="PROC.ERROR"/>");
   	   				}
   	   			});
   	   			
   			} catch (error) {
   		        console.error("[Error] 로그인 : ", error.message);
   			}
   		}
   		
   		// 로그인 정보 입력
   		function setInfo(empId, empPwd){
   			try {
   				//
   	   			$("input[name=empId]").val(empId);
   	   			$("input[name=empPwd]").val(empPwd);
   				
   			} catch (error) {
   		        console.error("[Error] 로그인 정보 입력 : ", error.message);
   			}
   		}
	</script>
</head>
<body id="sub">
	<!-- 정보 찾기 -->
 	<div id="findArea" class="hidden">
		<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1020.jsp"></c:import>	
	</div>

	<!-- 로그인 화면 -->
	<form id="form" method="post">
		<div class="body">
			<div class="login_wrap">
				<div class="login_area">
					<h3>LOGIN</h3>
					<input type="text" placeholder="아이디" title="아이디" id="empId" name="empId" onkeydown="enterLoginCall(this.form);" value="${defaultList[0].empId}">
					<input type="password" id="empPwd" name="empPwd" placeholder="비밀번호" title="비밀번호" onkeydown="enterLoginCall(this.form);" value="${defaultList[0].decpwd}">
					<input type="button" class="login_btn" value="로그인" onclick="loginProc(this.form);">
                    <input type="button" class="btn_find" value="아이디/비밀번호 찾기" onclick="popCall();">
				</div>
					
				<div class="role_area">
					<div class="post_table_wrap scroll_wrap">
						<table class="post_table">
							<caption>로그인 권한 목록 조회</caption>
							<colgroup>
								<col class="auto">
								<col class="w70per">
							</colgroup>
							<thead>
								<tr class="bb_none">
									<th scope="col">권한</th>
									<th scope="col">소유자</th>
								</tr>
							</thead>
							<tbody>
                                <c:if test="${not empty defaultList}">
                                <c:forEach var="list1" items="${defaultList}" varStatus="status1">
									<c:if test="${list1.roleCd ne defaultList[status1.index + 1].roleCd}">
										<tr>
											<td class="align_center">${list1.roleNm}</td>
											<td class="title align_left">
												<c:forEach var="list2" items="${defaultList}" varStatus="status2">
													<c:if test="${list1.roleCd eq list2.roleCd}">
														<a class="c_214b97" href="javascript:setInfo('${list2.empId}','${list2.decpwd}');">${list2.empNm}</a>
														&nbsp;
													</c:if>
												</c:forEach>
											</td>
										</tr>
									</c:if>
                               </c:forEach>
                               </c:if>
                               <c:if test="${empty defaultList}">
									<tr>
										<td class="text_center" colspan="2">권한 소유자가 없습니다.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>

</body>
</html>