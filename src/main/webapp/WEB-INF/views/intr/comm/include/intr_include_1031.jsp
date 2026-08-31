<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="post_table">
	<caption>좌측 메뉴 조회</caption>
	<tbody>
    	<c:forEach var="list" items="${leftList}">
			<c:if test="${list.menuCd eq setUpprMenu or list.upprMenuCd eq setUpprMenu}">
				<tr>
					<td class="text_left border_none">
						<c:choose> 
							<c:when test="${list.lv eq '1'}">
								<span class="a_title bold fs_16 c_214b97">${list.menuNm}</span>
							</c:when>
							<c:otherwise>
								<c:forEach begin="0" end="1">
									&nbsp;
								</c:forEach>
									<img class="mr5" src='resources/images/icon/icon_tree_arrow.png' width="13" height="13" />
									<a class="a_title fs_16 cursor c_000000 ${setMenu eq list.menuCd ? 'list_bg' : ''}" onclick="goMenu(this);"
									   data-mapping-id="${list.mappingId}"
									   data-menu-cd="${list.menuCd}"
									   data-lead-menu-cd="${list.leadMenuCd}"
									   data-menu-pos="left"
									   data-emp-idx="${empVO.empIdx}">${list.menuNm}
									</a>
							</c:otherwise>
						</c:choose>
					</td>
	            </tr>
            </c:if>
       	</c:forEach>
	</tbody>
</table>
