<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="mg0 form_panel">
    <dl class="form_row">
        <dt class="form_label">
			<label for="post-title">권한명</label>
		</dt>
        <dd class="form_value">
            <input class="form_input" type="text" id="roleNm" title="권한명" name="roleNm" value="${defaultInfo.roleNm}">
			<input type="hidden" class="roleCd" id="roleCd" name="roleCd" value="${defaultInfo.roleCd}">
		</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">
			<label>사용여부</label>
		</dt>
        <dd class="form_value">
			<div class="radio_box enter-check_box">
				<span class="radio-area"> 
                    <input class="radio_input" type="radio" id="chk-yes" name="useYn" value="Y" <c:if test="${defaultInfo.useYn eq 'Y'}">checked</c:if>>
                    <label class="radio_label_lead radio_label" for="chk-yes">예<span class="radio_mark"></span></label>
					
                    <input class="radio_input" type="radio" id="chk-no" name="useYn" value="N" <c:if test="${defaultInfo.useYn ne 'Y'}">checked</c:if>>
                    <label for="chk-no" class="radio_label ml10">아니오<span class="radio_mark"></span></label>
				</span> 
			</div>
		</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">
			<label for="post-title">비고</label>
		</dt>
        <dd class="form_value">
            <textarea class="form_textarea" rows="10" cols="30" id="remark" title="비고" name="remark">${defaultInfo.remark}</textarea>
		</dd>
	</dl>
</div>

<div class="btn_right btn_center form_actions">
    <button type="button" class="btn_navy_thin btn_action action_compact" onclick="modProc(this.form);">수정완료</button>
    <button type="button" class="btn_gray_thin btn_action action_compact" onclick="detCall('${defaultInfo.roleCd}');">취소</button>
</div>
