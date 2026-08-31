<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 결재선 트리 -->
<script>
	$(document).ready(function(){
		// 페이지 로드 후 탭 오버플로우 체크
	    isTabOverlow();
	    
	    // 윈도우 크기가 변경될 때도 체크 (반응형 대응)
	    $(window).resize(function() {
	    	isTabOverlow();
	    });
		
		// 결재선 UI 초기화
		AprvLineUI.init();
	});
	
	// 결재선 선택
	$(document).on('click','.a_btn',function() {
		$(".a_btn").each(function() {
			$(this).removeClass('list_bg');
		});
		$(this).addClass('list_bg');
	});	
	
	// 결재선 초기화
	function initAprvLine(){
		try {
			// 목록 추가	
			var cIdx = $("input[name=radioIdx]:checked");
			var obj = new Object();
			
			if(cIdx.length==0){
				alert("<spring:message code="CHECK.NONE"/>");
				return;
			}
			
			// 결재선 정보
			obj['aprvIdx']	 = cIdx.val();							// 사번
			obj['empNm'] 	= cIdx.attr('empNm');			// 이름
			obj['orgNm'] 	= cIdx.attr('orgNm');			// 부서
			obj['rankNm'] 	= cIdx.attr('rankNm');			// 직급
			obj['aprvNm'] 	= '';										// 유형
			
			// 목록 생성
			addLine(obj);
			
		} catch (error) {
	        console.error("[Error] 결재선 초기화 : ", error.message);
		}
	}

	// 결재선 생성
	function addLine(obj){
		try {
			// 결재선 배열 생성
			var str = "";
			var arrLine = [
		    <c:forEach var="list" items="${typeList}" varStatus="status">
		    	<c:if test="${status.index > 1}">
			      {
			        name: '${list.commcodeNm}',
			        code: '${list.commcodeCd}'
			      }<c:if test="${!status.last}">,</c:if>
		      	</c:if>
		    </c:forEach>
		 	];
			
			str += "<tr class='setListTr' empIdx='" + obj["aprvIdx"] + "'>"
			str += "		<td>" + obj["orgNm"] + "</td>";
			str += "		<td>" + obj["empNm"] + " " + obj["rankNm"] + "</td>";
			str += "		<td style='padding: 0;'>";
			//
			str += "  		<div class='select_wrap'>";
			str += "    			<div class='pop_sbox' style='width:126px; border:unset; text-indent:0px;'>" + obj["aprvNm"] + "</div>";
			str += "    			<input type='hidden' id='aprvtypeCd' name='aprvtypeCd' name='aprvtypeCd' value='" + obj["aprvtypeCd"] + "'>";
			str += "    			<input type='hidden' id='aprvIdx' name='aprvIdx' name='aprvIdx' value='" + obj["aprvIdx"] + "'>";
			str += "				";
			str += "    			<ul class='sUl pop_sul scroll_wrap' style='width:126.5px; margin-left: -1px;'>";
			
			// 반복문 동작
			arrLine.forEach(item => {
			  str += "      			<li setNm='"+item.name+"' setCd='"+item.code+"' setIdx='" + obj["aprvIdx"] + "'>" + item.name + "</li>";
			});
			//
			str += "    			</ul>";
			str += "  		</div>";
			str += "		</td>";
			str += "		<td><div id='divArea' onclick=\"delCall(this);\"><a>삭제</a></div></td>";
			str += "</tr>";
			//
			$(".aprvTbl").append(str);
			
		} catch (error) {
	        console.error("[Error] 결재선 생성 : ", error.message);
		}
	}
	
	// 화면 상 제거
	function delCall(t){
		try {
			//
			$(t).closest("tr").remove();
			
		} catch (error) {
	        console.error("[Error] 화면 상 제거 : ", error.message);
		}
	}
	
	// 결재선 상세
	function detCall(aprvlineId){
		try {
			//
			$.ajax({
	    		type : 'post',
	        	url : 'intrPopupInqy1043.do',
	            data : {
	            	'aprvlineId':aprvlineId
	            },
	            dataType : 'html',
	            success : function(data){
	            	    $("#aprvlineTb").html(data);
	            },
	            error : function(data){
					alert("<spring:message code="PROC.ERROR"/>");
	            }
	      	});
			
		} catch (error) {
	        console.error("[Error] 결재선 상세 : ", error.message);
		}
	}
</script>

