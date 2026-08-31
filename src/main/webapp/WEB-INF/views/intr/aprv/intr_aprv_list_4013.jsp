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
			str += "		<td>" + obj["orgNm"] + "</td>";
			str += "		<td>" + obj["empNm"] + " " + obj["rankNm"] + "</td>";
			str += "		<td style='padding: 0;'>";
			str += "    		<input type='hidden' id='aprvtypeCd' name='aprvtypeCd' name='aprvtypeCd' value='" + obj["aprvtypeCd"] + "'>";
			str += "    		<input type='hidden' id='aprvIdx' name='aprvIdx' name='aprvIdx' value='" + obj["aprvIdx"] + "'>";
			//
			str += "  		<div class='select_wrap'>";
			str += "    			<div class='pop_sbox' style='width:126px; border:unset; text-indent:0px;'>" + obj["aprvNm"] + "</div>";
			str += "    			<ul class='sUl pop_sul scroll_wrap' style='width:125px; margin-left: -1px;'>";
			
			// 반복문 동작
			arrLine.forEach(item => {
			  str += "      			<li setNm='"+item.name+"' setCd='"+item.code+"' setIdx='" + obj["aprvIdx"] + "'>" + item.name + "</li>";
			});
			//
			str += "    			</ul>";
			str += "  		</div>";
			str += "		</td>";
			str += "		<td><div id='divArea' onclick=\"delCall(this);\"><a>삭제</a></div></td>";
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

<div class="mb10 pd8 b_f6f6f6" >
    <input type="text" id="aprvlineNm" class="h36p w410p" placeholder="결재선 명칭을 입력하세요" value="${aprvlineList[0].aprvlineNm}">

    <div class="float_right">
        <button type="button" class="btn_navy_thin" onclick="saveProc('${aprvlineList[0].aprvlineId}');">저장</button>
        <button type="button" class="btn_blue_thin ml5" onclick="initCall('${aprvlineList[0].aprvlineId}');">새로고침</button>
    </div>
</div>

<!-- 결재선 목록 -->
<div id="tree_info pd10" class="tree_info b_f6f6f6 w623p h390p">
	<div class="post_wrap">
		<div class="scroll_wrap h390p">
			<table class="post_table aprvTbl">
				<caption>결재선 목록</caption>
				<colgroup>
					<col class="w30per">
					<col class="w35per">
					<col class="w20per">
					<col class="w15per">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">부서</th>
						<th scope="col">이름</th>
						<th scope="col">결재유형</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- 결재선 추가 -->
					<c:forEach var="list" items="${aprvlineList}" varStatus="status">
						<tr class="setListTr">
							<td>${list.orgNm}</td>
							<td>${list.aprvNm} ${list.rankNm}</td>
							<td class="pd0">
								<input type="hidden" id="aprvtypeCd" name="aprvtypeCd" value="${list.aprvtypeCd}">
								<input type="hidden" id="aprvIdx" name="aprvIdx" value="${list.aprvIdx}">
								
								<c:if test="${status.index eq 0}">${list.aprvtypeNm}</c:if>
								<c:if test="${status.index ne 0}">
									<div class='select_wrap'>
										<div class='pop_sbox bb_unset text_indent0 w126p'>${list.aprvtypeNm}</div>
										<ul class='sUl pop_sul scroll_wrap ml_1 w125p'>
											<c:forEach var="type" items="${aprvtypeList}" varStatus="status">
												<li setNm='${type.aprvtypeNm}' setCd='${type.aprvtypeCd}'>${type.aprvtypeNm}</li>
											</c:forEach>
										</ul>		
									</div>
								</c:if>
							</td>
							<td>
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

<div class="btn_right">
    <button type="button" class="btn_gray_thin ml5" onclick="delProc('${aprvlineList[0].aprvlineId}');">삭제</button>
</div>