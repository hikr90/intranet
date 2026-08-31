<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 
	view : intr_btn_inqy_1010
	title : 결재 버튼 조회
-->
<input type="hidden" id="rslttypeCd" name="rslttypeCd" value="">

<!-- 결재 취소
		- 첫번째 결재에 해당하는 RSLTTYPE_CD의 값이 비어있는 경우
		- 기안자와 접속 유저가 같은 경우
-->
<c:if test="${empty aprvInfo.rslttypeCd and aprvInfo.regIdx eq empVO.empIdx}">
	<button type="button" class="btn_navy_thin" onclick="cnlProc('RSLT_0030');">결재 취소</button>
</c:if>

<!-- 결재 승인 & 반송
		- 현재 결재 단계의 RSLTTYPE_CD의 값이 비어있는 경우
		- 기안자와 접속 유저가 같지 않은 경우
		- 결재 유형이 결재인 경우
-->
<c:if test="${defaultInfo.aprvstepCd eq 'STEP_0010' and defaultInfo.aprvtypeCd eq 'TYPE_0020' and defaultInfo.aprvIdx eq empVO.empIdx}">
	<button type="button" class="btn_blue_thin" onclick="opinCall('RSLT_0010');">승인</button>
	<button type="button" class="btn_gray_thin" onclick="opinCall('RSLT_0020');">반송</button>
</c:if>
