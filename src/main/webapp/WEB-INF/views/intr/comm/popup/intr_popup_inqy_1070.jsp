<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 정산내역 관리 -->
<script>
	// 정산 내역
	let corplineList = [];
</script>

<div class="pop_area height100">
	<article class="sub_article height85">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap h650p">
	                	<div class="post_wrap">
							<div class="srch_wrap">
								<div class="srch_area">
									<div class="right_srch_area">
										<label class="srch_label">정산내역 관리</label>
									</div>
								</div>
							</div>
	                        
	                     	<!-- 정산내역 등록 목록 -->
	                     	<div id="corpCon" class="post_con inline_flex pt20 h425p"></div>
	                        
							<div class="btn_right mt40">
								<span class="float_left">
									<button type="button" class="btn_navy_thin procBtn" onclick="setCorp('add');">추가</button>
									<button type="button" class="btn_gray_thin procBtn" onclick="initCorp(this.form);">초기화</button>
								</span>
							
	                      		<button type="button" class="btn_blue_thin procBtn" onclick="corpProc('corp');">저장</button>
	                      		<button type="button" class="btn_gray_thin viewBtn" onclick="popClose('corp');">닫기</button>
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>

