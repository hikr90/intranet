<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:choose>
	<c:when test="${not empty resMsg}">
		<span>${resMsg}</span>
	</c:when>
	<c:otherwise>
		<table class="post_table">
			<caption>쿼리 결과 조회</caption>
			<thead>
				<tr>
					<c:forEach var="col" items="${colList}">
						<th scope="col" class="w15per">${col}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${dataList}">
					<tr>
						<c:forEach var="col" items="${colList}">
							<td>${data[col]}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
	</c:otherwise>
</c:choose>

