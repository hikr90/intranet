<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 결재선 상세 -->
<div class="post_wrap">
	<div class="scroll_wrap h390p">
		<table class="post_table aprvTbl">
			<caption>결재선 목록</caption>
			<colgroup>
				<col class="w30per">
				<col class="w35per">
				<col class="w20per">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">부서</th>
					<th scope="col">이름</th>
					<th scope="col">결재유형</th>
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
							${list.aprvtypeNm}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div><!-- End post_wrap -->
