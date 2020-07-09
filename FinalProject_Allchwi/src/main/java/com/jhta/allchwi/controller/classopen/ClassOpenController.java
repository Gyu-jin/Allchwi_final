package com.jhta.allchwi.controller.classopen;



import java.util.List;

import org.apache.commons.fileupload.MultipartStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ClassOpenController {
	
	@GetMapping("/class/enrollment")
	public String goEnrollement() {
		return ".classOpen.ClassEnrollment";
	}
	
	@PostMapping("/class/enrollmentInsert")
	public String classInsert(@RequestParam(value = "cert") List<MultipartFile> files) {
		System.out.println("hello");
		return null;
	}
}
