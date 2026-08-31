<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 휴가 조회 -->
<div class="post_view mg0 mt20">
	<dl>
		<dt>휴가자</dt>
		<dd>${defaultInfo.orgNm} ${defaultInfo.empNm} ${defaultInfo.rankNm}</dd>
		<dt>휴가 유형</dt>
		<dd>${defaultInfo.leavtypeNm}</dd>
	</dl>
	<dl class="post_info">
		<dt>휴가 기간</dt>
		<dd>
			<span class="date">
				<fmt:parseDate value="${defaultInfo.leavSdt}" var="parseSdt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${parseSdt}" var="formatSdt" pattern="yyyy-MM-dd"/>
				
				<fmt:parseDate value="${defaultInfo.leavEdt}" var="parseEdt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${parseEdt}" var="formatEdt" pattern="yyyy-MM-dd"/>
				${formatSdt} ~ ${formatEdt}
			</span>
		</dd>
	</dl>
	<dl>
		<dt>적요</dt>
		<dd class="post_text h160p">
			<pre>${defaultInfo.leavRsn}</pre>
		</dd>
	</dl>
</div><!-- End post_view -->
