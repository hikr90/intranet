<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<header>
	<div class="wrap mh_100p">
		<div class="header_wrap">
			<div class="header_state">
				<ul class="header_list">
					<li>
						<a href="javascript:void(0);" onclick="orgCall();"><img src='resources/images/icon/icon_org.png' width="30" height="30" title="조직도 이동" /></a>
					</li>
					<li>
						<a href="javascript:void(0);" onclick="userCall();"><img src='resources/images/icon/icon_user.png' width="35" height="35" title="사용자 이동" /></a>
					</li>
					<c:if test="${empVO.roleYn eq 'Y'}">
						<li>
							<a href="javascript:void(0);" onclick="adminCall();"><img src='resources/images/icon/icon_admin.png' width="35" height="35" title="관리자 이동" /></a>
						</li>
					</c:if>
					<li>
						<a href="javascript:void(0);" onclick="logoutProc();"><img src='resources/images/icon/icon_logout.png' width="32" height="32" title="로그아웃" /></a>
					</li>
				</ul><br><br>
				
				<span class="fs_14">
					<a href="intrMainInqy1040.do?menuType=${menuType}&empIdx=${empVO.empIdx}">
						<strong>환영합니다, ${empVO.empNm}님</strong>
					</a> 
				</span>
			</div>
		</div>
			
		<div class="menu_wrap">
			<div class="logo">
				<img class="logo cursor" src="${pageContext.request.contextPath }/resources/images/icon/icon_logo.png" onclick="location.href='${menuType eq '0' ? 'intrMainInqy1020.do' : 'intrMainInqy1030.do'}'">
			</div>
			
			<nav class="nav">
				<ul class="ul_1">
					<c:forEach var="list" items="${menuList}" varStatus="status">
						<c:if test="${list.lv eq 1}">
							<li class="li_1">
								<a class="a_1" onclick="goMenu(this);"
								   data-mapping-id="${list.mappingId}"
								   data-menu-pos="top"
								   data-menu-cd="${list.menuCd}"
								   data-lead-menu-cd="${list.leadMenuCd}"
								   data-emp-idx="${empVO.empIdx}">${list.menuNm}
								</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</nav>
		</div>
	</div>
</header>

<script>
	// 조직도 조회 팝업
	function orgCall(){
		try {
			//
			var obj = new Object();
			
			obj["mappingId"] = "intrPopupInqy1101.do";
			obj["areaType"] = "org";
			obj["width"] = "700";
			obj["height"] = "550";
			//		
			ajaxPopup(obj);
			
		} catch (error) {
	        console.error("[Error] 조직도 조회 팝업 : ", error.message);
		}
	}
</script>

<!-- 조직도 팝업 -->
<div id="orgArea" class="popupArea hidden">
	<c:import url="/WEB-INF/views/intr/comm/popup/intr_popup_inqy_1100.jsp"></c:import>	
</div>