package com.jhta.allchwi.controller.community;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.allchwi.service.community.AssignDataService;
import com.jhta.allchwi.service.community.AssignSubmitService;
import com.jhta.allchwi.service.community.AssignmentService;
import com.jhta.allchwi.vo.community.AssignDataVO;
import com.jhta.allchwi.vo.community.AssignSubmitVO;
import com.jhta.allchwi.vo.community.AssignmentVO;

@Controller
public class AssignmentController {
	@Autowired private AssignmentService assign_service;
	@Autowired private AssignSubmitService submit_service;
	@Autowired private AssignDataService data_service;
	
	
	// 과제 게시판으로 이동
	@GetMapping("/community/assignment")
	public String goAssign(Model model) {
		
		List<AssignmentVO> list=assign_service.list();
		model.addAttribute("list", list);
		return ".community.board.assignment";
	}
	
	// 튜터 과제 업로드
	@RequestMapping(value="/assign/upload", method = RequestMethod.POST)
	@ResponseBody
	public String uploadOk(AssignmentVO vo) {
		
		int n=assign_service.insert(vo);
		if(n>0) {		
			return "success";
		}else {
			return "fail";
		}

	}
	
	// 튜터 과제 삭제
	@RequestMapping(value="/assign/delete", method = RequestMethod.GET)
	@ResponseBody
	public String deleteOk(int assign_num) {
	
		int n=assign_service.delete(assign_num);
		if(n>0) {		
			return "success";
		}else {
			return "fail";
		}
		
	}
	// 튜터 과제 수정할 목록 불러오기
	@RequestMapping(value="/assign/update", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String update(int assign_num) {
		
		AssignmentVO vo=assign_service.updatelist(assign_num);
		JSONObject json=new JSONObject();
		json.put("assign_title", vo.getAssign_title());
		json.put("assign_content", vo.getAssign_content());
		json.put("assign_num", vo.getAssign_num());
		return json.toString();
		
	}
	
	// 튜터 과제 수정
	@RequestMapping(value="/assign/updateOk", method = RequestMethod.POST)
	@ResponseBody
	public String updateOk(AssignmentVO vo) {
		System.out.println("assign/updateOk method");
		int n=assign_service.update(vo);
		if(n>0) {		
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 학생 과제 제출 Submit
	@PostMapping("/assign/submit")
	public String submitOk(AssignSubmitVO vo) {
		
		return "";
		
	}
	
	// 학생 과제 제출 - data
	@RequestMapping(value="/assign/data", method = RequestMethod.POST)
	public String subData(HttpSession session, MultipartHttpServletRequest assign_file, String sub_content, int assign_num) {
		
    	int ml_num = (int)session.getAttribute("ml_num");
        
        AssignSubmitVO svo=new AssignSubmitVO(0, assign_num, ml_num, sub_content, null);
        int submit=submit_service.insert(svo);
        
        int sub_num=svo.getSub_num();
        System.out.println("sub_num:"+sub_num);
        
        
        List<MultipartFile> fileList = assign_file.getFiles("assign_file");
        String src = assign_file.getParameter("src");
        System.out.println("src value : " + src);
        String path = session.getServletContext().getRealPath("/resources/AssignUpload");
        int assign_data=-1;
        for (MultipartFile mf : fileList) {
        	
            String assign_orgFilename = mf.getOriginalFilename(); // 원본 파일 명
            System.out.println("assign_orgFilename:"+assign_orgFilename);
            String assign_saveFilename=UUID.randomUUID()+"_" +assign_orgFilename; // 저장 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("assign_orgFilename : " + assign_orgFilename);
            System.out.println("fileSize : " + fileSize);

            try {
                mf.transferTo(new File(path+"\\"+assign_saveFilename));
                AssignDataVO dvo=new AssignDataVO(0, sub_num, assign_orgFilename, assign_saveFilename, null);
                assign_data=data_service.insert(dvo);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        if(submit>0 && assign_data>0) {
        	return".community.board.assignment";
        }else {
        	return ".error.error";
        }
        
        
	
	}
}
