<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<script type="text/javascript">
	$(document).ready(function(){
		$("#title").text("담당업무 조회");
	})	
</script>

<!-- 담당업무 조회 -->
<div class="srch_wrap mt5">
	<div class="right_srch_area">
		<!-- 부서 -->
		<div class="srch_area">
			<label class="srch_label">부서</label>
			<input type="text" id="orgNm" name="orgNm" class="srch_cdt_text" value="${param.orgNm}" onkeydown="enterListCall(this.form);">
		</div>

		<!-- 직급 -->
		<div class="srch_area">
			<label class="srch_label">직급</label>
			<input type="text" id="rankNm" name="rankNm" class="srch_cdt_text" value="${param.rankNm}" onkeydown="enterListCall(this.form);">
		</div>
		
		<!-- 사원명 -->
		<div class="float_right">
			<div class="srch_area">
				<label class="srch_label">업무명 및 상세</label>
				<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
			
				<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
				<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
			</div>
		</div>
	</div>
</div>

<div class="post_table_wrap">
	<table class="post_table">
		<caption>담당업무 목록페이지 입니다.</caption>
		<colgroup>
			<col class="w8per">
			<col class="w8per">
			<col class="w15per">
			<col class="w30per">
			<col class="w8per">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">담당자</th>
				<th scope="col">연락처</th>
				<th scope="col">담당업무</th>
				<th scope="col">상세</th>
				<th scope="col">대직자</th>
			</tr>
		</thead>
		<tbody>
 			<c:forEach var="list" items="${defaultList}" varStatus="status"> 
				<tr>
					<td class="first_td">${list.empInfo}</td>
					<td>${list.mobNo}</td>
					<td>${list.dutyTitle}</td>
					<td>${list.dutyCont}</td>
					<td>${list.tpicInfo}</td>
            	</tr>
			</c:forEach>
                                 
			<!-- 글이 없는 경우 -->
			<c:if test="${empty defaultList}">
			    <tr>
			        <td align="center" colspan="5">
			      	      등록된 사원이 없습니다.
			        </td>
			    </tr>
			</c:if>
		</tbody>
	</table>
</div>

<c:if test="${not empty defaultList}">
	<div class="paging_area">
		<div class="list_cnt">총 건수 : ${defaultList[0].listCnt}건</div>
		<ul class="paging">
			<li class="">${pageMenu}</li>
		</ul>
	</div><!-- End paging_wrap -->
</c:if>
<!-- 담당업무 조회 -->