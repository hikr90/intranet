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
			//
			str += "  		<div class='select_wrap'>";
			str += "    			<div class='pop_sbox' style='width:126px; border:unset; text-indent:0px;'>" + obj["aprvNm"] + "</div>";
			str += "    			<input type='hidden' id='aprvtypeCd' name='aprvtypeCd' name='aprvtypeCd' value='" + obj["aprvtypeCd"] + "'>";
			str += "    			<input type='hidden' id='aprvIdx' name='aprvIdx' name='aprvIdx' value='" + obj["aprvIdx"] + "'>";
			str += "				";
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
</script>

<div class="mb10 pd8 b_f6f6f6">
    <input type="text" id="aprvlineNm" class="h36p w410p" placeholder="결재선 명칭을 입력하세요">

    <div class="float_right">
        <button type="button" class="btn_navy_thin" onclick="saveProc('');">저장</button>
        <button type="button" class="btn_blue_thin ml5" onclick="initCall('');">새로고침</button>
    </div>
</div>

<!-- 결재선 목록 -->
<div id="tree_info" class="tree_info pd10 b_f6f6f6 w623p h390p">
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
					<tr class="setListTr" empIdx="${empVO.empIdx}">
						<td>${empVO.orgNm}</td>
						<td>${empVO.empNm} ${empVO.rankNm}</td>
						<td>기안
							<input type="hidden" id="aprvtypeCd" name="aprvtypeCd" value="TYPE_0010">
							<input type="hidden" id="aprvIdx" name="aprvIdx" value="${empVO.empIdx}">
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div><!-- End post_wrap -->
</div>