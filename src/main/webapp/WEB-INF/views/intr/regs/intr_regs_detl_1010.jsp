<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		// 페이지 로드 후 탭 오버플로우 체크
	    isTabOverlow();
	    
	    // 윈도우 크기가 변경될 때도 체크 (반응형 대응)
	    $(window).resize(function() {
	    	isTabOverlow();
	    });
	});

	// 탭 선택 처리
	function tabCall(element){
		//
		try {
			// Active 추가
			let elt = $(element);
			$('.tab_item').removeClass('active');
			elt.parent('li').addClass('active');
	
			// 부서 코드 조회
			let tabCd = elt.attr('tabCd');
			$("#pdfIframe").attr("src", "/intr/pdfStream.do?tabCd=" + tabCd);
			
		} catch (error) {
			console.error("[Error] 탭 선택 처리 : ", error.message);
		}
	}
</script>

<body id="main">
<form id="form" method="POST" enctype="multipart/form-data">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>
	
	<div class="main_wrap">
		<!-- 좌측 메뉴 -->
		<div class="left_wrap">
			<div class="left_area">
				<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1031.jsp" %>
			</div>
		</div>

		<div class="content_wrap">
			<div class="content_area">
				<article class="sub_article">
					<div class="content">
						<div id="sub_content">					
							<div class="form_area">
								<div class="post_wrap">
		                            <h2>내부규정</h2>
		                            
		                            <!-- 탭 목록 -->
								    <div class="tab_container">
									    <div class="tab_wrapper">
										    <ul class="tab_list">
								    			<li class="tab_item ${list.tabCd eq param.tabCd or empty list.tabCd ? 'active' : ''}"><a href="javascript:void(0);" onclick="tabCall(this);" tabCd="corp">사규관리 규정</a></li>
								    			<li class="tab_item ${list.tabCd eq param.tabCd and not empty list.tabCd ? 'active' : ''}"><a href="javascript:void(0);" onclick="tabCall(this);" tabCd="hrm">인사관리 규정</a></li>
								    			<li class="tab_item ${list.tabCd eq param.tabCd and not empty list.tabCd ? 'active' : ''}"><a href="javascript:void(0);" onclick="tabCall(this);" tabCd="wel">복리후생 규정</a></li>
										    </ul>
									    </div>
								    </div>
									
									<div id="pdfCont" class="pdf_container mt10">
									    <iframe id="pdfIframe width100" height="700px" src="/intr/pdfStream"></iframe>
									</div>
								</div><!-- End post_wrap -->
							</div><!-- End form_area -->
						</div><!-- End sub_content -->
					</div><!-- End content -->
				</article>
			</div>
		</div>
	</div>
</form>
</body>		

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>
