<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 로그 메세지 조회 -->
<div class="post_view mg0 mt20 form_panel resignation_form">
    <dl class="form_row">
        <dt class="form_label">요청자</dt>
        <dd class="form_value">${defaultInfo.orgNm} ${defaultInfo.empNm}</dd>
        <dt class="form_label">요청일자</dt>
        <dd class="form_value">
			<span class="date">
				<fmt:parseDate value="${defaultInfo.regDt}" var="parseDt" pattern="yyyyMMdd"/>
				<fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
				
				<fmt:parseDate value="${defaultInfo.regTm}" var="parseTm" pattern="HHmmss"/>
				<fmt:formatDate value="${parseTm}" var="formatTm" pattern="HH:mm:ss"/>
				${formatDt} ${formatTm}
			</span>	
		</dd>
	</dl>
    <dl class="post_info form_row">
        <dt class="form_label">요청 URL</dt>
        <dd class="form_value">${defaultInfo.mappingId}</dd>
        <dt class="form_label">요청자 IP</dt>
        <dd class="form_value">${defaultInfo.ipAddr}</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">메세지</dt>
        <dd class="post_text form_value form_content">
            <textarea class="form_textarea" readonly="readonly">${defaultInfo.logMsg}</textarea>
		</dd>
	</dl>
</div><!-- End post_view -->