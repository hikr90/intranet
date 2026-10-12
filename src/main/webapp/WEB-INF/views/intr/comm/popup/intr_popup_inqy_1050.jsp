<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 결재의견 관리 -->
<div class="pop_area">
	<article class="sub_article popup_body popup_panel pb20">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap opinion_popup">
	                	<div class="post_wrap">
                            <div class="popup_header">
                                <h3 class="popup_heading">결재 의견 입력</h3>
                            </div>
	                        
	                     	<!-- 결재 의견 입력 -->
                        <div id="opinCon" class="post_con popup_content inline_flex"></div>
	                        
                            <div class="btn_right form_actions">
                                  <input type="button" class="btn_blue_thin btn_action action_compact" value="확인" onclick="opinConf('opin');">
                                <input type="button" class="btn_gray_thin btn_action action_compact" value="취소" onclick="popClose('opin');">
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>