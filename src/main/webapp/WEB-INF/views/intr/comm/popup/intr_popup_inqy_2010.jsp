<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 비밀번호 변경 관리 (마이페이지) -->
<script type="text/javascript">
	// 비밀번호 변경
	function popUpdate(){
		try {
			// 유효성 검증
			var newPwd = $("#newPwd").val();
			var newPwdConf = $("#newPwdConf").val();
			//		
			if(newPwd == ''){
				alert("<spring:message code="NEW.PWD.NONE"/>");
				return;
			}
			if(newPwdConf == ''){
				alert("<spring:message code="NEW.PWD.CONF.NONE"/>");
				return;
			}
			if(newPwd != newPwdConf){
				alert("<spring:message code="PWD.NOT.SAME"/>");
				return;
			}
			//
			if(confirm("비밀번호를 변경하시겠습니까?")){
				// 전송 파라미터
				$("#chngPwdId").val($("[name=empId]").val());
				var param = $("#popForm").serialize();
				
				$.ajax({
			    	type : 'post',
			    	url : "intrEmpProc1050.do",
					data : param,
					dataType : 'text',
					success : function(data){
						//
						var json = eval(data);
						if(json[0].res=='YES'){
							alert("<spring:message code="PROC.SUCCESS"/>");
							popClose('pwd');
	  						
						}else{
							alert("<spring:message code="PROC.FAIL"/>");
							return;	   							
						}
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");
				    }
				});
			}
			
		} catch (error) {
	        console.error("[Error] 비밀번호 변경 : ", error.message);
		}
	}
	
	// 비밀번호 체크
	function checkPwd(newPwdConfElement){
		try {
			//
			var newPwd = $("#newPwd").val();	// 신규 비밀번호
			var newPwdConf = newPwdConfElement.value;	// 확인 비밀번호
			//
			if (newPwd == newPwdConf) {
		        $("#checkPwd").text("");
		    } else if(newPwd != newPwdConf) {
		        $("#checkPwd").text("비밀번호가 불일치합니다.");
		    }
			
		} catch (error) {
	        console.error("[Error] 비밀번호 체크 : ", error.message);
		}
	}
</script>

<form id="popForm">
<div class="pop_area">
	<article class="sub_article">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
                       <div class="pop_wrap find_info_wrap">
                           <div class="srch_wrap">
								<div class="srch_area">
									<div class="right_srch_area">
										<label class="srch_label">비밀번호 변경</label>
									</div>
								</div>
							</div>
                           <input type="hidden" id="chngPwdId" name="chngPwdId" value="">

							<!-- 패스워드 변경 -->                           
                           	<div id="pwdCon" class="post_con"></div>
                               
                            <div class="btn_center">
                            	<input type="button" id="updateBtn" class="btn_blue_thin" value="변경" onclick="popUpdate();">
                                <input type="button" class="btn_gray_thin" value="닫기" onclick="popClose('pwd');">
                            </div>
                         </div> 
				</div><!-- End content_area form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>
</form>