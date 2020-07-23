package com.jhta.allchwi.controller.community;

import java.io.File;
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
import com.jhta.allchwi.service.community.ArchiveService;
import com.jhta.allchwi.vo.community.ArchiveVO;

@Controller
public class ArchiveController {
	@Autowired
	private ArchiveService service;
	
	@GetMapping("/community/archive")
	public String goAssign(Model model,@RequestParam(value="pageNum",defaultValue = "1") int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.count();
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 6, 5);
		map.put("startRow", pu.getStartRow()-1);
	
		List<ArchiveVO> list = service.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		
		return ".community.board.archive";
	}
	
	
	@GetMapping("/community/archiveDetail")	//글내용(detail) 보기
	public String detail(int room_num,Model model) {
		service.hit(room_num);	//조회수 1증가
		ArchiveVO vo = service.detail(room_num);
		ArchiveVO next=service.next(room_num);//다음글
		ArchiveVO prev=service.prev(room_num);//이전글
		
		model.addAttribute("vo", vo);
		model.addAttribute("next",next);
		model.addAttribute("prev",prev);	
		return ".community.board.archiveContent";
	}
	
	@GetMapping("/community/writeContent") //글작성 페이지로 이동
	public String writeContent() {
		
		return ".community.board.writeArchiveContent";
	}
	
	
	@RequestMapping("/community/writeContentOk")
	public String writeContentOk(int horsehead, String room_title, String room_content, MultipartFile file1,HttpSession session) {
		//System.out.println(horsehead);
		//System.out.println(room_title);
		//System.out.println(room_content);
			
		//업로드할 폴더 경로 얻어오기
		String uploadPath=
				session.getServletContext().getRealPath("/resources/archiveUpload");
		System.out.println(uploadPath);
		
		//전송된 파일명
		String org_filename=file1.getOriginalFilename();
		
		//실제 저장할 파일명(중복되지 않도록)
		String save_filename=UUID.randomUUID()+"_" +org_filename;
		try {
			//전송된 	파일을 읽어오는 스트림
			InputStream fis = file1.getInputStream();
			
			//전송된 파일을 서버에 복사(업로드) 하기 위한 출력스트림
			FileOutputStream fos =
					new FileOutputStream(uploadPath+"\\"+save_filename);
			
			//파일복사하기
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			
			long filesize = file1.getSize(); //파일크기 얻어오기
			
			//System.out.println(org_filename);
			//System.out.println(save_filename);
			//System.out.println(filesize);
			
			//DB에 파일정보 저장하기
			ArchiveVO vo = new ArchiveVO(0, 10, room_title, room_content, null, 0, horsehead, org_filename, save_filename, filesize);
			service.insert(vo);
			return "redirect:/community/archive";
		
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return ".error";
		}
	}
	
	
	@GetMapping("/community/download")
	public String download(int room_num,Model model,HttpSession session) {
		//다운로드할 파일정보를 갖는 객체얻어오기
		
		ArchiveVO vo =service.getInfo(room_num);
		String path=session.getServletContext().getRealPath("/resources/archiveUpload");
		//다운로드할파일객체
		File f=new File(path + File.separator + vo.getSave_filename());
		
		//다운로드창에 보여질 파일명
		String filename=vo.getOrg_filename();
		
		//System.out.println(filename);
		
		model.addAttribute("file",f);
		model.addAttribute("filename",filename);
		model.addAttribute("filesize",vo.getFilesize());
		return "filedownloadView";
	}
	
	
	
	
	
	
	
}
