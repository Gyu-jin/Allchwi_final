package com.jhta.allchwi.controller.onlineCampus;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.jcodec.api.JCodecException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.onlineclass.OnlineClassService;
import com.jhta.allchwi.vo.community.CommunityVO;
import com.jhta.allchwi.vo.onlineclass.OnlineClassVO;


@Controller
public class OnlineClassController {
	@Autowired
	private OnlineClassService service;
	
	
	@GetMapping("/community/mediaList")
	public String goOnlineClass(HttpSession session, Model model,
				@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		CommunityVO commu = (CommunityVO)session.getAttribute("commuInfo");
		int commu_num = commu.getCommu_num();
		
		int totalRowCount = service.count(map);
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		map.put("startRow",pu.getStartRow() - 1);
		map.put("commu_num",commu_num);
		
		List<OnlineClassVO> list = service.list(map);
		
		model.addAttribute("list", list);		
		model.addAttribute("pu", pu);		
		
		return ".community.onlineCampus.mediaList";
	}
	
	@GetMapping("/community/mediaModal")
	public String showModal(HttpSession session) {
		return "community/onlineCampus/fileuploadModal";
	}
	
	@RequestMapping(value = "/community/save-product", produces ="application/text; charset=utf8",
			method = RequestMethod.POST)
	public String saveFile(MultipartFile files, Model model, 
			HttpSession session,@RequestParam  HashMap<String, Object> formdata) {
		
		String commu_title =((CommunityVO)session.getAttribute("commuInfo")).getCommu_title();
		int commu_num =((CommunityVO)session.getAttribute("commuInfo")).getCommu_num();
		String online_title = (String)formdata.get("online_title");
		String online_content = (String)formdata.get("online_content");
		System.out.println(online_title);
		System.out.println(online_content);
		
		String uploadPath = 
				session.getServletContext().getRealPath("/resources/mediaFold");
		
		
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
		String online_file = commu_num+ "_" + commu_title + File.separator 
				+ File.separator + savefileName;
		try {
			files.transferTo(fos);
			
			int online_time = Videoffmpeg.media_player_time(path+File.separator + savefileName);
			System.out.println("Play_Time : " + online_time);
			byte[] thumbnail = null;
			try {
				thumbnail = Mp4Thumbnail.getThumbnail(fos);
			} catch (JCodecException e) {
				e.printStackTrace();
			}
			
			OnlineClassVO vo = new OnlineClassVO(0, commu_num, online_title,online_content, online_time, online_file, thumbnail, null);
			System.out.println(vo.getCommu_num());
			System.out.println(vo.getOnline_thumbnail());
			service.classInsert(vo);
			
		} catch (IOException e) {
			FileUtils.deleteQuietly(fos);
			e.printStackTrace();
			return "fail";
		}		
		
		return "success";
	}
}
