<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- API 조회 -->
<script>
	$(document).ready(function(){
		let jStr = '${jObj}';
 		let jParse = JSON.parse(jStr);
		let jPretty = JSON.stringify(jParse, null, 2);
		
		$("#jObj").text(jPretty);
	});
</script>

<div class="post_view mg0 mt20 form_panel duty_form">
    <dl class="form_row">
        <dt class="form_label">반환 데이터 복사</dt>
        <dd class="form_value">
            <input type="button" class="btn_blue mb5 btn_action" value="복사" onclick="copyUrl('#jObj');">
		</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">반환 데이터</dt>
        <dd class="post_text form_value form_content">
            <textarea id="jObj" class="form_textarea" readonly="readonly"></textarea>
		</dd>
	</dl>
</div><!-- End post_view -->
