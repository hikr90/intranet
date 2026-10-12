<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 물품 조회 -->
<div class="post_table_wrap scroll_wrap">
	<table class="post_table data_table entry_table">
		<caption>물품 등록 목록</caption>
		<colgroup>
			<col class="w15per">
			<col class="w25per">
			<col class="w10per">
			<col class="wAutoper">
		</colgroup>
		<thead>
			<tr>
                <th class="table_header" scope="col">관리번호</th>
                <th class="table_header" scope="col">제품명</th>
                <th class="table_header" scope="col">수량</th>
                <th class="table_header" scope="col">사유</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${itemList}" varStatus="status"> 
				<tr>
                    <td class='table_cell'>${list.mgtNo}</td>
                     <td class="table_cell">${list.itemNm}</td>
                     <td class="table_cell">${list.itemCnt}</td>
                     <td class="align_left table_cell">${list.reqRsn}</td>
			    </tr>
			</c:forEach>
		</tbody>
	</table>
</div>
