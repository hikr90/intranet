<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 결재의견 입력 -->
<div class="post_view mg0 mt20 form_panel opinion_form">
    <dl class="form_row">
        <dt class="form_label">&#10003; 비밀번호</dt>
        <dd class="form_value">
			<input type="password" id="aprvPwd" class="w100per" name="aprvPwd" title="비밀번호" isRequired="Y">
		</dd>
	</dl>
    <dl class="form_row">
        <dt class="form_label">결재의견</dt>
        <dd class="post_text form_value form_content">
            <textarea class="form_textarea" rows="5" cols="20" id="rsltNote" name="rsltNote"></textarea>
		</dd>
	</dl>
</div><!-- End post_view -->