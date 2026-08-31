<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<head>
	<script type="text/javascript">
	// 전역 변수 설정
		let fileCnt = "${defaultList.size()}" != null && "${defaultList.size()}" != "" ? "${defaultList.size()}" : 0;
		let mtgStm = null;
    	let mtgEtm = null;
		
    	$(document).ready(function() {
	    	// 오늘 선택 
	    	$('#mtgDt').val(getDateStamp(new Date()));
	    	
	    	// 시간 선택
			$(document).on('click', '.mtg_btn', function() {
				// 예약된 값은 무시
				if ($(this).hasClass('booked')) return;
				
				// 숫자 변환 (0900 -> 900)
				let currentTime = parseInt($(this).data('time'));
				
				// 시작 선택
				if(!mtgStm || (mtgStm && mtgEtm)) {
		            $('.mtg_btn').removeClass('active');
		            mtgStm = currentTime;
		            mtgEtm = null;
		            $(this).addClass('active');
		            
		        } else {
		        	// 종료 선택
		        	let tmpStm = mtgStm;
		            let tmpEtm = currentTime;
		            
		            // 선택 순서 상관없이 작은 값이 start, 큰 값이 end
		            let start = Math.min(tmpStm, tmpEtm);
		            let end = Math.max(tmpStm, tmpEtm);
		            
		            // 범위 내 예약된 시간이 있는지 조회
		            let isBlocked = false;
		            $('.mtg_btn').each(function() {
		                let btnTime = parseInt($(this).data('time'));
		                if (btnTime >= start && btnTime <= end) {
		                    if ($(this).hasClass('booked')) {
		                        isBlocked = true;
		                        return false;
		                    }
		                }
		            });
		            
		            // 중복 시간 검증
		            if (isBlocked) {
		                alert("이미 예약된 시간이 포함되어 있어 선택할 수 없습니다.");
		                $('.mtg_btn').removeClass('active');
		                mtgStm = null; 
		                mtgEtm = null;
		                return;
		            }
		            
		            // 최종적으로 변수에 저장
		            mtgStm = start;
		            mtgEtm = end;
		            
		            // 범위 표시
		            $('.mtg_btn').each(function() {
		                let btnTime = parseInt($(this).data('time'));
		                if (btnTime >= start && btnTime <= end) {
		                    $(this).addClass('active');
		                }
		            });
				}
			});
	    	
			// 날짜 변경 이벤트
		    $('#mtgDt').on('apply.daterangepicker', function(ev, picker) {
		    	refreshMtgTm();
    		});
			
		 	// 장소 변경 이벤트
		    $(document).on('click', '.select_ul li', function() {
		    	refreshMtgTm();
		    });
	    });
    	
    	// 중복 시간 갱신
	    function refreshMtgTm() {
	        let mtgDt = $('#mtgDt').val();
	        let mtgLoc = $('#mtgLoc').val();
	        let sequenceId = $('#sequenceId').val();

	        if (!mtgDt || !mtgLoc) return;

	        $.ajax({
	            url: "intrMtgInqy1090.do",
	            type: "post",
	            data: {
	                mtgDt: mtgDt,
	                mtgLoc: mtgLoc,
	                sequenceId: sequenceId
	            },
	            dataType: "json",
	            success: function(bookedList) {
	                // 값, 선택 버튼 초기화
	                $('.mtg_btn').removeClass('booked active');
	                mtgStm = null;

	                // 리스트 내 booked 클래스 적용
	                if (bookedList && bookedList.length > 0) {
	                    $('.mtg_btn').each(function() {
	                        let btnTime = $(this).data('time'); // "0900"
	                        let btn = $(this);

	                        $.each(bookedList, function(idx, booked) {
	                            // DB 데이터 형식(booked.mtgStm)에 맞춰 비교
	                            if (btnTime >= booked.mtgStm && btnTime < booked.mtgEtm) {
	                                btn.addClass('booked');
	                            }
	                        });
	                    });
	                }
	            },
	            error: function() {
	            	console.error("[Error] 예약 중복 조회 : ", error.message);
	            }
	        });
	    }
    	
		// 취소
		function detCall() {
			try {
				//
				formSubmit('intrMtgInqy1030.do');
				
			} catch (error) {
		        console.error("[Error] 취소 : ", error.message);
			}
		}
		
		// 수정 처리
		function modProc(f){
			try {
				// 유효성 검증
				if(!requiredProc()){return;};
				//
				if(!mtgStm || !mtgEtm) {
					alert("<spring:message code="MTG.TM.NONE"/>");
			        return;
			    }
				
				// 시작 시간 문자열 변환 (900 -> "0900")
			    let finalStm = mtgStm.toString().padStart(4, '0');

			    // 종료 시간 계산 (선택한 마지막 타임 + 30분)
			    let endCalc = mtgEtm;
			    let hour = Math.floor(endCalc / 100);
			    let min = endCalc % 100;

			    min += 30;
			    if (min >= 60) {
			        hour += 1;
			        min = 0;
			    }
			    
			    // 종료 시간 문자열 변환 (예: 10, 30 -> "1030")
			    let finalEtm = hour.toString().padStart(2, '0') + min.toString().padStart(2, '0');
				//
				if(confirm("수정하시겠습니까?")){
					//
					$('#mtgStm').val(finalStm);
				    $('#mtgEtm').val(finalEtm);
				    //
					var fileList = setFormData();
					// 
		   			$.ajax({
						url:"intrMtgProc1030.do",
						processData : false,
						contentType : false,
						data: fileList,
						type : 'POST',
		   				success : function(data){
		   						var json = eval(data);
		   						
		   						if(json[0].res=='YES'){
		   							alert("<spring:message code="PROC.SUCCESS"/>");
			   						location.href = "intrMtgInqy1010.do?pageUrl=Mtg";
			   						
		   						}else if(json[0].res=='NO'){
		   							alert("<spring:message code="PROC.FAIL"/>");
									return;
									
		   						}else{
		   							alert("<spring:message code="PROC.EXISTS"/>");
									return;	   							
		   						}
		   				},
		   				error : function(res, status, error){
		   					alert("<spring:message code="PROC.ERROR"/>");
		   				}
		   			});
				}
				
			} catch (error) {
		        console.error("[Error] 수정 처리 : ", error.message);
			}
		}	
	</script>
