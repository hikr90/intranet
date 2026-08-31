<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#title").text("담당업무 등록");
	})	
	
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
	
	// 담당업무 저장 처리
	function saveProc(){
		//
		if($("#dutyTitle").val() == ''){
			alert("<spring:message code="DUTY.TITLE.NONE"/>");
			return;
		}
		//
		try {
			//
			if(confirm("저장하시겠습니까?")){
				$.ajax({
			    	type : 'post',
			    	url : "intrEmpProc2010.do",
					data : {
						'dutyId':$("#dutyId").val(),
						'dutyTitle':$("#dutyTitle").val(),
						'dutyCont':$("#dutyCont").val(),
						'empIdx':'${empVO.empIdx}',
						'tpicIdx':$("#empPcd").val()
					},
					dataType : 'text',
					success : function(data){
			    		//
   						var json = eval(data);
   						if(json[0].res=="YES"){
   							alert("<spring:message code="PROC.SUCCESS"/>");
							
   						} else {
   							alert("<spring:message code="PROC.FAIL"/>");
	   					}
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");				
				    }
				});
			}
			
		} catch (error) {
	        console.error("[Error] 담당업무 저장 처리 : ", error.message);
		}
	}
	
	// 담당업무 삭제
	function deleteProc(){
		//
		try {
			//
			if($("#dutyId").val() == ''){
				alert("<spring:message code="DUTY.ID.NONE"/>");
				return;
			}
			if($("#dutyTitle").val() == ''){
				alert("<spring:message code="DUTY.TITLE.NONE"/>");
				return;
			}
			//
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
			    	type : 'post',
			    	url : "intrEmpProc2020.do",
					data : {
						'dutyId':$("#dutyId").val(),
						'empIdx':'${empVO.empIdx}'
					},
					dataType : 'text',
					success : function(data){
			    		//
   						var json = eval(data);
   						if(json[0].res=="YES"){
   							alert("<spring:message code="PROC.SUCCESS"/>");
   							// 초기화
   							$("#dutyId").val('');
   							$("#dutyTitle").val('');
   							$("#dutyCont").val('');
   							$("#empPcd").val('');
   							$("#empPnm").val('');
							
   						} else {
   							alert("<spring:message code="PROC.FAIL"/>");
	   					}
					},
					error : function(xhr, status, error){
						alert("<spring:message code="PROC.ERROR"/>");				
				    }
				});
			}
			
		} catch (error) {
	        console.error("[Error] 담당업무 삭제 처리 : ", error.message);
		}
	}
	
	// 대직자 초기화
	function initTpicCall(){
		$("#empPcd").val("");
		$("#empPnm").val("");
	}
</script>

<input type="hidden" id="dutyId" value="${defaultInfo.dutyId}">
<input type="hidden" id="empPcd" value="${defaultInfo.tpicIdx}">
	
<!-- 담당자 팝업 -->
<div id="empArea" class="popupArea hidden">
	<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1010.jsp"></c:import>	
</div>

<div class="post_wrap">
	<div class="post_view">
		<dl>
			<dt>&#10003; 업무 제목</dt>
			<dd>
				<input type="text" id="dutyTitle" title="업무 제목" name="dutyTitle" value="${defaultInfo.dutyTitle}">
			</dd>
			<dt>대직자</dt>
			<dd>
				<input type="text" id="empPnm" class="width50" title="담당자" value="${defaultInfo.tpicNm}" disabled="disabled">
				<input type="button" class="btn_blue align_top" value="선택" onclick="popCall();">
				<input type="button" class="btn_gray align_top" value="초기화" onclick="initTpicCall();">
			</dd>
		</dl>
		<dl>
			<dt>업무 상세</dt>
			<dd class="post_text">
				<textarea class="post_text" id="dutyCont" title="업무 상세">${defaultInfo.dutyCont}</textarea>
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
