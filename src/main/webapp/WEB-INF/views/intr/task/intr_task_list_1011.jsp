<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:forEach var="list" items="${defaultList}" varStatus="status"> 
	<div class="taskArea">
		<div>
			<input type="button" class="btn_gray_thin" value="행 삭제" onclick="removeCall(this);">
		</div>
		
		<div class="post_view">
			<dl>
				<dt>&#10003; 업무 제목</dt>
				<dd>
					<input type="text" class="taskTitle" title="업무 제목" value="${list.taskTitle}" isRequired="Y">
				</dd>
				<dt>등록 일자</dt>
				<dd>
					<fmt:parseDate value="${list.taskDt}" var="parseDt" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
					${fomatDt}
				</dd>
			</dl>
			<dl class="post_info">
				<dt>&#10003; 업무 시간</dt>
				<dd>
					<input type="text" class="width20 taskHh" title="업무(시간)" value="${list.taskHh}" placeholder="HH" oninput="numProc(this);" isRequired="Y">
					<input type="text" class="width20 taskMm" title="업무(분)" value="${list.taskMm}" placeholder="MM" oninput="numProc(this);" isRequired="Y">
				</dd>
				<dt>등록자</dt>
				<dd>${empVO.orgNm} ${empVO.empNm}</dd>
			</dl>
			
			<dl>
				<dt>&#10003; 업무 내용</dt>
				<dd class="post_text h300p">
					<textarea class="taskCont" title="업무 내용" isRequired="Y">${list.taskCont}</textarea>
				</dd>
			</dl>
		</div>
	</div>
</c:forEach>
