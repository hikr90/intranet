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

<div class="post_view mg0 mt20">
	<dl>
		<dt>반환 데이터 복사</dt>
		<dd>
			<input type="button" class="btn_blue mb5" value="복사" onclick="copyUrl('#jObj');">
		</dd>
	</dl>
	<dl>
		<dt>반환 데이터</dt>
		<dd class="post_text h440p">
			<textarea id="jObj" class="c_727272" readonly="readonly"></textarea>
		</dd>
	</dl>
</div><!-- End post_view -->
