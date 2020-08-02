package com.jhta.allchwi.controller.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.ChangePicsService;
import com.jhta.allchwi.service.classdetail.ClassDetailService;
import com.jhta.allchwi.service.classdetail.ClassReviewService;
import com.jhta.allchwi.vo.admin.MainPicsVO;
import com.jhta.allchwi.vo.admin.PicsListVO;
import com.jhta.allchwi.vo.classdetail.ClassDetailVO;
import com.jhta.allchwi.vo.classdetail.ClassReviewVO;

@Controller
public class ChangePicsController {
	@Autowired
	private ChangePicsService service;

	
	
	@RequestMapping("admin/changePics")
	public String changePics(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int totalRowCount = service.count();
		
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		map.put("startRow", pu.getStartRow());
		
		
		
		List<PicsListVO> list = service.pics_list(map);
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		
		return ".admin.changePics";
	}
	
	
	
	
	@RequestMapping("admin/insertPics")
	public String insertPics(HttpSession session, MultipartFile file1, String filename) {
		
		//업로드할 폴더 경로 얻어오기
		String uploadPath = session.getServletContext().getRealPath("/resources/mainPicsUpload");
		System.out.println(uploadPath);
		
		//전송된 파일명
		String org_filename = file1.getOriginalFilename();
				
		//실제 저장할 파일명(중복되지 않도록)
		String save_filename = UUID.randomUUID()+"_"+org_filename;
		try {
			//전송된 	파일을 읽어오는 스트림
			InputStream fis = file1.getInputStream();
			
			//전송된 파일을 서버에 복사(업로드) 하기 위한 출력스트림
			FileOutputStream fos = new FileOutputStream(uploadPath+"\\"+save_filename);
			
			//파일복사하기
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			
			//파일 사이즈 얻어오기
			long filesize = file1.getSize();
			
			//DB에 파일정보 저장하기
			MainPicsVO vo = new MainPicsVO(0, org_filename, save_filename, filesize);
			service.picsInsert(vo);
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return ".error";
		}
		
		return ".admin.changePics";
	}
	
	
	
}
