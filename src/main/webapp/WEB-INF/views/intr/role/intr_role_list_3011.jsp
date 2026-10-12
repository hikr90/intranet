<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	// 사용자 권한 목록 전체 체크
	$('.empChk').click(function() {
		if($(".empChk").is(":checked")){
			$("input[id=roleEmpIdx]").prop("checked", true);
	    } else {
	    	$("input[id=roleEmpIdx]").prop("checked", false);	
	    }
	});
	
	// 목록 이동
	function moveBtn(f) {
		try {
			// 체크한 건이 없는 경우
			if($("input[name=empIdx]:checked").length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}

			// 체크한 값 이동
			$("input[class=empIdx]:checked").each(function() {
				// 중복 여부 값
				var dupeYn = 'N';
				// 사용자 관련 변수
				var empIdx = $(this).val();
				var empNm = $(this).attr("empNm");
				var orgNm = $(this).attr("orgNm");
				
				// 사용자 권한 목록 값
				$("input[id=roleEmpIdx]").each(function() {
					// 중복되는 경우 중복 여부 값 변경
					var roleEmpIdx = $(this).val();
					//
					if(roleEmpIdx==empIdx){
						//
						dupeYn = "Y";
						return; 
					}
				});
				
				// 중복되지 않는 경우
				if(dupeYn=='N'){
					//
					var str = "";
					//
					str += "<tr>"
                    str += "	<td class='table_cell'>";
					str += "		<span class='check_box'>";
                    str += "		<input type='checkbox' class='checkbox_input checkbox' id='roleEmpIdx' value='" + empIdx + "'/>"
                    str += "		<label class='checkbox_label' for='chk_local'><span class='checkbox_mark'></span></label></span>";
					str += "		<input type='hidden' name='roleEmpIdx' value='" + empIdx + "'/>"
					str += "	</td>";
                    str += "	<td class='table_cell'>" + orgNm + "</td>";
                    str += "	<td class='table_cell'>" + empNm + "</td>";
					str += "</tr>";
					
					$(".roleEmpTbl").append(str);
				}
				
				// 체크 해제
				$("input[id='empIdx']").prop("checked", false);
				$(".empChk").prop("checked", false);
				$(".totalIdx").prop("checked", false);
			});
			
		} catch (error) {
	        console.error("[Error] 목록 이동 : ", error.message);
		}
	}
	
	// 권한 목록 화면 상 제거
	function delCall(){
		try {
			// 유효성 검증
			if($("input[id=roleEmpIdx]:checked").length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}
			
			// 화면 상 삭제 처리
			$("input[id=roleEmpIdx]:checked").each(function() {
				$(this).parents("tr").remove();
			});
			
			// 권한 사용자 체크 초기화
			$(".empChk").prop("checked", false);
			
		} catch (error) {
	        console.error("[Error] 권한 목록 화면 상 제거 : ", error.message);
		}
	}
	
	// 새로고침
	function setListCall() {
		try {
			//
			$('#roleTree .list_bg').trigger("click");
			
		} catch (error) {
	        console.error("[Error] 새로고침 : ", error.message);
		}
	}
	
	// 저장 처리
	function regProc(){
		try {
			// 권한 코드 지정
			$("#roleCd").val($("#roleTree .list_bg").attr('id'));
			
			// 권한 사용자 지정
			$("input[name=roleEmpIdx]").each(function(idx) {
				$(this).attr("name","empIdx"+idx);
			});
			//
			var param = $("#form").serialize();
			if(confirm("저장하시겠습니까?")){
				//
				$.ajax({
		    		type : 'post',
		        	url : 'intrRoleProc3010.do',
		            data : param,
		            dataType : 'html',
		            success : function(data){
		            	//
						alert("<spring:message code="PROC.SUCCESS"/>");
		            	setListCall();
		            },
		            error : function(data){
		            	//
						alert("<spring:message code="PROC.ERROR"/>");
		            }
		      	});
			}
			
		} catch (error) {
	        console.error("[Error] 저장 처리 : ", error.message);
		}
	}
</script>

<div class="list_panel role_members">
	<input type="hidden" id="roleCd" name="roleCd" value="">
	
	<div class="scroll_wrap list_body">
		<table class="post_table data_table roleEmpTbl">
			<caption>사용자 목록 테이블</caption>
			<colgroup>
				<col class="w5per">
				<col class="w10per">
				<col class="w20per">
			</colgroup>
			<thead>
				<tr>
                    <th class="table_header" scope="col">
						<span class="check_box"> 
                        <input type="checkbox" class="checkbox_input check_box empChk">
                        <label class="checkbox_label_lead checkbox_label" for="chk-yes"><span class="checkbox_mark"></span></label></span>
					</th>
                    <th class="table_header" scope="col">부서</th>
                    <th class="table_header" scope="col">사용자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${roleEmpList}" varStatus="status">
					<tr>
                        <td class="table_cell">
							<span class="check_box"> 
                            <input type="checkbox" class="checkbox_input check_box" id="roleEmpIdx" value="${list.empIdx}">
                            <label class="checkbox_label_lead checkbox_label" for="chk-yes"><span class="checkbox_mark"></span></label></span>
							<input type="hidden" name="roleEmpIdx" value="${list.empIdx}">
						</td>
                        <td class="table_cell">${list.orgNm}</td>
                        <td class="table_cell">${list.empNm}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div> <!-- End post_wrap -->

<div class="btn_center form_actions">
    <button type="button" class="btn_gray_thin float_left btn_action action_compact" onclick="delCall();">삭제</button>

    <button type="button" class="btn_navy_thin float_right ml5 btn_action action_compact" onclick="regProc(this.form);">저장</button>
    <button type="button" class="btn_blue_thin float_right btn_action action_compact" onclick="setListCall();">새로고침</button>
</div>