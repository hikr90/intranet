<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 업무 캘린더 관리 -->
<div class="pop_area">
	<article class="sub_article popup_body h80per">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap calendar_popup">
	                	<div class="post_wrap">
                            <div class="popup_header">
                                <h3 class="popup_heading">업무 캘린더 관리</h3>
                            </div>
	                        
	                     	<!-- 업무 캘린더 상세 -->
                        <div id="tldrCon" class="post_con popup_content inline_flex"></div>
                            <div class="btn_right form_actions">
                                     <button type="button" class="btn_blue_thin regBtn btn_action action_compact" onclick="regProc();">등록</button>
                                     <button type="button" class="btn_blue_thin mdBtn btn_action action_compact" onclick="modProc();">수정</button>
                                     <button type="button" class="btn_navy_thin mdBtn btn_action action_compact" onclick="delProc();">삭제</button>
                                  <button type="button" class="btn_gray_thin btn_action action_compact" onclick="popClose('tldr');">닫기</button>
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>

