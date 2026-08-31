<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 조직도 관리 -->
<script type="text/javascript">
	// 사원 검색
	function popListCall(event){
		let isEnterKey = false;
		// 엔터키 입력
        if (event) {
            if (event.key === 'Enter') {
                isEnterKey = true;
                event.preventDefault(); 
            } else {
                return;
            }
        }
		// 사원 정보 초기화
		$("#orgNm").text('');
        $("#rankNm").text('');
        $("#empNm").text('');
        $("#mobNo").text('');
        $("#email").text('');
		
        // 사원 검색
        $.ajax({
    		type : 'post',
        	url : 'intrPopupInqy1102.do',
            data : {
            	'srchPnm':$("#srchPnm").val()
            },
            dataType : 'html',
            success : function(data){
            	$("#empTree").html('');			// 초기화
            	$("#empTree").html(data);		// 트리 생성
            },
            error : function(data){
				alert("<spring:message code="PROC.ERROR"/>");
            }
      	});
	}
	
	// 선택 항목 음영 처리
	$(document).on('click','.pop_a_btn',function() {
		$(".pop_a_btn").each(function() {
			$(this).removeClass('list_bg');
		})
		//
		$(this).addClass('list_bg');
		
		// 사원 검색
        $.ajax({
    		type : 'post',
        	url : 'intrPopupInqy1103.do',
            data : {
            	'empIdx':$(this).attr('empIdx')
            },
            dataType : 'json',
            success : function(data){
            	var json = eval(data);
            	// 사원 정보 세팅
            	$("#orgNm").text(json.orgNm);
            	$("#rankNm").text(json.rankNm);
            	$("#empNm").text(json.empNm);
            	$("#mobNo").text(json.mobNo);
            	$("#email").text(json.email);
            },
            error : function(data){
				alert("<spring:message code="PROC.ERROR"/>");
            }
      	});
	});
</script>

<div class="pop_area height100">
	<article class="sub_article height85">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap">
	                	<div class="post_wrap">
							<div class="srch_wrap">
								<div class="srch_area">
									<div class="right_srch_area">
										<label class="srch_label">조직도</label>
									</div>
								</div>
							</div>
							
							<div id="popSrchArea" class="pt10">
								<input type="text" id="srchPnm" class="srch_cdt_text width30" value="" onkeydown="popListCall(event);">
								<input type="button" class="btn_blue" value="조회" onclick="popListCall();">
							</div>
	                        
	                     	<!-- 조직도 상세 -->
	                     	<div id="orgCon" class="post_con inline_flex h325p"></div>
	                        
							<div class="btn_right mt40">
	                      		<button type="button" class="btn_gray_thin" onclick="popClose('org');">닫기</button>
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>

