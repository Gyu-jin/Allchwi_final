package com.jhta.allchwi.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import com.sun.mail.handlers.multipart_mixed;

@Controller
public class ChangePicsController {
	@Autowired
	private ChangePicsService service;

	
	
	@RequestMapping(value= {"/admin/changePics","/admin/insertPics"})
	public String changePics(HttpServletRequest request, Model model,
			MultipartFile file1, HttpSession session
			){
		
		
		if(request.getServletPath().equals("/admin/insertPics")) {
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
				FileOutputStream fos = new FileOutputStream(uploadPath+ File.separator +save_filename);
				
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
				return ".admin.error";
			}
		}
	
		
		List<PicsListVO> list = service.pics_list();
		model.addAttribute("list", list);
		
		return ".admin.changePics";
	}
	
	
	
	/*
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
			FileOutputStream fos = new FileOutputStream(uploadPath+ File.separator +save_filename);
			
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
	
	*/
	
	@RequestMapping("admin/confirmPics")
	public String confirmPics(String firstPic, String secondPic, String thirdPic) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("firstPic", firstPic);
		map.put("secondPic", secondPic);
		map.put("thirdPic", thirdPic);
		try {
			service.confirmPics(map);
		
		}catch(Exception e) {
			e.printStackTrace();
			return ".admin.error";
		}
		
		return ".admin.changePics";
	}
	
	
}
