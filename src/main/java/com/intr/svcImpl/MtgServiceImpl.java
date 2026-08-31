package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.intr.dao.MtgDao;
import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.MtgService;
import com.intr.svc.UtilService;

import org.json.simple.JSONArray;

@Service
@Transactional(rollbackFor = Exception.class)
public class MtgServiceImpl implements MtgService{
	//
	@Autowired
	CoreService coreService;

	@Autowired
	UtilService utilService;
	
	@Autowired
	MtgDao mtgDao;
	
	@Autowired
	UtilDao utilDao;
	
	// 회의 목록 조회
	public void mtgInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 메뉴 조회
			//--------------------------------------------------------------------------------------------
			coreService.coreInqyService1010(model, paramMap);

			//--------------------------------------------------------------------------------------------
			// 회의 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = mtgDao.mtgInqyDao1020(paramMap);
			model.addAttribute("defaultList", JSONArray.toJSONString(defaultList));
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 회의 등록 조회
	public void mtgInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 등록 조회
			//--------------------------------------------------------------------------------------------
			
		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 회의 상세화면 조회
	public void mtgInqyService1030(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 상세 정보
			//--------------------------------------------------------------------------------------------
			defaultInfo = mtgDao.mtgInqyDao1030(paramMap);
			model.addAttribute("defaultInfo",defaultInfo);

			//--------------------------------------------------------------------------------------------
			// 파일 정보
			//--------------------------------------------------------------------------------------------
			defaultList = utilDao.fileInqyDao1010(paramMap);
			model.addAttribute("fileList",defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 회의 중복 조회
	public void mtgInqyService1091(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 중복 조회
			//--------------------------------------------------------------------------------------------
			defaultList = mtgDao.mtgInqyDao1040(paramMap);
			model.addAttribute("bookedList",defaultList);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 캘린더 조회
	public void mtgInqyService2010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 캘린더 조회
			//--------------------------------------------------------------------------------------------
			defaultList = mtgDao.mtgInqyDao2010(paramMap);
			model.addAttribute("calList", JSONArray.toJSONString(defaultList));
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 캘린더 목록 조회
	public void mtgInqyService2020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 캘린더 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = mtgDao.mtgInqyDao2020(paramMap);
			model.addAttribute("calInfo", defaultList);
			
		} catch (Exception e) {
			//
			throw e;
		}
	}

	
	// 회의 등록 처리
	public String mtgProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 채번
			//--------------------------------------------------------------------------------------------
			defaultInfo = mtgDao.mtgInqyDao1010(paramMap);
			paramMap.put("sequenceId", (String)defaultInfo.get("sequenceId"));
			
			//--------------------------------------------------------------------------------------------
			// 회의 등록 처리
			//--------------------------------------------------------------------------------------------
			resInt = mtgDao.mtgProcDao1010(paramMap);
			//
			if(resInt>0) {
				resStr = "YES";
			}

			//--------------------------------------------------------------------------------------------
			// 파일 등록
			//--------------------------------------------------------------------------------------------
			resStr = utilService.fileUpload(model, paramMap, request);
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		
		return defaultStr;
	}
	
	// 회의 삭제
	public String mtgProcService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 삭제
			//--------------------------------------------------------------------------------------------
			resInt = mtgDao.mtgProcDao1020(paramMap);

			//--------------------------------------------------------------------------------------------
			// 파일 삭제 처리
			//--------------------------------------------------------------------------------------------
			utilDao.fileProcDao1020(paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			if(resInt>0) {
				resStr = "YES";
			}
			//
			defaultStr = String.format("[{'res':'%s'}]", resStr);
			
		} catch (Exception e) {
			//
			throw e;
		}
		
		return defaultStr;
	}
	
	// 회의 수정
	public String mtgProcService1030(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 회의 수정
			//--------------------------------------------------------------------------------------------
			resInt = mtgDao.mtgProcDao1030(paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 파일 수정
			//--------------------------------------------------------------------------------------------
			resStr = utilService.fileUpload(model, paramMap, request);

			//--------------------------------------------------------------------------------------------
			// 결과 반환
			//--------------------------------------------------------------------------------------------
			if(resInt>0) {
				resStr = "YES";
			}
			//
			defaultStr = String.format("[{'res':'%s'}]", resStr);			
			
		} catch (Exception e) {
			//
			throw e;
		}
		
		return defaultStr;
	}
}
