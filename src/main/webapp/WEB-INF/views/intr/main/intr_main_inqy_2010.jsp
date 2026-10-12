<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1010.jsp" %>

<!DOCTYPE html>
<html>
<head></head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<body id="main">
<form id="form" name="form" method="POST" onsubmit="return false;">
	<!-- 메뉴 -->
	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1030.jsp" %>

	<div class="top_wrap">
		<div class="top_area">
			<article class="main_article">
				<div class="content">
					<div class="top_box">
						<div class="wrap dashboard_canvas">
                            <div class="top_wrap dashboard_row department_dashboard">
								<!-- 부서 현황 -->	
                                <div class="top_area dashboard_card dashboard_primary dashboard_featured">
									<div class="area_title">
                                        <h3 class="dashboard_heading">
											<img src='resources/images/icon/icon_people.png' width="20" height="20"/>
											부서 현황
										</h3>
									</div>
									
									<div class="area_content ml30">
										<canvas id="myChart" width="900" height="300"></canvas>
										<script>
										var json = ${orgList};
										var labels = json.map(d => d.orgNm);
										var values = json.map(d => d.orgCnt);
										//
										var ctx = document.getElementById('myChart');
											new Chart(ctx, {
											  type: 'line',
											  data: {
											  		labels: labels,
											        datasets: [{
											        	label: '사원 수',
											            data: values,
											            borderColor: '#214b97', 
											            backgroundColor: '#f3f6f8',
											            fill: true,
											        	tension: 0.3
											  		}]
											  },
											  options: {
												    plugins: {
												      legend: { display: true },   // 범례
												      tooltip: { enabled: true }   // 툴팁
												    },
												    scales: {
												        y: {
												          ticks: {
												            maxTicksLimit: 5,		// 눈금 수
												            stepSize: 10   			// 눈금 간격
												          }
												        }
												      }
											  }
											});
										</script>
									</div>
								</div>
								<!-- 부서 현황 -->	
								
								<!-- 권한 부여 현황 -->	
                                <div class="top_area dashboard_card dashboard_primary">
									<div class="area_title">
                                        <h3 class="dashboard_heading">
							    			<img src='resources/images/icon/icon_warn.png' width="20" height="20"/>
							    			권한 부여 현황
                                        </h3><a href="intrRoleInqy3010.do" class="dashboard_heading_action">전체보기</a>
									</div>

									<div class="area_content">
										<div class="post_table_wrap scroll_wrap">
											<table class="post_table permission_table">
												<caption>로그인 권한 목록 조회</caption>
												<colgroup>
													<col class="auto">
													<col class="w70per">
												</colgroup>
												<thead>
													<tr>
                                                        <th class="table_header" scope="col">권한</th>
                                                        <th class="table_header" scope="col">소유자</th>
													</tr>
												</thead>
												<tbody>
					                                <c:if test="${not empty roleList}">
						                                <c:forEach var="list1" items="${roleList}" varStatus="status1">
															<c:if test="${list1.roleCd ne roleList[status1.index + 1].roleCd}">
																<tr>
                                                                    <td class="align_center table_cell">${list1.roleNm}</td>
                                                                    <td class="title align_left table_cell">
																		<c:forEach var="list2" items="${roleList}" varStatus="status2">
																			<c:if test="${list1.roleCd eq list2.roleCd}">
																				<span class="c_214b97">${list2.empNm}</span>
																				&nbsp;
																			</c:if>
																		</c:forEach>
																	</td>
																</tr>					                                
					                                		</c:if>
					                                	</c:forEach>
													</c:if>
													<c:if test="${empty roleList}">
														<tr>
                                                            <td class="align_center table_cell" colspan="2">권한 소유자가 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- 권한 부여 현황 -->	
							</div>
						</div><!-- End wrap -->
					</div><!-- End widget_box -->
				</div><!-- End content -->
			</article>
		</div>
	</div>

	<div class="bottom_wrap">
		<div class="bottom_area">
			<article class="main_article">
				<div class="content">
					<div class="bottom_box">
						<div class="wrap dashboard_canvas">
                            <div class="bottom_wrap dashboard_row">
								<!-- 입사 현황 -->
                                <div class="bottom_area dashboard_card dashboard_secondary">
							    	<div class="area_title">
                                        <h3 class="dashboard_heading">
											<img src='resources/images/icon/icon_temp.png' width="20" height="20"/>
											입사 현황 (${empList[0].currYear}년)
                                        </h3><a href="intrEmpInqy4010.do" class="dashboard_heading_action">전체보기</a>
									</div>
									
									<div class="area_content">
										<table class="post_table mt10">
											<caption>입사 현황</caption>
											<colgroup>
												<col class="auto">
												<col class="auto">
												<col class="auto">
											</colgroup>
											<thead>
												<tr>
                                                    <th class="table_header" scope="col">신규</th>
                                                    <th class="table_header" scope="col">퇴사</th>
                                                    <th class="table_header" scope="col">재직</th>
												</tr>
											</thead>
											<tbody>
												<tr>
                                                    <td class="align_center c_ff0000 table_cell">${empList[0].newCnt}</td>
                                                    <td class="align_center c_0000ff table_cell">${empList[0].leavCnt}</td>
                                                    <td class="align_center table_cell">${empList[0].empCnt}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- 입사 현황 -->
								
								<!-- 프로젝트 관리 -->
                                <div class="bottom_area dashboard_card dashboard_secondary">
						    		<div class="area_title">
                                        <h3 class="dashboard_heading">
											<img src='resources/images/icon/icon_question.png' width="20" height="20"/>
											프로젝트 관리
                                        </h3><a href="intrProjInqy1010.do?pageUrl=Proj" class="dashboard_heading_action">전체보기</a>
									</div>
									
									<div class="area_content">
                                        <ul class="dashboard_feed">
											<c:forEach var="list" items="${projList}" begin="0" end="2">
                                                <li class="pl20 dashboard_item">
                                                    <a class="dashboard_link" href="intrProjInqy1030.do?sequenceId=${list.projCd}&pageUrl=Proj">${list.projTitle}</a>
													<span class="dashboard_date">${list.orgNm} ${list.ownerNm}</span>
												</li>
											</c:forEach>
											
											<c:if test="${empty projList}">
                                                <li class="pl20 dashboard_item">
													등록된 프로젝트가 없습니다.
												</li>												
											</c:if>
										</ul>
									</div>
								</div>
								<!-- 프로젝트 관리 -->
								
								<!-- 참고 문서 -->
                                <div class="bottom_area dashboard_card dashboard_secondary">
						    		<div class="area_title">
                                        <h3 class="dashboard_heading">
							    			<img src='resources/images/icon/icon_set.png' width="20" height="20"/>
							    			참고 문서
							    		</h3>
									</div>

									<div class="area_content">
                                        <ul class="reference_list">
                                            <li class="reference_item">
                                                <a class="dashboard_link" href="javascript:void(0);" onclick="docDown('excel')">
													<img src='resources/images/manual/manual_excel.png' width="100" height="100"/>
													<span class="reference_label">기초 데이터</span>
												</a>
											</li>
                                            <li class="reference_item">
                                                <a class="dashboard_link" href="javascript:void(0);" onclick="docDown('word')">
													<img src='resources/images/manual/manual_word.png' width="100" height="100"/>
													<span class="reference_label">테이블 설계서</span>
												</a>
											</li>
                                            <li class="reference_item">
                                                <a class="dashboard_link" href="javascript:void(0);" onclick="docDown('ppt')">
													<img src='resources/images/manual/manual_ppt.png' width="100" height="100"/>
													<span class="reference_label">포트폴리오</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<!-- 참고 문서 -->
							</div>
						</div>
					</div>
				</div><!-- End content -->
			</article>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/intr/comm/include/intr_include_1020.jsp" %>
</form>	
</body>
</html>
    