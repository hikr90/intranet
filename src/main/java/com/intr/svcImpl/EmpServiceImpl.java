package com.intr.svcImpl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.intr.dao.EmpDao;
import com.intr.dao.MainDao;
import com.intr.dao.UtilDao;
import com.intr.svc.EmpService;
import com.intr.svc.MainService;
import com.intr.svc.UtilService;

@Service
@Transactional(rollbackFor = Exception.class)
public class EmpServiceImpl implements EmpService {
	//
	@Autowired
	MainDao mainDao;

	@Autowired
	EmpDao empDao;

	@Autowired
	UtilDao utilDao;

	@Autowired
	MainService mainService;

	@Autowired
	UtilService utilService;

	@Autowired
	HttpServletRequest request;

	// 사원 목록 조회
	public void empInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 페이징 처리
			// --------------------------------------------------------------------------------------------
			utilService.setPaging(model, paramMap);

			// --------------------------------------------------------------------------------------------
			// 사원 목록
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.empInqyDao1020(paramMap);
			model.addAttribute("defaultList", defaultList);

			// --------------------------------------------------------------------------------------------
			// 공통코드 (재직여부) 조회
			// --------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Hire", "hireList");

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 부서 직급 조회
	public void empInqyService1020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 부서 목록 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy1021(paramMap);
			model.addAttribute("orgList", defaultList);

