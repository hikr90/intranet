package com.intr.utils;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.intr.svc.LogService;
import com.intr.vo.EmpVO;

public class Interceptor implements HandlerInterceptor {
	//
	@Autowired
	LogService logService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 요청 URI
		String requestURI = request.getRequestURI().substring(request.getContextPath().length());

		//  세션 체크 제외
		if (isExcludeUri(requestURI)) {
			// Controller 동작
	        return true; 
        }
		
		// 세션 체크
		HttpSession session = request.getSession();
		EmpVO loginInfo = (EmpVO)session.getAttribute("empVO");
		
		if (loginInfo == null) {
            session.setAttribute("alertMsg", "세션 정보가 존재하지 않습니다.");
            response.sendRedirect(request.getContextPath() + "/intrMainInqy1010.do");
            return false;
        }
		
        // Controller 동작
        return true;
    }
	
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //
    }
	
	@Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception) throws Exception {
		//
		try {
			// 세션 확인
			HttpSession session = request.getSession(false);
			EmpVO loginInfo = null;
	        if (session != null) loginInfo = (EmpVO) session.getAttribute("empVO");
	
			String mappingId = request.getRequestURI().substring(request.getContextPath().length());					// 요청 URI
			String logtypeCd = mappingId.contains(Const.LOG_PROC) ? Const.LOG_PROC : Const.LOG_INQY;		// 처리 구분
			String ipAddr = request.getRemoteAddr();																							// 요청자 IP
			String empIdx = (loginInfo == null) ? "" : loginInfo.getEmpIdx();														// 요청자 IDX
			String isSucc = (exception == null) ? Const.LOG_SUCC : Const.LOG_FAIL;										// 성공 여부
			String logMsg = (exception == null) ? "" : exception.toString();															// 오류 메세지
			
			// 리소스 요청 혹은 정상인 경우 로그 미 등록
			if (isExcludeUri(mappingId)
				|| exception == null) {
	            return;
	        }
			//
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("mappingId", mappingId);
			paramMap.put("logtypeCd", logtypeCd);
			paramMap.put("empIdx", empIdx);
			paramMap.put("ipAddr", ipAddr);
			paramMap.put("isSucc", isSucc);
			paramMap.put("logMsg", logMsg);
	
			//--------------------------------------------------------------------------------------------
			// 로그 등록
			//--------------------------------------------------------------------------------------------
			logService.logProcService1010(null, paramMap);
			
		} catch (Exception e) {
			logger.debug("Exception : 접속 로그 저장 중 에러가 발생했습니다. (" + e.getMessage() + ")");
	    }
    }
	
	//  세션 체크 제외
	private boolean isExcludeUri(String requestURI) {
	    return requestURI.equals("/")
	        || requestURI.equals("/intrMainInqy1010.do")
	        || requestURI.equals("/intrMainProc1010.do")
	        || requestURI.equals("/intrPopupInqy1021.do")
	        || requestURI.equals("/intrPopupInqy1022.do")
	        || requestURI.equals("/sendMail.do")
	        || requestURI.equals("/intrPopupInqy1023.do")
	        || requestURI.equals("/intrEmpProc1050.do")
	        || requestURI.startsWith("/resources/")
	        || requestURI.startsWith("/error/")
	        || requestURI.startsWith("/ckeditor/");
	}
}