<div id="custom" class="inline_flex">
	<!-- 부서 사용자 트리 -->
	<div class="tree_wrap">
		<div class="tree_area" id="tree_area" class="w300p h445p"> 
			<div class="tree">
				<ul class="ul_1">
												
				<c:forEach var="list" items="${empList}" varStatus="status">
					<c:set var="spanIcon"	value="icon_folder"/>
					<c:set var="spanNm"	value="${list.orgNm}"/>
	
					<c:set var="nextLv"	value=""/>
					<c:set var="prevLv"	value=""/>
													
					<c:if test="${list.isleaf eq 'Y'}">
						<c:set var="spanIcon" 	value="icon_list"/> 
						<c:set var="spanNm"	value="${list.empNm}"/>
					</c:if>
													
					<c:if test="${empty list.lv }">
						<c:set var="nextLv"	value="1"/>
					</c:if>
														
					<!-- 태그 열기 -->
					<c:choose>
						<c:when test="${list.lv gt prevLv}">
							<ul class="ul_${list.lv}">
								<li class="li_${list.lv}">
								<span class="${spanIcon}"></span>
								<c:if test="${list.isleaf eq 'Y'}">
									<input type="radio" id="radio${status.index}" name="radioIdx" value="${list.empIdx}" orgNm="${list.orgNm}" empNm="${list.empNm}" rankNm="${list.rankNm}">
								</c:if>
								<label for="radio${status.index}">${spanNm}</label>
						</c:when>
						<c:when test="${list.lv eq prevLv}">
							<c:if test="${list.isleaf eq 'Y'}">
								<input type="radio" id="radio${status.index}" name="radioIdx" value="${list.empIdx}" orgNm="${list.orgNm}" empNm="${list.empNm}" rankNm="${list.rankNm}">
							</c:if>
							<label for="radio${status.index}">${spanNm}</label>
						</c:when>
					</c:choose>
			
					<!-- 태그 닫기 -->										
					<c:choose>
						<c:when test="${list.lv gt nextLv}">
							</li>
																
							<c:forEach begin="1" end="${list.lv - nextLv}" varStatus="status">
								<c:if test="${list.lv ne '1'}">
										</ul>
									</li>
								</c:if>
							</c:forEach>
																
						</c:when>
						<c:when test="${list.lv eq nextLv}">
							</li>
						</c:when>
					</c:choose>
															
					<c:set var="prevLv" value="${list.lv}" />
				</c:forEach>
			</div>	
		</div>
	</div>
	
	<!-- 이동 화살표 -->
	<div id="treeArrow" class="tree_arrow" onclick="initAprvLine();"></div>
	
	<!-- 결재선 목록 -->
	<div id="tree_info" class="tree_info b_f6f6f6 pd10 w640p h425p">
		<div class="post_wrap">
			<div class="scroll_wrap h410p">
				<table class="post_table aprvTbl">
					<caption>결재선 목록</caption>
					<colgroup>
						<col class="w30per">
						<col class="w35per">
						<col class="w20per">
						<col class="w15per">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">부서</th>
							<th scope="col">이름</th>
							<th scope="col">결재유형</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<!-- 결재선 추가 -->
						<tr class="setListTr" empIdx="${empVO.empIdx}">
							<td>${empVO.orgNm}</td>
							<td>${empVO.empNm} ${empVO.rankNm}</td>
							<td>기안
								<input type="hidden" id="aprvtypeCd" name="aprvtypeCd" value="TYPE_0010">
								<input type="hidden" id="aprvNm" name="aprvNm" value="기안">
								<input type="hidden" id="aprvIdx" name="aprvIdx" value="${empVO.empIdx}">
								<input type="hidden" id="orgNm" name="orgNm" value="${empVO.orgNm}">
								<input type="hidden" id="rankNm" name="rankNm" value="${empVO.rankNm}">
								<input type="hidden" id="empNm" name="empNm" value="${empVO.empNm}">
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div><!-- End post_wrap -->
	</div>
</div>

<div id="selected" class="tree_wrap" style="display: none;">
	<div id="treeArea" class="tree_area w350p h445p">
		<div id="lineTree" class="tree">
			<c:if test="${not empty defaultList}">
				<ul class="ul_1">
					<c:forEach var="list" items="${defaultList}" varStatus="status">
       					<c:set var="spanIcon" 	value="icon_list"/> 

						<li class="li_1 ml15">
							<span class="${spanIcon}"></span>
							<a class="a_btn" id="${list.aprvlineId}" href="javascript:void(0);" onclick="detCall('${list.aprvlineId}');">${list.aprvlineNm}</a>
						</li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${empty defaultList}">
				<ul class="ul_1">
					<li class="li_1 ml15">
						등록된 결재선이 없습니다.
					</li>
				</ul>
			</c:if>
		</div>	
	</div>
	
	<!-- 사용자 목록 -->
	<div id="aprvlineTb" class="tree_info ml25 pd10 b_f6f6f6 w640p h425p"></div>
</div>