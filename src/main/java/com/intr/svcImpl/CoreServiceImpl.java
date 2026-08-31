package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.intr.dao.CoreDao;
import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.UtilService;
import com.intr.vo.EmpVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class CoreServiceImpl implements CoreService{
	//
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	UtilService utilService;
	
	@Autowired
	CoreDao coreDao;
	
	@Autowired
	UtilDao utilDao;
	
	// 메뉴 조회
	public void coreInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> tempMap = null;
		List<HashMap<String, Object>> defaultList = null;
		EmpVO empInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 정보 세션 조회
			//--------------------------------------------------------------------------------------------
			HttpSession session = request.getSession();
			String menuType = (String)session.getAttribute("menuType");
			String menuCd = (String)paramMap.get("menuCd");
			String leadMenuCd = (String)paramMap.get("leadMenuCd");
			String menuPos = "";

			// 사용자, 관리자 구분
			if(menuType!=null) {
				paramMap.put("menuType", menuType);
			}
			
			// 상단, 좌측 구분
			menuPos =  utilService.nvlProc((String)paramMap.get("menuPos"));
			if(menuPos.equals("top")) {
				session.setAttribute("setUpprMenu", menuCd);
				session.setAttribute("setMenu", leadMenuCd);
			} else {
				//
				if(!utilService.isNull(menuCd)) {
					session.setAttribute("setMenu", menuCd);
				}
			}

			//--------------------------------------------------------------------------------------------
			// 로그인 정보 세션 조회
			//--------------------------------------------------------------------------------------------
			empInfo = (EmpVO)session.getAttribute("empVO");
			if(empInfo!=null) {
				paramMap.put("idxSet", empInfo.getEmpIdx());
			}
			
			//--------------------------------------------------------------------------------------------
			// 상단 메뉴 조회
			//--------------------------------------------------------------------------------------------
			tempMap = new HashMap<String, Object>();
			tempMap.put("idxSet", utilService.nvlProc((String)paramMap.get("idxSet")));
			tempMap.put("menuType", utilService.nvlProc((String)paramMap.get("menuType")));
			//
			defaultList = coreDao.coreInqyDao1010(tempMap);
			model.addAttribute("menuList", defaultList);

			//--------------------------------------------------------------------------------------------
			// 좌측 메뉴 조회
			//--------------------------------------------------------------------------------------------
			tempMap = new HashMap<String, Object>();
			tempMap.put("menuCd", utilService.nvlProc((String)paramMap.get("menuCd")));
			tempMap.put("idxSet", utilService.nvlProc((String)paramMap.get("idxSet")));
			tempMap.put("menuType", utilService.nvlProc((String)paramMap.get("menuType")));
			//
			defaultList = coreDao.coreInqyDao1010(tempMap);
			model.addAttribute("leftList", defaultList);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 전체 메뉴 조회
	public void coreInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 전체 메뉴 조회
			//--------------------------------------------------------------------------------------------
			defaultList = coreDao.coreInqyDao1020(paramMap);
			model.addAttribute("tMenuList", defaultList);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 메뉴 세션 저장
	public void coreInqyService1030(String menuType) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 세션 저장
			// 	- 0 : 사용자
			//		- 1 : 관리자
			//--------------------------------------------------------------------------------------------
			HttpSession session = request.getSession();
			session.setAttribute("menuType", menuType);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
}
