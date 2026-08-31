<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		$(document).ready(function() {
			// 첫번째 템플릿 클릭
			$("#tempTree").find("ul li:first-child").find('.a_btn').trigger('click');
		});
		
		// 선택 항목 음영 처리
		$(document).on('click','.a_btn',function() {
			//
			$(".a_btn").each(function() {
				$(this).removeClass('list_bg');
			});
			//
			$(this).addClass('list_bg');
		})
	});

	// 기안문 양식 조회
	function listCall(f){
		try {
			//
			var param = $("#form").serialize();
			
			$.ajax({
	    		type : 'post',
	        	url : 'intrTempInqy1011.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	            	//
	            	$(".tree_info").html("");
	            	$(".tree").html(data);
	            	setTree("tree_area");
	            },
	            error : function(data){
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 기안문 양식 조회 : ", error.message);
		}
	}

	// 기안문 양식 상세보기
	function detCall(tempCd){
		try {
			// 양식 코드 지정
			$("#tempCd").val(tempCd);
			var param = $("#form").serialize();
			//
			$.ajax({
	    		type : 'post',
	        	url : 'intrTempInqy1020.do',
	            data : param,
	            dataType : 'html',
	            success : function(data){
	            	    $(".tree_info").html(data);
	            },
	            error : function(data){
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 기안문 양식 상세보기 : ", error.message);
		}
	}
	
	// 기안문 양식 수정 처리
	function modProc(f){
		try {
			// 유효성 검증
			if(!requiredProc()){return;};
			//
			if(confirm("수정하시겠습니까?")){
				//
				var editCont = CKEDITOR.instances.editor.getData();
				$("#editor").val(editCont);
				//
				var param = $("#form").serialize();
				$.ajax({
		    		type : 'post',
		        	url : 'intrTempProc1010.do',
		            data : param,
		            dataType : 'html',
		            success : function(data){
		            	    $(".tree_info").html(""); // 등록 화면 초기화
		    				alert("<spring:message code="PROC.SUCCESS"/>");
		    				
		    				// 재 조회
		            		$(".listCall").trigger("click");	
		            },
		            error : function(data){
						alert("<spring:message code="PROC.ERROR"/>");
		            }
		      	});
			}
			
		} catch (error) {
	        console.error("[Error] 기안문 양식 수정 처리 : ", error.message);
		}
	}
</script>
<body id="main">
<form id="form" name="form" onsubmit="return false;">
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
									<input type="hidden" id="tempCd" name="tempCd" value="0">
									<input type="button" class="listCall display_none" onclick="listCall(this.form);">
								
									<h2>기안문 관리</h2>
		                            <div class="srch_wrap">
		                            	<div class="right_srch_area">
											<!-- 제목 -->
											<div class="srch_area">
												<label class="srch_label">제목</label>		
												<input type="text" id="srchNm" name="srchNm" class="srch_cdt_text" value="${param.srchNm}" onkeydown="enterListCall(this.form);">
											
												<input type="button" class="btn_blue" value="조회" onclick="listCall(this.form);">
												<input type="button" class="btn_gray" value="초기화" onclick="initCall();">
											</div>
										</div>
		                            </div>
									
									<div class="tree_wrap">
										<div id="tree_area" class="tree_area mr20 w715p h746p"> 
											<div id="tempTree" class="tree">
												<ul class="ul_1">
												<c:forEach var="list" items="${defaultList}" varStatus="status">
				           						   	<c:set var="spanIcon" 	value="icon_list"/> 
		
													<li class="li_1">
													<span class="${spanIcon}"></span>
													<a class="a_btn" id="${list.tempCd}" href="javascript:" onclick="detCall('${list.tempCd}');">${list.tempNm}</a>
												</c:forEach>
												</ul>
											</div>
										</div>
										
										<div class="tree_info" id="tree_info"></div>
									</div>
								</div><!-- End post_wrap -->
							</div><!-- End content_area form_area -->
						</div><!-- End sub_content -->
					</div><!-- End content -->
				</article>
			</div>
		</div>
	</div>
</form>
</body>
</html>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>

