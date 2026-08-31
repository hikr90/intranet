package com.intr.svcImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.intr.dao.RegsDao;
import com.intr.dao.UtilDao;
import com.intr.svc.RegsService;
import com.intr.svc.UtilService;
import com.intr.utils.Const;

@Service
@Transactional(rollbackFor = Exception.class)
public class RegsServiceImpl implements RegsService {
	//
	@Autowired
	UtilService utilService;
	
	@Autowired
	UtilDao utilDao;
	
	@Autowired
	RegsDao regsDao;
	
	// 내부규정 조회
	public void regsInqyService1010(Model model, HashMap<String, Object> paramMap) throws Exception {
		//
		String tabCd = utilService.nvlProc((String)paramMap.get("tabCd"));
		//
		try {
			//--------------------------------------------------------------------------------------------
			// 선택 탭 전송
			//--------------------------------------------------------------------------------------------
			model.addAttribute("tabCd", tabCd);
			
		} catch (Exception e) {
			throw e;
		}
	}
	
	// PDF 뷰어 생성
	@Override
    public void regsInqyService1011(Model model, HashMap<String, Object> paramMap, HttpServletResponse response) throws Exception {
        // 물리 경로 설정
		 String filePath = utilService.setBasePath(Const.REGS_PATH, null);
		
		// 파일명 설정
		String tabCd = (String)paramMap.get("tabCd");
		String fileNm = Const.TAB_WEL.equals(tabCd) ? Const.RULE_WEL : Const.TAB_HRM.equals(tabCd) ? Const.RULE_HRM : Const.RULE_CORP;
        File pdfFile = new File(filePath + File.separator + fileNm);
        //
        if (!pdfFile.exists()) {
        	throw new FileNotFoundException("[ERROR] file not found : " + pdfFile.getName());	
        }

        // 브라우저 이동 없도록 처리
        response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "inline; filename=\"" + pdfFile.getName() + "\"; filename*=UTF-8''" + pdfFile.getName());
        response.setContentLength((int) pdfFile.length());
        //
        FileInputStream fis = null;
        OutputStream os = null;
        //
        try {
        	//
            fis = new FileInputStream(pdfFile);
            os = response.getOutputStream();
            //
            byte[] buffer = new byte[8192];
            int count;
            while ((count = fis.read(buffer)) != -1) {
                os.write(buffer, 0, count);
            }
            os.flush();
            
        } finally {
            if (fis != null) try { fis.close(); } catch (Exception e) {e.printStackTrace();}
        }
    }
}
