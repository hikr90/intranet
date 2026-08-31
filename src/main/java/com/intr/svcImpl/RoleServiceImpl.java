package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.intr.dao.RoleDao;
import com.intr.svc.RoleService;
import com.intr.svc.MainService;

@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl implements RoleService{
	//
	@Autowired
	RoleDao roleDao;
	
	@Autowired
	MainService mainService;
	
	// 권한 목록 조회
	public void roleInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = roleDao.roleInqyDao1010(paramMap);
			model.addAttribute("defaultList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 권한 상세 조회
	public void roleInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 상세 조회
			//--------------------------------------------------------------------------------------------
			defaultInfo = roleDao.roleInqyDao1020(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 메뉴 권한 목록 조회
	public void roleInqyService2010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = roleDao.roleInqyDao2010(paramMap);
			model.addAttribute("roleMenuList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 사용자 목록 조회
	public void roleInqyService3010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사용자 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = roleDao.roleInqyDao3010(paramMap);
			model.addAttribute("empList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 사용자 권한 목록 조회
	public void roleInqyService4010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사용자 권한 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = roleDao.roleInqyDao4010(paramMap);
			model.addAttribute("roleEmpList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 권한 등록 처리
	public String roleProcService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 등록 처리
			//--------------------------------------------------------------------------------------------
			resInt = roleDao.roleProcDao1010(paramMap);
			//
			if(resInt>0) {
				resStr = "YES";
			}
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
	
	// 권한 수정 처리
	public String roleProcService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 수정 처리
			//--------------------------------------------------------------------------------------------
			resInt = roleDao.roleProcDao1020(paramMap);
			//
			if(resInt>0) {
				resStr = "YES";
			}
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
	
	// 권한 삭제 처리
	public String roleProcService1030(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 권한 삭제 처리
			//--------------------------------------------------------------------------------------------
			resInt = roleDao.roleProcDao1030(paramMap);
			//
			if(resInt>0) {
				resStr = "YES";
			}
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
	
	// 메뉴 권한 저장 처리
	public String roleProcService1040(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		HashMap<String, Object> tempMap = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 권한 삭제 처리
			//--------------------------------------------------------------------------------------------
			roleDao.roleProcDao1040(paramMap);

			//--------------------------------------------------------------------------------------------
			// 메뉴 권한 저장 처리
			//--------------------------------------------------------------------------------------------
			for(int i=0;i<paramMap.size();i++) {
				//
				if(paramMap.get("menuCd"+i)!=null) {
					//
					tempMap = new HashMap<String, Object>();
					tempMap.put("menuCd", (String)paramMap.get("menuCd"+i));
					tempMap.put("roleCd", (String)paramMap.get("roleCd"));
					//
					resInt += roleDao.roleProcDao1050(tempMap);
				}
			}
			
			//
			if(resInt>0) {
				resStr = "YES";
			}
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
	
	// 사용자 권한 저장 처리
	public String roleProcService1050(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		HashMap<String, Object> tempMap = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 사용자 권한 삭제 처리
			//--------------------------------------------------------------------------------------------
			roleDao.roleProcDao1060(paramMap);

			//--------------------------------------------------------------------------------------------
			// 사용자 권한 저장 처리
			//--------------------------------------------------------------------------------------------
			for(int i=0;i<paramMap.size();i++) {
				//
				if(paramMap.get("empIdx"+i)!=null) {
					//
					tempMap = new HashMap<String, Object>();
					tempMap.put("empIdx", (String)paramMap.get("empIdx"+i));
					tempMap.put("roleCd", (String)paramMap.get("roleCd"));
					//
					resInt += roleDao.roleProcDao1070(tempMap);
				}
			}
			
			//
			if(resInt>0) {
				resStr = "YES";
			}
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
}
