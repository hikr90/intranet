<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="post_write mg0">
	<dl>
		<dt>
			<label for="post-title">권한명</label>
		</dt>
		<dd>
			<input type="text" id="roleNm" title="권한명" name="roleNm" value="${defaultInfo.roleNm}">
			<input type="hidden" class="roleCd" id="roleCd" name="roleCd" value="${defaultInfo.roleCd}">
		</dd>
	</dl>
	<dl>
		<dt>
			<label>사용여부</label>
		</dt>
		<dd>
			<div class="radio_box enter-check_box">
				<span class="radio-area"> 
					<input type="radio" id="chk-yes" name="useYn" value="Y" <c:if test="${defaultInfo.useYn eq 'Y'}">checked</c:if>> 
					<label for="chk-yes">예<span></span></label>
					
					<input type="radio" id="chk-no" name="useYn" value="N" <c:if test="${defaultInfo.useYn ne 'Y'}">checked</c:if>> 
					<label for="chk-no" class="ml10">아니오<span></span></label>
				</span> 
			</div>
		</dd>
	</dl>
	<dl>
		<dt>
			<label for="post-title">비고</label>
		</dt>
		<dd>
			<textarea rows="10" cols="30" id="remark" title="비고" name="remark">${defaultInfo.remark}</textarea>
		</dd>
	</dl>
</div>

<div class="btn_center align_right">
	<button type="button" class="btn_navy_thin" onclick="modProc(this.form);">수정완료</button>	
	<button type="button" class="btn_gray_thin" onclick="detCall('${defaultInfo.roleCd}');">취소</button>
</div>
