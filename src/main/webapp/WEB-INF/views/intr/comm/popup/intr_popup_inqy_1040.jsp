<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 결재선 관리 -->
<script>
	$(document).ready(function(){
		// 전역 변수
		if (typeof aprvlineList === 'undefined') {
		    window.aprvlineList = [];
		    window.itemlineList = [];
		    window.corplineList = [];
		} else {
			aprvlineList = [];
			itemlineList = [];
			corplineList = [];
		}
	})
	
	// 탭 선택 처리
	function tabCall(element){
		//
		try {
			// Active 추가
			let elt = $(element);
			$('.tab_item').removeClass('active');
			elt.parent('li').addClass('active');
			
			// 영역 조회
			if(elt.parent('li').attr('tabCd') == 'custom'){
				$('#custom').show();
				$('#selected').hide();
			} else {
				$('#custom').hide();
				$('#selected').show();
				
				// 첫 결재선 선택
				$("#lineTree").find("ul li:first-child").find('.a_btn').trigger('click');
			}
			
		} catch (error) {
			console.error("[Error] 탭 선택 처리 : ", error.message);
		}
	}
	
	// 기안 등록 
	function aprvProc(){
		// 변수 지정
		var aprvLine = "";		// 결재선
		var aprvCnt = 0;		// 결재자 수
		var aprvYn = true;		// 유효성 플래그
		var tabCd = $('.active').attr('tabCd');	// 결재선 선택 탭
		var temptypeCd = $('#temptypeCd').val();		// 템플릿 양식
		// 
		try {
			// 결재선 검증
			if(tabCd == 'selected'){
				if($('#lineTree a.list_bg').length < 1){
					alert("<spring:message code="APRV.LINE.NONE"/>");
					return;			
				}
			}
			
			// 선택 탭 검증
			$("#" + tabCd + " .setListTr").each(function(idx){
				var aprvtypeCd = $(this).find("input[name='aprvtypeCd']").val();
				//
				if(aprvtypeCd == 'TYPE_0020') aprvCnt++;
				if(idx != 0 && (aprvtypeCd == '' || aprvtypeCd == null || aprvtypeCd == 'undefined')){
					alert((idx + 1) + "번째 항목의 결재 유형이 선택되지 않았습니다.");
					aprvYn = false;
					return false;
				}
			});
			// 결재 유형 누락
			if(!aprvYn) return false;

			// 결재자 없음
			if(aprvCnt<1){
				alert("<spring:message code="APRV.LINE.ONE"/>");
				return;
			};			

			// 등록
			if(confirm("기안하시겠습니까?")){
				// 에디터 내용 저장
				var getData = CKEDITOR.instances.editor.getData();
				$("#editor").val(getData);

				// 선택 탭 결재선 저장
				$("#" + tabCd + " .setListTr").each(function(idx){
					// 결재선 등록
	    			var aprvIdx = $(this).find("input[name='aprvIdx']").val();
	    			var aprvtypeCd = $(this).find("input[name='aprvtypeCd']").val();
	    			//
		    		aprvlineList.push({
		    	        'aprvIdx': aprvIdx, 
		    	        'aprvtypeCd': aprvtypeCd
		    	    });
				});
				
				// 데이터 삽입
				$('#aprvlineList').val(JSON.stringify(aprvlineList));
				$('#itemlineList').val(JSON.stringify(itemlineList));
				$('#corplineList').val(JSON.stringify(corplineList));

				// 파라미터 생성
				var fileList = setFormData();
				
	   			$.ajax({
					url:"intrAprvProc1010.do?pageUrl=Aprv",
					processData : false,
					contentType : false,
					data: fileList,
					type : 'post',
	   				success : function(data){
	   					//
	   					alert("<spring:message code="APRV.PROC.SUCCESS"/>");
	   					listCall();
	   				},
	   				error : function(res, status, error){
	   					alert("<spring:message code="PROC.ERROR"/>");
	   				}
	   			});
			}
			
		} catch (error) {
	        console.error("[Error] 기안 등록 : ", error.message);
		}
	}
</script>

<div class="pop_area height100">
	<input type="hidden" id="aprvlineList" name="aprvlineList" value="">
	<input type="hidden" id="itemlineList" name="itemlineList" value="">
	<input type="hidden" id="corplineList" name="corplineList" value="">

	<article class="sub_article height85 border_none">
		<div class="content">
			<div id="sub_content">					
				<div class="form_area">
					<div class="pop_wrap h650p">
	                	<div class="post_wrap">
							<div class="srch_wrap">
								<div class="srch_area">
									<div class="right_srch_area">
										<label class="srch_label">결재선 관리</label>
									</div>
								</div>
							</div>
	                        
	                        <!-- 탭 목록 -->
						    <c:if test="${empty defaultInfo}">
							    <div class="tab_container">
								    <div class="tab_wrapper">
									    <ul class="tab_list">
							    			<li class="tab_item ${list.tabCd eq param.tabCd or empty list.tabCd ? 'active' : ''}" tabCd="custom"><a href="javascript:void(0);" onclick="tabCall(this);">직접 지정</a></li>
							    			<li class="tab_item ${list.tabCd eq param.tabCd and not empty list.tabCd ? 'active' : ''}" tabCd="selected"><a href="javascript:void(0);" onclick="tabCall(this);">결재선 선택</a></li>
									    </ul>
								    </div>
							    </div>
						    </c:if>
	                        
	                     	<!-- 결재선 목록 -->
	                     	<div id="lineCon" class="post_con inline_flex pt20 h425p"></div>
	                        
							<div class="btn_right mt40">
	                      		<button type="button" class="btn_blue_thin procBtn" onclick="aprvProc()">등록</button>
	                      		<button type="button" class="btn_gray_thin viewBtn" onclick="popClose('line');">닫기</button>
	                 		</div>
	                 	</div><!-- End post_wrap -->
	               	</div> 
				</div><!-- End form_area -->
			</div><!-- End sub_content -->
		</div><!-- End content -->
	</article>
</div>
