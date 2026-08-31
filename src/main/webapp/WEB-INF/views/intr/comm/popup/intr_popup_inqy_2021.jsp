<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 로그 메세지 조회 -->
<div class="post_view mg0 mt20">
	<dl>
		<dt>요청자</dt>
		<dd>${defaultInfo.orgNm} ${defaultInfo.empNm}</dd>
		<dt>요청일자</dt>
		<dd>
			<span class="date">
				<fmt:parseDate value="${defaultInfo.regDt}" var="parseDt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
				
				<fmt:parseDate value="${defaultInfo.regTm}" var="parseTm" pattern="HHmmss"/>
				<fmt:formatDate value="${parseTm}" var="formatTm" pattern="HH:mm:ss"/>
				${formatDt} ${formatTm}
			</span>	
		</dd>
	</dl>
	<dl class="post_info">
		<dt>요청 URL</dt>
		<dd>${defaultInfo.mappingId}</dd>
		<dt>요청자 IP</dt>
		<dd>${defaultInfo.ipAddr}</dd>
	</dl>
	<dl>
		<dt>메세지</dt>
		<dd class="post_text h160p">
			<textarea readonly="readonly">${defaultInfo.logMsg}</textarea>
		</dd>
	</dl>
</div><!-- End post_view -->