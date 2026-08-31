<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 회원정보 찾기 관리 -->
<script type="text/javascript">
	// 아아디, 비밀번호 구분
	function isFindId(){
		try {
			//
			if($("#isFindId").length < 1) {
				return false;
			}
			
		} catch (error) {
	        console.error("[Error] 아이디, 비밀번호 구분 : ", error.message);
		}
		//
		return true;
	}
	
	// 인증 번호 전송
	function sendNum(f){
		try {
			// 변수 지정
			var isId = isFindId();
			var text = (!isId) ? '이름' : '아이디';
			var element = (!isId) ? 'findNm' : 'findId';
			var value = $("#" + element).val();

			// 유효성 검증
			if(value == ''){
				alert(text + "을(를) 입력해주세요.");
				return;
			}		
			if($("#findEmail").val()==''){
				alert("이메일을 입력해주세요.");
				return;
			}
			// 이메일 기본 형식 (RFC5322)
			var regex = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
			//
			if(!regex.test($("#findEmail").val())){
				alert("이메일 형식을 입력해주세요.");
				return;
			}
			//
			var param = $("#popForm").serialize();
			mailChkYn = false; // 인증 여부
			$("#loadingBar").show();
			//
			$.ajax({
			    	type : 'post',
			    	url : "intrMailProc1010.do",
					data : param,
					dataType : 'text',
					success : function(data){
						//
						var json = eval(data);
		   				if(json[0].joinCode!=""){
		   					// 전송 성공
		   					$("#joinCode").val(json[0].joinCode);
		   					alert("<spring:message code="JOIN.CODE.SUCCESS"/>");
		   					
		   				} else {
		   					// 전송 실패
		   					alert("<spring:message code="FIND.INFO.NONE"/>");
		   				}
		   				//
		   				$("#loadingBar").hide();
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");
			    	}
			});
			
		} catch (error) {
	        console.error("[Error] 인증 번호 전송 : ", error.message);
		}
	}
	
	// 유효성 검증 (기본)
	function validateInput(isId){
		try {
			// 모드에 따라 ID, NM 검사
		    if (!isId) {
		        if ($("#findId").val() == '') {
		            alert("<spring:message code="FIND.ID.NONE"/>");
		            return false;
		        }
		    } else {
		        if ($("#findNm").val() == '') {
		            alert("<spring:message code="FIND.NM.NONE"/>");
		            return false;
		        }
		    }
		    // EMAIL 검사
		    if ($("#findEmail").val() == '') {
		        alert("<spring:message code="FIND.EMAIL.NONE"/>");
		        return false;
		    }
		    
		} catch (error) {
	        console.error("[Error] 유효성 검증 (기본) : ", error.message);
		}
		//
	    return true;
	}
	
	// 유효성 검증 (인증)
	function validateCode(){
		try {
			// 입력, 인증 코드
			var joinCode = $("#joinCode").val();
			var inputCode = $("#inputCode").val();
			
			// 인증 번호 없음
			if(inputCode==""){
				alert("<spring:message code="INPUT.CODE.NONE"/>");
				return false;
			}
			
			// 인증번호 불일치
			if(inputCode!=joinCode){
				mailChkYn = false;
				alert("<spring:message code="CODE.NO.CORRECT"/>");
				return false;
			} 
			
		} catch (error) {
	        console.error("[Error] 유효성 검증 (인증) : ", error.message);
		}
		//
		return true;
	}
	
	// 인증하기
	function chkNum(f){
		try {
			// 유효성 검증
			var isValidate = validateCode();
			if(!isValidate){
				return;
			}
		
			// 인증 성공
			mailChkYn = true;
			alert("<spring:message code="CODE.SUCCESS"/>");
			
		} catch (error) {
	        console.error("[Error] 인증하기 : ", error.message);
		}
	}
	
	// 정보 찾기
	function popConfirm(){
		try {
			// 유효성 검증 (기본)
		    var isId = isFindId();
		    if (!validateInput(isId)) {
		        return;
		    }

		    // 유효성 검증 (인증)
	 	    if (!validateCode()) {
		        return;
		    }

		    // 인증 체크 여부
		    if (!mailChkYn) {
		        alert("<spring:message code="FIND.CHECK.NONE"/>");
		        return;
		    }
			
		    // 인증 후 처리
			var param = $("#popForm").serialize();
			
			$.ajax({
		    	type : 'post',
		    	url : "intrPopupInqy1023.do",
				data : param,
				dataType : 'text',
				success : function(data){
					//
					if(data == ''){
						alert("존재하지 않는 사용자입니다.");
						return;
					}
					//
					var json = eval(data);
					var findId = json[0].findId;
					var findEmail = json[0].findEmail;
					
					// 아이디 / 비밀번호 구분
					if (isId) {
				        setFindId(findId); 
				    } else {
				    	// 비밀번호를 변경할 아이디
				        setChangePwd(findId);
				    }
				},
				error : function(xhr, status, error){
					alert("<spring:message code="PROC.ERROR"/>");
			    }
			});
			
		} catch (error) {
	        console.error("[Error] 정보 찾기 : ", error.message);
		}
	}
	
	//  아이디 출력
	function setFindId(findId){
		try {
			// 아이디 조회
			var html = `
				<div style="height:197px; background-color:#f3f6f8; margin:15px; display:flex; justify-content:center; align-items:center;">
					<span style="color:#000000; font-size:20px;">귀하의 아이디는 <span style="color:#214b97; font-weight:bold;">\${findId}</span>입니다.</span>
				</div>
			`;
			
			// 데이터 출력
			$("#findCon").html(html);
			
			// 버튼 제어
			$("#findBtn").addClass('hidden');
			
		} catch (error) {
	        console.error("[Error] 아이디 출력 : ", error.message);
		}
	}
	
	// 비밀번호 찾기 팝업
	function setChangePwd(findId){
		try {
			//
			var html = `
				<div id="chagePwd" class="chagePwd">
					<input type="hidden" id="chngPwdId" name="chngPwdId" value="` + findId + `">
					<div class="post_write">
						<dl>
							<dt>
								<label>신규 비밀번호</label>
							</dt>
							<dd class="sel_2part">
								<input type="password" title="이메일" id="newPwd" name="newPwd"> 
							</dd>
						</dl>
						<dl>
							<dt>
								<label>비밀번호 확인</label>
							</dt>
							<dd class="sel_2part">
								<input type="password" title="비밀번호 확인" id="newPwdConf" name="newPwdConf" oninput="checkPwd(this);">
							</dd>
							<span id="checkPwd" style="color:red; font-size:14px; text-align:right; margin-top:20px; float:right;"></span>
						</dl>
					</div>
				</div>
			`;
			//  데이터 출력
			$("#findCon").html(html);
			
			// 버튼 제어
			$("#findBtn").addClass('hidden');
			$("#updateBtn").removeClass('hidden');
			
		} catch (error) {
	        console.error("[Error] 비밀번호 찾기 팝업 : ", error.message);
		}
	}
	
	// 비밀번호 변경 처리
	function popUpdate(){
		try {
			// 비밀번호 검증
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
			
			// 파라미터 세팅
			var param = $("#popForm").serialize();
			//
			$.ajax({
				url:"intrEmpProc1050.do",
				dataType : 'text',
				data: param,
				success : function(data){
						//
						var json = eval(data);
						if(json[0].res=='YES'){
							alert("<spring:message code="PROC.SUCCESS"/>");
							popClose('find');
	  						
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
			
		} catch (error) {
	        console.error("[Error] 비밀번호 변경 처리 : ", error.message);
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

<div id="loadingBar" class="loading_bar">
    <div class="loader"></div>
</div>

<form id="popForm">
<div class="pop_area">
	<article class="sub_article">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
                       <div class="find_info_wrap">
                           <div class="post_wrap">
                           		<input type="hidden" id="joinCode" name="joinCode" value="">
								
								<h3>
									<a class="find_id list_bg" onclick="javascript:chgPopup('intrPopupInqy1021.do');">아이디 찾기</a>
									<a class="find_pwd" onclick="javascript:chgPopup('intrPopupInqy1022.do');">비밀번호 찾기</a>
								</h3>
								
                               	<div id="findCon" class="post_con"></div>
                               
                               <div class="btn_center">
                               		<input type="button" id="findBtn" class="btn_blue_thin" value="찾기" onclick="popConfirm();">
                               		<input type="button" id="updateBtn" class="btn_blue_thin hidden" value="변경" onclick="popUpdate();">
                                   	<input type="button" class="btn_gray_thin" value="닫기" onclick="popClose('find');">
                               </div>
                           </div><!-- End post_wrap -->
                         </div> 
				</div><!-- End content_area form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>
</form>