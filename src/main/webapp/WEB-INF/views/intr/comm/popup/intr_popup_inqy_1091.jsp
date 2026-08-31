<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 회의 조회 -->
<div class="post_view mg0 mt20">
	<dl>
		<dt>회의 제목</dt>
		<dd>${defaultInfo.mtgTitle}</dd>
		<dt>등록자</dt>
		<dd>${defaultInfo.orgNm} ${defaultInfo.empNm} ${defaultInfo.rankNm}</dd>
	</dl>
	<dl class="post_info">
		<dt>회의 일자</dt>
		<dd>
			<span class="date">
				<fmt:parseDate value="${defaultInfo.mtgDt}" var="parseDt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
				${formatDt}
			</span>
		</dd>

		<dt>회의 시간</dt>
		<dd>
			<span class="date">
				<fmt:parseDate value="${defaultInfo.mtgStm}" var="parseStm" pattern="HHmm"/>
				<fmt:formatDate value="${parseStm}" var="formatStm" pattern="HH:mm"/>
				
				<fmt:parseDate value="${defaultInfo.mtgEtm}" var="parseEtm" pattern="HHmm"/>
				<fmt:formatDate value="${parseEtm}" var="formatEtm" pattern="HH:mm"/>
				${formatStm} ~ ${formatEtm}
			</span>
		</dd>
	</dl>
	<dl>
		<dt>회의 장소</dt>
		<dd>${defaultInfo.mtgLocNm}</dd>
	</dl>
	<dl>
		<dt>회의 내용</dt>
		<dd class="post_text h140p">
			<pre>${defaultInfo.mtgCont}</pre>
		</dd>
	</dl>
</div><!-- End post_view -->
