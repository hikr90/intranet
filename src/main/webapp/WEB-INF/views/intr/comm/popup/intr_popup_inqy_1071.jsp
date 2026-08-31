<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 정산내역 등록 -->
<script>
	$(document).ready(function() {
		// 정산 내역 초기화
		setCorp();
		
		$(document).on("click", "#corp_del", function() {
			$(this).parent().parent().remove();		// 정산내역 삭제
		});
	});
	
	// 목록 추가
	function setCorp(flag) {
		try {
			// 목록 추가
			if(flag == "add"){
				//
				var obj = new Object();
				obj["useDt"] = "";
				obj["useLoc"] = "";
			    obj["useAmt"] = "";
			    obj["useRsn"] = "";
				//
				addCorp(obj);
				
			} else {
				// 정산 내역 조회
				corplineList.forEach(function(item){
					//
					var obj = new Object();
					obj["useDt"] = item.useDt;
					obj["useLoc"] = item.useLoc;
				    obj["useAmt"] = item.useAmt;
				    obj["useRsn"] = item.useRsn;
					//
					addCorp(obj);
				});
			}
			
		} catch (error) {
	        console.error("[Error] 목록 추가 : ", error.message);
		}
	}
	
	// 목록 추가
	function addCorp(obj) {
		try {
			// 변수 지정
			var str = "";
			
			str += "<tr class='setCorpTr'>";
			str += 		"<td class='first_td'>";
			str += 		"	<input type='text' class='srch_cdt_date srchSdt add_height' name='useDt' value='" + obj["useDt"] + "' readonly='readonly' />";
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<input type='text' id='useLoc' class='add_height' name='useLoc' style='width:240px;' value='" + obj["useLoc"] + "'>"
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<input type='text' id='useAmt' class='add_height' name='useAmt' style='width:190px; text-align:center;' value='" + obj["useAmt"] + "' oninput='amtProc(this);'>";
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<input type='text' id='useRsn' class='add_height' name='useRsn' style='width:345px;' value='" + obj["useRsn"] + "'>";
			str += 		"</td>";
			str += 		"<td>";
			str += 			"<span id='corp_del' class='task_del' onclick=\"delCall(this);\"></span>";
			str += 		"</td>";
			str += "</tr>";
			//
			$(".corpTbl").append(str);
			
			// 목록 높이 지정
			$(".add_height").css({
					'height':'35px'
				,	'line-height':'35px'
			});
			
			// 달력 생성
			$('input[name="useDt"]').daterangepicker(
					{
						//
						locale:{
							"separator": " ~ ", 										// 구분자
							"format": 'YYYY-MM-DD',						// 포맷
						    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
						    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
						},
						autoUpdateInput: false,										// 값 자동 표시 여부
						timePicker: false,                        							// 시간 표시 여부
					    showDropdowns: true,                     						// 년월 수동 여부
					    autoApply: true,                         							// 확인, 취소 자동 여부
					    timePicker24Hour: false,                  					// 24시 표시 여부
					    timePickerSeconds: false,                 					// 초 표시 여부
					    singleDatePicker: true	                 						// 캘린더 한가지만 사용 여부
			});
			
			// 입력 포맷
			$('input[name="useDt"]').on('apply.daterangepicker', function(ev, picker) {
				$(this).val(picker.startDate.format('YYYY-MM-DD'));
				$(this).val(picker.endDate.format('YYYY-MM-DD'));
			});
			
			// 달력 출력
			setTimeout(function() {
			    $('.daterangepicker').css('z-index', '9999'); // 모달보다 높게
			}, 0);
			
		} catch (error) {
	        console.error("[Error] 목록 생성 : ", error.message);
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
	function initCorp(f){
			// 유효성 검증
		try {
			if($(".setCorpTr").length==0){
				alert("<spring:message code="ADD.CNT.NONE"/>");
				return;
			}
			//			
			if(confirm("초기화하시겠습니까?")){
				// 정산 내역 조회
				$(".setCorpTr").remove();
				corplineList.forEach(function(item){
					//
					var obj = new Object();
					obj['useDt'] = item.useDt;
					obj['useLoc'] = item.useLoc;
					obj['useAmt'] = item.useAmt;
					obj['useRsn'] = item.useRsn;
					//
					addCorp(obj);
				});
			}
			
		} catch (error) {
	        console.error("[Error] 목록 초기화 : ", error.message);
		}
	}
	
	// 목록 저장
	function corpProc(type){
		try {
			//
			var corpLine = "";			// 목록 항목
			var corpYn = true; 		// 유효성 플래그
			var reqCnt = 0;				// 등록 건수
			//	
			$(".setCorpTr").each(function(idx){
				// 유효성 검증
				var useLoc = $(this).find("input[name='useLoc']").val();
				var useAmt = $(this).find("input[name='useAmt']").val();
				var useRsn = $(this).find("input[name='useRsn']").val();
				var useDt = $(this).find("input[name='useDt']").val();

				//	유효성 검증
				if(useDt == '' || useDt == null || useDt == 'undefined'){
					alert((idx + 1) + "번째 항목의 사용 일자를 입력해주세요.");
					corpYn = false;
					return false;
				}
				if(useLoc == '' || useLoc == null || useLoc == 'undefined'){
					alert((idx + 1) + "번째 항목의 사용처를 입력해주세요.");
					corpYn = false;
					return false;
				}
				if(useAmt == '' || useAmt == null || useAmt == "₩0" || useAmt == 'undefined'){
					alert((idx + 1) + "번째 항목의 사용 금액을 입력해주세요.");
					corpYn = false;
					return false;
				}
				if(useRsn == '' || useRsn == null || useRsn == 'undefined'){
					alert((idx + 1) + "번째 항목의 용도를 입력해주세요.");
					corpYn = false;
					return false;
				}
				// 등록 건수
				reqCnt++;
			});
			
			// 특정 항목이 입력되지 않은 경우
			if(!corpYn) return false;
			
			// 한 건도 등록되지 않은 경우
			if(reqCnt == 0){
				alert("<spring:message code="APRV.CORP.NONE"/>");
				return;
			}
			
			// 등록		
			if(confirm("<spring:message code="APRV.CORP.CONFIRM"/>")){
				var total = 0;					// 총 금액
				var amt = 0;					// 계산 금액
				//	
				$(".setCorpTr").each(function(idx){
					// 추가
					corplineList.push({
						'useLoc' : $(this).find("input[name='useLoc']").val(), 
						'useAmt' : $(this).find("input[name='useAmt']").val(),
						'useRsn' : $(this).find("input[name='useRsn']").val(),
						'useDt' : $(this).find("input[name='useDt']").val()
					});
					
		    		// 합계 계산
		    		amt = parseInt($(this).find("input[name='useAmt']").val().replace(/[₩,\s]/g, ""), 10);
		    		total += amt;
				});				
				//	
	    		$("#total").val("₩" + total.toLocaleString());
				alert("<spring:message code="APRV.CORP.SUCCESS"/>");
				popClose(type);
			}
			
		} catch (error) {
	        console.error("[Error] 목록 저장 : ", error.message);
		}
	}
</script>

<div class="post_table_wrap scroll_wrap">
	<table class="post_table corpTbl">
		<caption>정산내역 등록 목록</caption>
		<colgroup>
			<col class="w12per">
			<col class="w25per">
			<col class="w20per">
			<col class="wAutoper">
			<col class="w8per">
		</colgroup>
		<thead>
			<tr class="lh10">
				<th scope="col">사용 일자</th>
				<th scope="col">사용처</th>
				<th scope="col">사용 금액</th>
				<th scope="col">용도</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>
