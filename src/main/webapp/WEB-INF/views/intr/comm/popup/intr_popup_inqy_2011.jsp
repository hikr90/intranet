<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 비밀번호 변경 (마이페이지) -->
<div id="chagePwd" class="chagePwd">
	<div class="post_write">
		<dl>
			<dt>
				<label>변경 비밀번호</label>
			</dt>
			<dd class="sel_2part">
				<input type="password" title="이메일" id="newPwd" name="newPwd">
			</dd>
		</dl>
		<dl>
			<dt>
				<label>비밀번호 확인</label>
			</dt>
			<dd class="sel_2part">
				<input type="password" title="비밀번호 확인" id="newPwdConf" name="newPwdConf" oninput="checkPwd(this);">
			</dd>
			<span id="checkPwd" class="fs_16 mt20 float_right align_right c_ff0000"></span>
		</dl>
	</div>
</div>
