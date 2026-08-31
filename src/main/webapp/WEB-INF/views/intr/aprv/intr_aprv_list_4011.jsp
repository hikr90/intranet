<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${not empty defaultList}">
	<ul class="ul_1">
		<c:forEach var="list" items="${defaultList}" varStatus="status">
    		<c:set var="spanIcon" 	value="icon_list"/> 

			<li class="li_1 ml15">
				<span class="${spanIcon}"></span>
				<a class="a_btn" id="${list.aprvlineId}" href="#" onclick="detCall('${list.aprvlineId}');">${list.aprvlineNm}</a>
			</li>
		</c:forEach>
	</ul>
</c:if>
<c:if test="${empty defaultList}">
	<ul class="ul_1">
		<li class="li_1 ml15">
			등록된 결재선이 없습니다.
		</li>
	</ul>
</c:if>
