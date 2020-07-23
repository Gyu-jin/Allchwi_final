package com.jhta.allchwi.controller.onlineCampus;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.vo.community.CommunityVO;

@Controller
public class OnlineClassController {
	
	@GetMapping("/community/mediaList")
	public String goOnlineClass(HttpSession session,Model model) {
		return ".community.onlineCampus.mediaList";
	}
	
	@GetMapping("/community/mediaModal")
	public String showModal(HttpSession session, int commu_num) {
		return "community/onlineCampus/fileuploadModal";
	}
	
	@RequestMapping(value = "/community/save-product", method = {RequestMethod.POST,RequestMethod.GET})
	public void saveFile(
			MultipartFile multipartFile, 
			BindingResult bindingResult, Model model,HttpSession session) {
		
		System.out.println("aaaa");
		String fileName = multipartFile.getOriginalFilename();
		try {
			System.out.println(session.getServletContext().getRealPath("resources/mediadFold"));
			File file = new File(session.getServletContext().getRealPath("resources/mediadFold"), fileName);
			multipartFile.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
/*	public String upload(HttpSession session, @RequestParam("file") MultipartFile file) {
		String uploadPath = 
				session.getServletContext().getRealPath("/resources/mediadFold");
		
		String commu_title =((CommunityVO)session.getAttribute("commuInfo")).getCommu_title();
		
		String path = uploadPath+ File.separator+commu_title;
		
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
		}
		
		String orgfileName = file.getOriginalFilename();
		
		String savefileName = UUID.randomUUID() + "_" + orgfileName;
		
		File targetFile = new File(path + file.getOriginalFilename());
		try {
			InputStream fis = file.getInputStream();
			
			FileOutputStream fos = new FileOutputStream(path+File.separator + savefileName);
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		return null;
	}*/
	
	@RequestMapping(value = "/product-input-form")
    public String inputProduct(Model model) {
        return "productForm";
    }
}
