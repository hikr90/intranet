<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 정산내역 조회 -->
<div class="post_table_wrap scroll_wrap">
	<table class="post_table data_table entry_table">
		<caption>정산내역 등록 목록</caption>
		<colgroup>
			<col class="w25per">
			<col class="w20per">
			<col class="wAutoper">
		</colgroup>
		<thead>
			<tr>
                <th class="table_header" scope="col">사용 일자</th>
                <th class="table_header" scope="col">사용처</th>
                <th class="table_header" scope="col">사용 금액</th>
                <th class="table_header" scope="col">용도</th>
			</tr>
		</thead>
		<tbody>
			 <c:forEach var="list" items="${corpList}" varStatus="status"> 
				<tr>
                    <td class='table_cell'>${list.useDt}</td>
                     <td class="table_cell">${list.useLoc}</td>
                     <td class="table_cell">${list.useAmt}</td>
                     <td class="table_cell">${list.useRsn}</td>
			    </tr>
			</c:forEach>
		</tbody>
	</table>
</div>
