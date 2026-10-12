<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:forEach var="list" items="${defaultList}" varStatus="status"> 
	<div class="taskArea">
		<div>
            <input type="button" class="btn_gray_thin btn_action action_compact" value="행 삭제" onclick="removeCall(this);">
		</div>
		
        <div class="post_view form_panel">
            <dl class="form_row">
                <dt class="form_label">&#10003; 업무 제목</dt>
                <dd class="form_value">
                    <input type="text" class="taskTitle form_input" title="업무 제목" value="${list.taskTitle}" isRequired="Y">
				</dd>
                <dt class="form_label">등록 일자</dt>
                <dd class="form_value">
					<fmt:parseDate value="${list.taskDt}" var="parseDt" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${parseDt}" var="fomatDt" pattern="yyyy-MM-dd"/>
					${fomatDt}
				</dd>
			</dl>
            <dl class="post_info form_row">
                <dt class="form_label">&#10003; 업무 시간</dt>
                <dd class="form_value">
                    <input type="text" class="w20per taskHh form_input" title="업무(시간)" value="${list.taskHh}" placeholder="HH" oninput="numProc(this);" isRequired="Y">
                    <input type="text" class="w20per taskMm form_input" title="업무(분)" value="${list.taskMm}" placeholder="MM" oninput="numProc(this);" isRequired="Y">
				</dd>
                <dt class="form_label">등록자</dt>
                <dd class="form_value">${empVO.orgNm} ${empVO.empNm}</dd>
			</dl>
			
            <dl class="form_row">
                <dt class="form_label">&#10003; 업무 내용</dt>
                <dd class="post_text form_value form_content form_content_short">
                    <textarea class="taskCont form_textarea" title="업무 내용" isRequired="Y">${list.taskCont}</textarea>
				</dd>
			</dl>
		</div>
	</div>
</c:forEach>
