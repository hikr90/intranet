<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 결재의견 관리 -->
<div class="pop_area height100">
	<article class="sub_article pb20">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap h330p">
	                	<div class="post_wrap">
							<div class="srch_wrap">
								<div class="srch_area">
									<div class="right_srch_area">
										<label class="srch_label">결재 의견 입력</label>
									</div>
								</div>
							</div>
	                        
	                     	<!-- 결재 의견 입력 -->
	                     	<div id="opinCon" class="post_con inline_flex h240p"></div>
	                        
							<div class="btn_right">
	                      		<input type="button" class="btn_blue_thin" value="확인" onclick="opinConf('opin');">
								<input type="button" class="btn_gray_thin" value="취소" onclick="popClose('opin');">
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>