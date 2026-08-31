<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 업무 캘린더 상세 -->
<script>
	$(document).ready(function(){
		// 데이트피커 초기화
		initDatepicker();
		
		// 버튼 제어
		$(".regBtn").hide();
		$(".mdBtn").show();
	});
</script>

<div class="post_view mg0 mt20">
	<dl>
		<dt>&#10003; 업무 제목</dt>
		<dd>
			<input type="text" id="tldrTitle" name="tldrTitle" title="업무 제목" value="${defaultInfo.tldrTitle}" isRequired="Y">
			<input type="hidden" id="tldrId" name="tldrId" value="${defaultInfo.tldrId}">
		</dd>
	</dl>
	<dl class="post_info">
		<dt>&#10003; 업무 기간</dt>
		<dd>
			<input type="text" class="srch_cdt_date srchSdt" id="tldrSdt" name="tldrSdt" title="업무 기간 (시작)" value="${defaultInfo.tldrSdt}" readonly="readonly" isRequired="Y" />
				~
			<input type="text" class="srch_cdt_date srchEdt" id="tldrEdt" name="tldrEdt" title="업무 기간 (종료)" value="${defaultInfo.tldrEdt}" readonly="readonly" isRequired="Y" />
		</dd>
	</dl>
	<dl>
		<dt>&#10003; 업무 내용</dt>
		<dd class="post_text h160p">
			<textarea id="tldrCont" name="tldrCont" title="업무 내용" isRequired="Y">${defaultInfo.tldrTitle}</textarea>
		</dd>
	</dl>
</div><!-- End post_view -->
