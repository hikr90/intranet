<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 팝업 (비밀번호 찾기) -->
<script>
	$(document).ready(function(){
		// 제목 제어
		$(".find_pwd").addClass('list_bg');
		$(".find_id").removeClass('list_bg');
		
		// 버튼 제어
		$("#findBtn").removeClass('hide');
		$("#updateBtn").addClass('hide');
	});
</script>

<div id="findPwd" class="findPwd">
    <div class="form_panel">
        <dl class="form_row">
            <dt class="form_label">
				<label>아이디</label>
			</dt>
            <dd class="form_value form_pair">
                <input class="form_input" type="text" title="아이디" id="findId" name="findId">
			</dd>
		</dl>
        <dl class="form_row">
            <dt class="form_label">
				<label>이메일</label>
			</dt>
            <dd class="form_value form_pair">
                <input class="form_input" type="text" title="이메일" id="findEmail" name="findEmail">
                <input type="button" class="btn_blue ml10 btn_action mb5" value="코드 전송" onclick="sendNum(this.form);">
			</dd>
		</dl>
        <dl class="form_row">
            <dt class="form_label">
				<label>인증코드</label>
			</dt>
            <dd class="form_value form_pair">
                <input class="form_input" type="text" title="인증번호 입력" id="inputCode">
                <input type="button" class="btn_navy ml10 btn_action mb5" value="인증하기" onclick="chkNum(this.form);">
			</dd>
		</dl>
	</div>
	<!-- End post_write -->
</div>