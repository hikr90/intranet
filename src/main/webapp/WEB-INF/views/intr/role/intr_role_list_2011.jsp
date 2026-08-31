<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
	// 전체 메뉴 목록 전체 체크
	$('.menuChk').click(function() {
		if($(".menuChk").is(":checked")){
			$("input[name=menuCd]").prop("checked", true);
	    } else {
	    	$("input[name=menuCd]").prop("checked", false);	
	    }
	});
	
	// 메뉴 부여 목록 전체 체크
	$('.roleChk').click(function() {
		if($(".roleChk").is(":checked")){
			$("input[id=roleMenuCd]").prop("checked", true);
	    } else {
	    	$("input[id=roleMenuCd]").prop("checked", false);	
	    }
	});
	
	// 목록 이동
	function moveBtn(f) {
		try {
			// 체크한 건이 없는 경우
			if($("input[id=menuCd]:checked").length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}
			
			// 체크한 값 이동
			$("input[id=menuCd]:checked").each(function() {
				// 중복 여부 값
				var dupeYn = 'N';
				// 메뉴 관련 변수
				var menuCd = $(this).val();
				var menuNm = $(this).attr("menuNm");
				var menutypeCd = $(this).attr("menutypeCd");
				var menuLv = $(this).attr("menuLv");
				
				// 메뉴 권한 목록 값
				$("input[id=roleMenuCd]").each(function() {
					// 중복되는 경우 중복 여부 값 변경
					var roleMenuCd = $(this).val();
					//
					if(roleMenuCd==menuCd){
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
					str += "	<td class='first_td'>";
					str += "		<span class='check_box'>";
					str += "		<input type='checkbox' class='checkbox' id='roleMenuCd' value='" + menuCd + "'/>"
					str += "		<label for='chk_local'><span></span></label></span>";
					str += "		<input type='hidden' name='roleMenuCd' value='" + menuCd + "'/>"
					str += "	</td>";
					//
					if(menuLv!=1){
						str += "	<td style='text-align: left;'>&nbsp; <img src='resources/images/icon/icon_tree_arrow.png' width='13' height='13' style='margin-right: 5px;'/> " + menuNm + "</td>";
					} else {
						str += "	<td style='text-align: left;'>" + menuNm + "</td>";
					}
					//
					str += "</tr>";
					
					$(".roleMenuTbl").append(str);
				}
				
				// 체크 해제
				$("input[id='menuCd']").prop("checked", false);
				$(".menuChk").prop("checked", false);
			});
			
		} catch (error) {
	        console.error("[Error] 목록 이동 : ", error.message);
		}
	}
	
	// 권한 목록 화면 상 제거
	function delCall(){
		try {
			// 유효성 검증
			if($("input[id=roleMenuCd]:checked").length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}
			
			// 화면 상 삭제 처리
			$("input[id=roleMenuCd]:checked").each(function() {
				$(this).parents("tr").remove();
			});
			
			// 권한 목록 체크 초기화
			$(".roleChk").prop("checked", false);			
			
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
	
	// 권한 저장 처리
	function regProc(){
		try {
			// 권한 메뉴 추가
			$("input[name=roleMenuCd]").each(function(idx) {
				$(this).attr("name","menuCd"+idx);
			});
			//
			var param = $("#form").serialize();
			//
			if(confirm("저장하시겠습니까?")){
				//
				$.ajax({
		    		type : 'post',
		        	url : 'intrRoleProc2010.do',
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
	        console.error("[Error] 권한 저장 처리 : ", error.message);
		}
	}
</script>
<div class="post_wrap pd0 h490p">
	<div class="scroll_wrap h490p">
		<table class="post_table roleMenuTbl">
			<caption>권한 목록 테이블</caption>
			<colgroup>
				<col class="w7per">
				<col class="w30per">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">
						<span class="check_box"> 
						<input type="checkbox" class="check_box roleChk"> 
						<label for="chk-yes"><span></span></label></span>
					</th>
					<th scope="col">메뉴 부여</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${roleMenuList}" varStatus="status">
					<tr>
						<td class="first_td">
							<span class="check_box"> 
							<input type="checkbox" class="check_box" id="roleMenuCd" value="${list.menuCd}"> 
							<label for="chk-yes"><span></span></label></span>
							<input type="hidden" name="roleMenuCd" value="${list.menuCd}">
						</td>
						<td class="align_left">
							<c:if test="${list.lv ne '1'}">
								&nbsp; <img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
							</c:if>
							${list.menuNm}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div> <!-- End post_wrap -->

<div class="btn_center">
	<button type="button" class="btn_gray_thin float_left" onclick="delCall();">삭제</button>
	
	<button type="button" class="btn_navy_thin float_right ml5" onclick="regProc(this.form);">저장</button> 
	<button type="button" class="btn_blue_thin float_right" onclick="setListCall();">새로고침</button>
</div>