<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${fn:length(defaultList)>0}">
	<ul class="ul_1">
		<c:forEach var="list" items="${defaultList}" varStatus="status">
			<c:set var="spanIcon" value="icon_list" />

			<li class="li_1"><span class="${spanIcon}"></span> 
			<a class="a_btn" id="${list.tempCd}" href="javascript:" onclick="detCall('${list.tempCd}');">${list.tempNm}</a>
		</c:forEach>
	</ul>
</c:if>