			// --------------------------------------------------------------------------------------------
			// 직급 목록 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy1022(paramMap);
			model.addAttribute("rankList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 사원 상세 조회
	public void empInqyService1030(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 사원 상세 정보
			// --------------------------------------------------------------------------------------------
			defaultInfo = empDao.intrEmpInqy1031(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 부서 직급 조회
	public void empInqyService1040(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 부서 목록 (전체) 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy1023(paramMap);
			model.addAttribute("orgList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 사원 아이디 중복 조회
	public String empInqyService2020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		String defaultStr = "";
		String resStr = "NO";
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 사원 아이디 중복 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2021(paramMap);
			//
			if (defaultList.size() > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}

	// 부서 사원 트리 조회
	public void empInqyService2030(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 부서 사원 트리 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2031(paramMap);
			model.addAttribute("defaultList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 부서 현황
	public void empInqyService2040(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 부서 현황
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy2041(paramMap);
			model.addAttribute("empCnt", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 담당업무 조회
	public void empInqyService3010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 페이징 처리
			// --------------------------------------------------------------------------------------------
			utilService.setPaging(model, paramMap);

			// --------------------------------------------------------------------------------------------
			// 담당업무 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy3011(paramMap);
			model.addAttribute("defaultList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 담당업무 조회 (AJAX)
	public void empInqyService3011(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 페이징 처리
			// --------------------------------------------------------------------------------------------
			utilService.setPaging(model, paramMap);

			// --------------------------------------------------------------------------------------------
			// 담당업무 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy3011(paramMap);
			model.addAttribute("defaultList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 담당업무 등록 조회 (AJAX)
	public void empInqyService3012(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		HashMap<String, Object> defaultInfo = null;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 담당업무 등록 조회
			// --------------------------------------------------------------------------------------------
			defaultInfo = empDao.intrEmpInqy3012(paramMap);
			model.addAttribute("defaultInfo", defaultInfo);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 인사통계 목록 조회
	public void empInqyService4010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		List<HashMap<String, Object>> defaultList = null;
		HashMap<String, Object> statList = new HashMap<String, Object>();
		String key = "";
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 인사통계 목록 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy4012(paramMap);
			//
			for (HashMap<String, Object> row : defaultList) {
				// [예시]: "관리팀_202501", "관리팀_연간 소계", "전체 합계_202501"
				key = row.get("orgNm") + "_" + row.get("yearMm");
				statList.put(key, row);
			}
			//
			model.addAttribute("statList", statList);

			// --------------------------------------------------------------------------------------------
			// 통계 연도 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy4013(paramMap);
			model.addAttribute("yearList", defaultList);

			// --------------------------------------------------------------------------------------------
			// 공통코드 (재직여부) 조회
			// --------------------------------------------------------------------------------------------
			utilService.getCodeList(model, "Hire", "hireList");

			// --------------------------------------------------------------------------------------------
			// 통계 연월 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy4014(paramMap);
			model.addAttribute("ymList", defaultList);

			// --------------------------------------------------------------------------------------------
			// 부서 조회
			// --------------------------------------------------------------------------------------------
			defaultList = empDao.intrEmpInqy1021(paramMap);
			model.addAttribute("orgList", defaultList);

		} catch (Exception e) {
			//
			throw e;
		}
	}

	// 사원 등록
	public String empProcService1010(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		List<MultipartFile> fileList = request.getFiles("fileList");
		HashMap<String, Object> defaultInfo = null;
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 사원 인덱스 채번
			// --------------------------------------------------------------------------------------------
			defaultInfo = empDao.empInqyDao1010(paramMap);
			paramMap.put("sequenceId", defaultInfo.get("sequenceId"));

			// --------------------------------------------------------------------------------------------
			// 비밀번호 암호화
			// --------------------------------------------------------------------------------------------
			paramMap.put("empPwd", utilService.encryptProc((String) paramMap.get("empPwd")));

			// --------------------------------------------------------------------------------------------
			// 사원 등록
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc1011(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 파일 등록
			// --------------------------------------------------------------------------------------------
			if (fileList != null) {
				resStr = utilService.fileUpload(model, paramMap, request);
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}

		return defaultStr;
	}

	// 사원 수정
	public String empProcService1020(Model model, HashMap<String, Object> paramMap, MultipartHttpServletRequest request) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		String empPwd = utilService.nvlProc((String) paramMap.get("empPwd"));
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 비밀번호 암호화
			// --------------------------------------------------------------------------------------------
			if (empPwd != "") {
				paramMap.put("empPwd", utilService.encryptProc((String) paramMap.get("empPwd")));
			}

			// --------------------------------------------------------------------------------------------
			// 사원 수정
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc1021(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 파일 등록
			// --------------------------------------------------------------------------------------------
			resStr = utilService.fileUpload(model, paramMap, request);

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}

		return defaultStr;
	}

	// 사원 복직, 퇴사 처리
	public String empProcService1030(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 사원 복직, 퇴사 처리
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc1031(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}

		return defaultStr;
	}

	// 사원 삭제
	public String empProcService1040(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 사원 삭제
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc1041(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}

		return defaultStr;
	}

	// 사원 비밀번호 수정
	public String empProcService1050(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		String encryptedText = "";
		String newPwd = utilService.nvlProc((String) paramMap.get("newPwd"));
		int resInt = 0;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 암호화 처리
			// --------------------------------------------------------------------------------------------
			encryptedText = utilService.encryptProc(newPwd);
			paramMap.put("chngPwd", encryptedText);

			// --------------------------------------------------------------------------------------------
			// 사원 수정
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc1051(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}

		return defaultStr;
	}

	// 담당업무 저장 처리
	public String empProcService2010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 담당업무 저장 처리
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc2011(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}

		return defaultStr;
	}

	// 담당업무 삭제 처리
	public String empProcService2020(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String defaultStr = "";
		String resStr = "NO";
		int resInt = 0;
		//
		try {
			// --------------------------------------------------------------------------------------------
			// 담당업무 삭제 처리
			// --------------------------------------------------------------------------------------------
			resInt = empDao.intrEmpProc2021(paramMap);
			//
			if (resInt > 0) {
				resStr = "YES";
			}

			// --------------------------------------------------------------------------------------------
			// 결과 반환
			// --------------------------------------------------------------------------------------------
			defaultStr = String.format("[{'res':'%s'}]", resStr);

		} catch (Exception e) {
			//
			throw e;
		}
		//
		return defaultStr;
	}
}
