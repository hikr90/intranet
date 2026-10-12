<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<script>
	$(document).ready(function() {
		CKEDITOR.replace('editor',{ height: 500});
	});
</script>

<div class="mt0 form_panel">
    <dl class="form_row">
        <dt class="form_label">
			<label for="post-title">&#10003; 양식명</label>
		</dt>
        <dd class="form_value">
            <input class="form_input" type="text" id="tempNm" title="양식명" name="tempNm" value="${defaultInfo.tempNm}" isRequired="Y">
			<input type="hidden" class="tempCd" id="tempCd" name="tempCd" value="${defaultInfo.tempCd}">
		</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">
			<label for="post-title">&#10003; 양식 내용</label>
		</dt>
        <dd class="form_value">
            <textarea class="form_textarea" id="editor" name="tempCont" title="양식 내용" isRequired="Y">${defaultInfo.tempCont}</textarea>
		</dd>
	</dl>
</div>

<div class="btn_right btn_wrap">
    <button type="button" class="btn_navy_thin btn_action action_compact" onclick="modProc(this.form);">수정</button>
</div>
	