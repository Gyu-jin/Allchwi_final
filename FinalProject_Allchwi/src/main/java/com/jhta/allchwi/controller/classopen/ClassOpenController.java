package com.jhta.allchwi.controller.classopen;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.vo.claaopen.ClassInfoVO;

@Controller
public class ClassOpenController {
	
	@GetMapping("/class/enrollment")
	public String goEnrollement() {
		return ".classOpen.ClassEnrollment";
	}
	
	@PostMapping("/class/enrollmentInsert")
	public String classInsert(
			HttpSession session,
			ClassInfoVO vo,
			@RequestParam("picture")MultipartFile picture,
			@RequestParam("certName[]")String[] certName,
			@RequestParam("cert[]")List<MultipartFile> certes,
			@RequestParam("images")List<MultipartFile> images,
			@RequestParam("curriculum")String[] curriculum) {
		
		String uploadPath = 
				session.getServletContext().getRealPath("/resources/uploadCert");
		
		String originalNamez = picture.getOriginalFilename();
		System.out.println(originalNamez);
		String savefileNamez = UUID.randomUUID() + "_" + originalNamez;
		
		// 전송된 파일을 읽어오는 스트림
		try {
			InputStream fis;
			fis = picture.getInputStream();
			// 전송된 파일을 읽어 오는스트림
			// 전송된 파일을 서버에 복사(업로드) 하기위한 출력스트림
			FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefileNamez);
			// 파일 복사하기 ( 파일 복사 클래스 )
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(uploadPath);
		for (int i = 0; i < certes.size(); i++) {
			MultipartFile cert = certes.get(i);
			String originalName = cert.getOriginalFilename();
			System.out.println(originalName);
			String savefileName = UUID.randomUUID() + "_" + originalName;
			
			// 전송된 파일을 읽어오는 스트림
			try {
				InputStream fis;
				fis = cert.getInputStream();
				// 전송된 파일을 읽어 오는스트림
				// 전송된 파일을 서버에 복사(업로드) 하기위한 출력스트림
				FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefileName);
				// 파일 복사하기 ( 파일 복사 클래스 )
				FileCopyUtils.copy(fis, fos);
				fis.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
			
		for(MultipartFile img : images) {
			String originalNames = img.getOriginalFilename();
			System.out.println(originalNames);
			String savefileNames = UUID.randomUUID() + "_" + originalNames;
			
			// 전송된 파일을 읽어오는 스트림
			try {
				InputStream fis;
				fis = img.getInputStream();
				// 전송된 파일을 읽어 오는스트림
				// 전송된 파일을 서버에 복사(업로드) 하기위한 출력스트림
				FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefileNames);
				// 파일 복사하기 ( 파일 복사 클래스 )
				FileCopyUtils.copy(fis, fos);
				fis.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("phone       :" + vo.getTutor_phone()       );
		System.out.println("nickname    :" + vo.getTutor_nickname()    );
		System.out.println("address     :" + vo.getClass_address()     );
		System.out.println("cateSub    :" + vo.getScategory_num()    );
		System.out.println("classOption :" + vo.getClass_form() );
		System.out.println("minPerson   :" + vo.getClass_min()   );
		System.out.println("maxPerson   :" + vo.getClass_max()   );
		System.out.println("title       :" + vo.getClass_title()       );
		System.out.println("unitPrice   :" + vo.getClass_price()   );
		System.out.println("time        :" + vo.getClass_hour()        );
		System.out.println("totalTimes  :" + vo.getClass_count()  );
		System.out.println("tutorInfo   :" + vo.getTutor_about()   );
		System.out.println("introduction:" + vo.getClass_about());
		System.out.println("target      :" + vo.getClass_target()      );
		for (int i = 0; i < curriculum.length; i++) {
			System.out.println("curriculum"+i+"  :" + curriculum[i]  );
		}
		
		return ".classOpen.ClassEnrollment";
	}
}
