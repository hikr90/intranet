<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${fn:length(defaultList)>0}">
	<ul class="ul_1">
		<c:forEach var="list" items="${defaultList}" varStatus="status">
			<c:set var="spanIcon" value="icon_list" />

			<li class="li_1 ml15"><span class="${spanIcon}"></span> 
			<a class="a_btn" id="${list.roleCd}" href="#" onclick="detCall('${list.roleCd}');">${list.roleNm}</a>
		</c:forEach>
	</ul>
</c:if>
<c:if test="${fn:length(defaultList) == 0}">
	<ul class="ul_1">
		<li class="li_1 ml15">
			등록된 권한이 없습니다.
		</li>
	</ul>
</c:if>