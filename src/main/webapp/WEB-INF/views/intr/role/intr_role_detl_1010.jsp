<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="post_write mg0">
	<dl>
		<dt>
			<label for="post-title">권한명</label>
		</dt>
		<dd>
			${defaultInfo.roleNm} 
		</dd>
	</dl>
	<dl>
		<dt>
			<label for="post-title">사용여부</label>
		</dt>
		<dd>
			<c:if test="${defaultInfo.useYn eq 'Y'}">예</c:if>
			<c:if test="${defaultInfo.useYn ne 'Y'}">아니오</c:if>
		</dd>
	</dl>
	<dl>
		<dt>
			<label for="post-title">비고</label>
		</dt>
		<dd>
			${defaultInfo.remark}
		</dd>
	</dl>
</div>

<div class="btn_center align_right">
	<button type="button" class="btn_navy_thin" onclick="modCall(this.form);">수정</button>
	<button type="button" class="btn_gray_thin" onclick="delProc(this.form);">삭제</button>	
</div>
	