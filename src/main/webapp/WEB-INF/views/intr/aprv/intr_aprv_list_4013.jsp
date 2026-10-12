<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script>
	//결재선 생성
	function addLine(obj){
		try {
			// 결재선 배열 생성
			var str = "";
			var arrLine = [
		    <c:forEach var="list" items="${typeList}" varStatus="status">
		    	<c:if test="${status.index > 1}">
			      {
			        name: '${list.commcodeNm}',
			        code: '${list.commcodeCd}'
			      }<c:if test="${!status.last}">,</c:if>
		      	</c:if>
		    </c:forEach>
		 	];
			
			str += "<tr class='setListTr' empIdx='" + obj["aprvIdx"] + "'>"
            str += "		<td class='table_cell'>" + obj["orgNm"] + "</td>";
            str += "		<td class='table_cell'>" + obj["empNm"] + " " + obj["rankNm"] + "</td>";
            str += "		<td class='table_cell table_select_cell'>";
			str += "    		<input type='hidden' id='aprvtypeCd' name='aprvtypeCd' name='aprvtypeCd' value='" + obj["aprvtypeCd"] + "'>";
			str += "    		<input type='hidden' id='aprvIdx' name='aprvIdx' name='aprvIdx' value='" + obj["aprvIdx"] + "'>";
			//
			str += "  		<div class='select_wrap'>";
            str += "    			<div class='pop_sbox table_select_value choice_value'>" + obj["aprvNm"] + "</div>";
            str += "    			<ul class='sUl pop_sul scroll_wrap table_select_options choice_options'>";
			
			// 반복문 동작
			arrLine.forEach(item => {
			  str += "      			<li class='choice_item' setNm='"+item.name+"' setCd='"+item.code+"' setIdx='" + obj["aprvIdx"] + "'>" + item.name + "</li>";
			});
			//
			str += "    			</ul>";
			str += "  		</div>";
			str += "		</td>";
            str += "		<td class='table_cell'><div id='divArea' onclick=\"delCall(this);\"><a>삭제</a></div></td>";
			str += "</tr>";
			//
			$(".aprvTbl").append(str);
			
		} catch (error) {
	        console.error("[Error] 결재선 생성 : ", error.message);
		}
	}
	
	// 결재선 삭제
	function delProc(aprvlineId) {
		try {
			//
			if(confirm("<spring:message code="APRV.LINE.DELETE"/>")){
				//
				$.ajax({
		    		type : 'post',
		        	url : 'intrAprvProc2020.do',
		            data : {
		            	sequenceId: aprvlineId
		            },
		            success : function(data){
						alert("<spring:message code="PROC.SUCCESS"/>");
		            	$("#srchLine").trigger('click');
		            },
		            error : function(data){
						alert("<spring:message code="PROC.ERROR"/>");
		            }
		      	});
			}
			
		} catch (error) {
	        console.error("[Error] 결재선 삭제 : ", error.message);
		}
	}
</script>

<div class="approval_document">
<div class="approval_editor" >
    <input type="text" id="aprvlineNm" class="approval_title" placeholder="결재선 명칭을 입력하세요" value="${aprvlineList[0].aprvlineNm}">

    <div class="approval_actions">
        <button type="button" class="btn_navy_thin btn_action action_compact" onclick="saveProc('${aprvlineList[0].aprvlineId}');">저장</button>
        <button type="button" class="btn_blue_thin ml5 btn_action action_compact" onclick="initCall('${aprvlineList[0].aprvlineId}');">새로고침</button>
    </div>
</div>

<!-- 결재선 목록 -->
<div id="tree_info" class="tree_info approval_members">
	<div class="list_panel list_panel_fill">
		<div class="scroll_wrap list_body">
			<table class="post_table data_table aprvTbl">
				<caption>결재선 목록</caption>
				<colgroup>
					<col class="w30per">
					<col class="w35per">
					<col class="w20per">
					<col class="w15per">
				</colgroup>
				<thead>
					<tr>
                        <th class="table_header" scope="col">부서</th>
                        <th class="table_header" scope="col">이름</th>
                        <th class="table_header" scope="col">결재유형</th>
                        <th class="table_header" scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- 결재선 추가 -->
					<c:forEach var="list" items="${aprvlineList}" varStatus="status">
						<tr class="setListTr">
                            <td class="table_cell">${list.orgNm}</td>
                            <td class="table_cell">${list.aprvNm} ${list.rankNm}</td>
                            <td class="table_cell table_select_cell">
								<input type="hidden" id="aprvtypeCd" name="aprvtypeCd" value="${list.aprvtypeCd}">
								<input type="hidden" id="aprvIdx" name="aprvIdx" value="${list.aprvIdx}">
								
								<c:if test="${status.index eq 0}">${list.aprvtypeNm}</c:if>
								<c:if test="${status.index ne 0}">
									<div class='select_wrap'>
										<div class='pop_sbox table_select_value choice_value'>${list.aprvtypeNm}</div>
										<ul class='sUl pop_sul scroll_wrap table_select_options choice_options'>
											<c:forEach var="type" items="${aprvtypeList}" varStatus="status">
												<li class='choice_item' setNm='${type.aprvtypeNm}' setCd='${type.aprvtypeCd}'>${type.aprvtypeNm}</li>
											</c:forEach>
										</ul>		
									</div>
								</c:if>
							</td>
                            <td class="table_cell">
								<c:if test="${status.index ne 0}">
									<div id='divArea' onclick="delCall(this);"><a>삭제</a></div>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div><!-- End post_wrap -->
</div>

<div class="btn_right form_actions">
    <button type="button" class="btn_gray_thin ml5 btn_action action_compact" onclick="delProc('${aprvlineList[0].aprvlineId}');">삭제</button>
</div>
</div><!-- End approval_document -->
