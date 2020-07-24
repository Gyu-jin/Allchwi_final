package com.jhta.allchwi.controller.onlineCampus;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.vo.community.CommunityVO;


@Controller
public class OnlineClassController {
	
	@GetMapping("/community/mediaList")
	public String goOnlineClass(HttpSession session,Model model) {
		return ".community.onlineCampus.mediaList";
	}
	
	@GetMapping("/community/mediaModal")
	public String showModal(HttpSession session) {
		return "community/onlineCampus/fileuploadModal";
	}
	
	@RequestMapping(value = "/community/save-product", method = RequestMethod.POST)
	public String saveFile(MultipartFile files, Model model, HttpSession session,HashMap<String, Object> map) {
		
		String uploadPath = 
				session.getServletContext().getRealPath("/resources/mediaFold");
		
		String commu_title =((CommunityVO)session.getAttribute("commuInfo")).getCommu_title();
		int commu_num =((CommunityVO)session.getAttribute("commuInfo")).getCommu_num();
		
		String path = uploadPath+ File.separator+commu_num+"_"+commu_title;
		
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		    }catch(Exception e){
			    e.getStackTrace();
		    }        
		}
		
		String orgfileName = files.getOriginalFilename();
		
		String savefileName = UUID.randomUUID() + "_" + orgfileName;
		
		File fos = new File(path+File.separator + savefileName);
		try {
			files.transferTo(fos);
			
			String time = Videoffmpeg.media_player_time(path+File.separator + savefileName);
			System.out.println("Play_Time : " + time);
		} catch (IOException e) {
			FileUtils.deleteQuietly(fos);
			e.printStackTrace();
			return "fail";
		}		
		
		return "success";
	}
}
