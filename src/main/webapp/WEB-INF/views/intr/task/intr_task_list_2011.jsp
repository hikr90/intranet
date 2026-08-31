<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<script type="text/javascript">
	// 업무 상세 조회
	function detCall(taskId){
		try {
			//
			$("#taskId").val(taskId);
			formSubmit("intrTaskInqy2030.do");
			
		} catch (error) {
	        console.error("[Error] 업무 상세 조회 : ", error.message);
		}
	}
</script>
<input type="hidden" id="taskId" name="taskId" value="" >	

<table class="post_table">
	<caption>업무일지 조회</caption>
	<colgroup>
		<col class="w5per">
		<col class="auto">
		<col class="w10per">
		<col class="w10per">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">+/-</th>
			<th scope="col">업무 제목</th>
			<th scope="col">등록 시간</th>
			<th scope="col">등록자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${defaultList}" varStatus="status"> 
        	<c:set var="none" value="none${status.index}" />
			<tr id="${list.rowNum eq 1 ? list.taskId : none}" class="${list.rowNum eq 1 ? '' : list.taskId} ${list.rowNum eq 1 ? 'show' : 'hide'}" spreadType="${list.rowNum eq 1 ? 'Y' : 'N'}">
		        <c:if test="${list.rowNum eq 1}">
		            <td rowspan="${list.rowCnt}">
		                <a class="spread" onclick="spreadProc('${list.taskId}');">+</a>
		            </td>
		        </c:if>

		        <td class="_title">
    		        <a href="javascript:void(0);" class="show_view a_title c_214b97" onclick="detCall('${list.taskId}');">${list.taskTitle}</a>
    		    </td>

		        <c:if test="${list.rowNum eq 1}">
		            <td rowspan="${list.rowCnt}">
		                <span class="date">
		                    <fmt:parseDate value="${list.taskDt}" var="parseDt" pattern="yyyyMMdd"/>
		                    <fmt:formatDate value="${parseDt}" var="formatDt" pattern="yyyy-MM-dd"/>
		                
		                    ${formatDt}
		                </span>
		            </td>
		            <td rowspan="${list.rowCnt}">${list.orgNm} ${list.empNm}</td>
		        </c:if>
		</tr>
	</c:forEach>

		<!-- 글이 없는 경우 -->
		<c:if test="${empty defaultList}">
	    	<tr>
				<td align="center" colspan="4">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
</table>

<c:if test="${not empty defaultList}">
	<div class="paging_area">
		<div class="list_cnt">총 건수 : ${defaultList[0].listCnt}건</div>
			<ul class="paging">
				<li class="">${pageMenu}</li>
			</ul>
	</div><!-- End paging_wrap -->
</c:if>
