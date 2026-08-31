<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 물품 등록 -->
<script>
	$(document).ready(function() {
		// 물품 목록 초기화
		setItem();
		
		$(document).on("click", "#item_del", function() {
			$(this).parent().parent().remove();		// 물품 삭제
		});
	});
	
	// 목록 추가
	function setItem(flag) {
		try {
			// 목록 추가
			if(flag == "add"){
				//
				var obj = new Object();
				obj['mgtNo'] = '';
			    obj['itemNm'] = '';
			 	obj['itemCnt'] = '';
			    obj['reqRsn'] = '';
				//				
				addItem(obj);
				
			} else {
				// 물품 목록 조회
				itemlineList.forEach(function(item){
					//
					var obj = new Object();
					obj['mgtNo'] = item.mgtNo;
					obj['itemNm'] = item.itemNm;
					obj['itemCnt'] = item.itemCnt;
					obj['reqRsn'] = item.reqRsn;
					//
					addItem(obj);
				});
			}
			
		} catch (error) {
	        console.error("[Error] 목록 추가 : ", error.message);
		}
	}
	
	// 물품 등록 생성
	function addItem(obj){
		try {
			//
			var str = "";

			str += "<tr class='setItemTr'>";
			str += 		"<td class='first_td'>";
			str += 			"<input type='text' id='mgtNo' class='add_height' name='mgtNo' style='width:140px; text-align:center;' value='" + obj["mgtNo"] + "'>"
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<input type='text' id='itemNm' class='add_height' name='itemNm' style='width:240px;' value='" + obj["itemNm"] + "'>"
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<input type='text' id='itemCnt' class='add_height' name='itemCnt' style='width:85px; text-align:center;' value='" + obj["itemCnt"] + "' oninput='numProc(this);'>";
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<input type='text' id='reqRsn' class='add_height' name='reqRsn' style='width:420px;' value='" + obj["reqRsn"] + "'>";
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<span id='item_del' class='task_del' onclick=\"delCall(this);\"></span>";
			str += 		"</td>";
			str += "</tr>";
			//
			$(".itemTbl").append(str);

			// 목록 높이 지정
			$(".add_height").css({
					'height':'35px'
				,	'line-height':'35px'
			});
			
		} catch (error) {
	        console.error("[Error] 물품 등록 생성 : ", error.message);
		}
	}
	
	// 화면 상 제거
	function delCall(t){
		try {
			//
			$(t).closest("tr").remove();
			
		} catch (error) {
	        console.error("[Error] 화면 상 제거 : ", error.message);
		}
	}
	
	// 목록 초기화
	function initItem(f){
		try {
			// 유효성 검증
			if($(".setItemTr").length==0){
				alert("<spring:message code="ADD.CNT.NONE"/>");
				return;
			}
			//
			if(confirm("초기화하시겠습니까?")){
				// 물품 목록 조회
				$(".setItemTr").remove();
				itemlineList.forEach(function(item){
					//
					var obj = new Object();
					obj['mgtNo'] = item.mgtNo;
					obj['itemNm'] = item.itemNm;
					obj['itemCnt'] = item.itemCnt;
					obj['reqRsn'] = item.reqRsn;
					//
					addItem(obj);
				});
			}
			
		} catch (error) {
	        console.error("[Error] 목록 초기화 : ", error.message);
		}
	}
	
	// 목록 저장
	function itemProc(type){
		try {
			//
			var itemLine = "";			// 목록 항목
			var itemYn = true; 		// 유효성 플래그
			var reqCnt = 0;
			//
			itemLine = [];					// 목록 초기화
			//	
			$(".setItemTr").each(function(idx){
				// 유효성 검증
				var mgtNo = $(this).find("input[name='mgtNo']").val();
				var itemNm = $(this).find("input[name='itemNm']").val();
				var itemCnt = $(this).find("input[name='itemCnt']").val();
				var reqRsn = $(this).find("input[name='reqRsn']").val();

				//	유효성 검증		
				if(mgtNo == '' || mgtNo == null || mgtNo == 'undefined'){
					alert((idx + 1) + "번째 항목의 관리번호를 입력해주세요.");
					itemYn = false;
					return false;
				}
				if(itemNm == '' || itemNm == null || itemNm == 'undefined'){
					alert((idx + 1) + "번째 항목의 제품명을 입력해주세요.");
					itemYn = false;
					return false;
				}
				if(itemCnt == '' || itemCnt == null || itemCnt == 0 || itemCnt == 'undefined'){
					alert((idx + 1) + "번째 항목의 수량을 입력해주세요.");
					itemYn = false;
					return false;
				}
				if(reqRsn == '' || reqRsn == null || reqRsn == 'undefined'){
					alert((idx + 1) + "번째 항목의 사유를 입력해주세요.");
					itemYn = false;
					return false;
				}
				// 등록 건수
				reqCnt++;
			});
			
			// 특정 항목이 입력되지 않은 경우
			if(!itemYn) return false;
			
			// 한 건도 등록되지 않은 경우
			if(reqCnt == 0){
				alert("<spring:message code="APRV.ITEM.NONE"/>");
				return;
			}
			
			// 등록		
			if(confirm("<spring:message code="APRV.ITEM.CONFIRM"/>")){
				$(".setItemTr").each(function(idx){
					// 추가
					itemlineList.push({
						'mgtNo' : $(this).find("input[name='mgtNo']").val(), 
						'itemNm' : $(this).find("input[name='itemNm']").val(),
						'itemCnt' : $(this).find("input[name='itemCnt']").val(),
						'reqRsn' : $(this).find("input[name='reqRsn']").val()
					});
				});
				//
				alert("<spring:message code="APRV.ITEM.SUCCESS"/>");
				popClose(type);
			}
			
		} catch (error) {
	        console.error("[Error] 목록 저장 : ", error.message);
		}
	}
</script>

<div class="post_table_wrap scroll_wrap">
	<table class="post_table itemTbl">
		<caption>물품 등록 목록</caption>
		<colgroup>
			<col class="w15per">
			<col class="w25per">
			<col class="w10per">
			<col class="wAutoper">
			<col class="w8per">
		</colgroup>
		<thead>
			<tr class="lh10">
				<th scope="col">관리번호</th>
				<th scope="col">제품명</th>
				<th scope="col">수량</th>
				<th scope="col">사유</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>
