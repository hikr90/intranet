<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 담당자 관리 -->
<div id="popArea" class="pop_area">
	<article class="sub_article popup_body popup_panel">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="find_owner_wrap">
						<div class="post_wrap">
                            <div class="popup_header">
                                <h3 class="popup_heading">담당자 조회</h3>
                            </div>
	                        
	                        <!-- 담당자 목록 -->
	                        <div id="empCon" class="lookup_results post_con pop_con"></div>
							
                            <div class="btn_center form_actions">
                                <button type="button" class="btn_navy_thin btn_action action_compact" onclick="popConfirm('emp');">확인</button>
                                <button type="button" class="btn_gray_thin btn_action action_compact" onclick="popClose('emp');">취소</button>
	   						</div>
						</div>
					</div><!-- End post_wrap -->
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>
</html>