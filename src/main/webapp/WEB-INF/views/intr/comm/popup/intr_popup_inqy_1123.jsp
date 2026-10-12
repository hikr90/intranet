<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 업무 캘린더 상세 (메인) -->
<script>
	$(document).ready(function(){
		// 데이트피커 초기화
		initDatepicker();
		
		// 버튼 제어
		$(".regBtn").hide();
		$(".mdBtn").hide();
	});
</script>

<div class="post_view mg0 mt20 form_panel calendar_record_form">
    <dl class="form_row">
        <dt class="form_label">업무 제목</dt>
        <dd class="form_value">
			${defaultInfo.tldrTitle}
		</dd>
	</dl>
    <dl class="post_info form_row">
        <dt class="form_label">업무 기간</dt>
        <dd class="form_value">
			${defaultInfo.tldrSdt} ~ ${defaultInfo.tldrEdt}
		</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">업무 내용</dt>
        <dd class="post_text form_value form_content">
			<pre>${defaultInfo.tldrTitle}</pre>
		</dd>
	</dl>
</div><!-- End post_view -->
