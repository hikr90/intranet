<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>

<!-- 프로젝트 트리 -->
<div class="scroll_wrap">
	<div class="pop_tree">
		<div class="tree">
			<c:forEach var="list" items="${projList}" varStatus="status">
				<c:set var="spanIcon"	value="icon_folder"/>
				
				<li class="li_">
					<input type="radio" id="projPcd${status.index}" class="projPcd" name="projPcd" value="${list.projCd}" projPnm="${list.projTitle}" projPcd="${list.projCd}" >
					<span class="${spanIcon}"></span>
					<label for="projPcd${status.index}">${list.projTitle}</label>
				</li>
			</c:forEach>
			</ul>
		</div>	
	</div>
</div>