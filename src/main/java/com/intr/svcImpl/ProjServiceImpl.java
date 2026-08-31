package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.intr.dao.CoreDao;
import com.intr.dao.ProjDao;
import com.intr.dao.UtilDao;
import com.intr.svc.CoreService;
import com.intr.svc.EmpService;
import com.intr.svc.ProjService;
import com.intr.svc.UtilService;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProjServiceImpl implements ProjService{
	//
	@Autowired
	UtilService utilService;

	@Autowired
	CoreService coreService;
	
	@Autowired
	EmpService empService;

	@Autowired
	ProjDao projDao;
	
	@Autowired
	CoreDao coreDao;
	
	@Autowired
	UtilDao utilDao;

	// 프로젝트 목록 조회
	public void projInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 페이징 처리
			//--------------------------------------------------------------------------------------------
			utilService.setPaging(model, paramMap);
			
			//--------------------------------------------------------------------------------------------
			// 프로젝트 목록 조회
			//--------------------------------------------------------------------------------------------
			defaultList = projDao.projInqyDao1020(paramMap);
			model.addAttribute("defaultList", defaultList);

			//--------------------------------------------------------------------------------------------
			// 공통코드 (진행상태) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Stat", "statList");
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 프로젝트 등록 조회
	public void projInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 공통코드 (진행상태) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Stat", "statList");
			
		} catch (Exception e) {
			//
			throw e;
		}
	}
	
	// 프로젝트 상세화면 조회
	public void projInqyService1030(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 상세 정보
			//--------------------------------------------------------------------------------------------
			defaultInfo = projDao.projInqyDao1030(paramMap);
			model.addAttribute("defaultInfo",defaultInfo);

			//--------------------------------------------------------------------------------------------
			// 공통코드 (진행상태) 조회
			//--------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Stat", "statList");
			
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
	
	// 프로젝트 등록 처리
	public String projProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 채번
			//--------------------------------------------------------------------------------------------
			defaultInfo = projDao.projInqyDao1010(paramMap);
			paramMap.put("sequenceId", (String)defaultInfo.get("sequenceId"));
			
			//--------------------------------------------------------------------------------------------
			// 프로젝트 등록 처리
			//--------------------------------------------------------------------------------------------
			resInt = projDao.projProcDao1010(paramMap);
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
	
	// 프로젝트 삭제
	public String projProcService1020(Model model, String [] deleteList) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 값 세팅
			//--------------------------------------------------------------------------------------------
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("deleteList", deleteList);

			//--------------------------------------------------------------------------------------------
			// 프로젝트 삭제
			//--------------------------------------------------------------------------------------------
			resInt = projDao.projProcDao1020(paramMap);

			//--------------------------------------------------------------------------------------------
			// 파일 삭제 처리 (삭제)
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
	
	// 프로젝트 수정
	public String projProcService1030(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 프로젝트 수정
			//--------------------------------------------------------------------------------------------
			resInt = projDao.projProcDao1030(paramMap);
			
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