</head>

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
					<div class="sub_content">					
						<div class=" form_area">
							<input type="hidden" id="empIdx" name="empIdx"  value="${empVO.empIdx}">
							<input type="hidden" id="sequenceId" name="sequenceId" value="${defaultInfo.mtgCd}">
							<input type="hidden" id="page" name="page" value="${param.page}">
							<input type="hidden" id="pageUrl" name="pageUrl" value="${param.pageUrl}">
							<input type="hidden" id="srchNm" name="srchNm" value="${param.srchNm}">
							<input type="hidden" id="srchDt" name="srchDt" value="${param.srchDt}">
							<input type="hidden" id="orgNm" name="orgNm" value="${param.orgNm}">
							<input type="hidden" id="rankNm" name="rankNm" value="${param.rankNm}">
							<input type="hidden" id="srchIdx" name="srchIdx" value="${param.srchIdx}">
							<input type="hidden" id="filetypeCd" name="filetypeCd" value="MTG">
							<input type="hidden" id="mtgStm" name="mtgStm" value="">
							<input type="hidden" id="mtgEtm" name="mtgEtm" value="">
								
							<div class="post_wrap">
								<h2>회의 수정</h2>
								<div class="post_view">
									<dl>
										<dt>
											<label for="post-title">&#10003; 회의명</label>
										</dt>
										<dd>
											<input type="text" id="mtgTitle" title="회의명" name="mtgTitle" value="${defaultInfo.mtgTitle}" isRequired="Y">
										</dd>
										<dt>&#10003; 회의 일자</dt>
										<dd>
											<input type="text" class="srch_cdt_date srchSdt" id="mtgDt" name="mtgDt" title="회의 일자" value="${fn:substring(defaultInfo.mtgDt, 0, 4)}-${fn:substring(defaultInfo.mtgDt, 4, 6)}-${fn:substring(defaultInfo.mtgDt, 6, 8)}" readonly="readonly" isRequired="Y" />
										</dd>
										<dt>&#10003; 회의장소</dt>
										<dd class="sel_2part">
                                        	<div class="select_wrap">
												<div id="locList" class="sList select_box">${empty defaultInfo.mtgLocNm ? '' : defaultInfo.mtgLocNm}</div>
												<input type="hidden" id="mtgLoc" name="mtgLoc" value="${defaultInfo.mtgLoc}">
												<input type="hidden" id="mtgLocNm" name="mtgLocNm" value="${defaultInfo.mtgLocNm}">
											
												<ul class="sUl select_ul scroll_wrap">
													<c:forEach var="list" items="${locList}">
														<c:if test="${list.commcodeCd != null and  list.commcodeCd != ''}">
															<li setNm="${list.commcodeNm}" setCd="${list.commcodeCd}">${list.commcodeNm}</li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
                                        </dd>
									</dl>
									<dl>
										<dt>&#10003; 회의시간</dt>
										<dd>
											<div class="disp_flex fw_wrap gap10">
												<c:forEach var="mtgTm" begin="540" end="1080" step="30">
												    <c:set var="hour" value="${(mtgTm / 60) - ((mtgTm / 60) % 1)}" />
												    <c:set var="minute" value="${mtgTm % 60}" />
												    <fmt:formatNumber value="${hour}" pattern="00" var="hStr" />
												    <fmt:formatNumber value="${minute}" pattern="00" var="mStr" />
												    
												    <%-- 현재 루프의 시간 문자열 (예: 0900) --%>
												    <c:set var="currTimeStr" value="${hStr}${mStr}" />
												    <c:set var="isBooked" value="false" />
												
												    <%-- DB에서 가져온 예약 리스트와 비교 --%>
												    <c:forEach var="booked" items="${bookedList}">
												        <%-- 현재 시간이 시작시간(mtgStm)과 종료시간(mtgEtm) 사이에 있는지 확인 --%>
												        <c:if test="${currTimeStr >= booked.mtgStm && currTimeStr < booked.mtgEtm}">
												            <c:set var="isBooked" value="true" />
												        </c:if>
												    </c:forEach>
												
												    <%-- 결과에 따라 클래스 부여 --%>
												    <a href="javascript:void(0);" class="mtg_btn ${isBooked ? 'booked' : ''}" data-time="${currTimeStr}"> ${hStr}:${mStr}</a>
												</c:forEach>
											</div>
										</dd>
									</dl>
									<dl>
										<dt><label for="post_text">&#10003; 회의 개요</label></dt>
										<dd class="post_text h310p">
											<textarea id="projCont" title="회의 개요" name="mtgCont" isRequired="Y">${defaultInfo.mtgCont}</textarea>
										</dd>
									</dl>
									<dl class="post_info">
										<dt>회의자료</dt>
										<dd>
											<div class="file_box">
												<label for="fileUpd">업로드</label>
												<h4 class="file_text">업로드할 파일을 선택해주세요.</h4>
												<input type="file" id="fileUpd" name="fileUpd" class="btn_blue" multiple="multiple">
											</div>
										</dd>
									</dl>
									<dl class="post_info">
										<dt></dt>
										<dd class="post_file">
											<div class="file_wrap">
												<!-- 파일 목록 -->
												<c:import url="/WEB-INF/views/intr/comm/include/intr_include_1040.jsp">
													<c:param name="fileNm"></c:param>
												</c:import>
											</div>
										</dd>
									</dl>
								</div><!-- End post_write -->
								<div class="btn_wrap align_right">
									<c:if test="${empVO.empIdx eq defaultInfo.mtgIdx}">
										<button type="button" class="btn_navy_thin" onclick="modProc(this.form);">수정완료</button>
										<button type="button" class="btn_gray_thin" onclick="detCall();">취소</button>
									</c:if>
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