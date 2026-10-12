<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 로그 상세 -->
<div class="pop_area">
	<article class="sub_article popup_body popup_panel">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
                       <div class="pop_wrap">
                            <div class="popup_header">
                                <h3 class="popup_heading">로그 상세</h3>
                            </div>
								
							<!-- 로그 상세 -->
                            <div id="logCon" class="post_con"></div>
                               
                            <div class="btn_center form_actions">
                                <input type="button" class="btn_gray_thin btn_action action_compact" value="닫기" onclick="popClose('log');">
                            </div><!-- End post_wrap -->
                         </div> 
				</div><!-- End content_area form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>
