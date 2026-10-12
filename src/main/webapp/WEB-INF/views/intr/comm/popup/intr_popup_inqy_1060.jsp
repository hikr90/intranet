<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 물품 관리 -->
<script>
	// 물품 등록
	let itemlineList = [];
</script>

<div class="pop_area">
	<article class="sub_article popup_body popup_panel h85per">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap selection_popup">
	                	<div class="post_wrap">
                            <div class="popup_header">
                                <h3 class="popup_heading">물품 관리</h3>
                            </div>
	                        
	                     	<!-- 물품 등록 목록 -->
                        <div id="itemCon" class="post_con popup_content inline_flex pt20"></div>
	                        
                            <div class="btn_right mt40 form_actions">
								<span class="float_left">
                                    <button type="button" class="btn_navy_thin procBtn btn_action action_compact" onclick="setItem('add');">추가</button>
                                    <button type="button" class="btn_gray_thin procBtn btn_action action_compact" onclick="initItem(this.form);">초기화</button>
								</span>
							
                                  <button type="button" class="btn_blue_thin procBtn btn_action action_compact" onclick="itemProc('item');">저장</button>
                                  <button type="button" class="btn_gray_thin viewBtn btn_action action_compact" onclick="popClose('item');">닫기</button>
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>

