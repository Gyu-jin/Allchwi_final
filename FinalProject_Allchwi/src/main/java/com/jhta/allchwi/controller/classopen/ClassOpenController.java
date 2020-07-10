package com.jhta.allchwi.controller.classopen;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.service.classopen.CertificateService;
import com.jhta.allchwi.service.classopen.ClassImgService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.profileImg.ProfileImgService;
import com.jhta.allchwi.vo.classopen.CertificateVO;
import com.jhta.allchwi.vo.classopen.ClassImgVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.profileImg.ProfileImgVO;

@Controller
public class ClassOpenController {
	@Autowired
	private CertificateService cert_service;
	@Autowired
	private ClassInfoService classinfo_service;
	@Autowired
	private ClassImgService classimg_service;
	@Autowired
	private ProfileImgService proimg_service;
	
	
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
			@RequestParam("curriculum[]")List<String> curriculum) {
		
		
		// 프로필 이미지 업로드.
		String proImgName = picture.getOriginalFilename(); //프로필이미지 파일명
		byte[] proImgFile = null; //vo에 담을 바이트 이미지 파일
		try {
			proImgFile = picture.getBytes(); //multipart로 얻은 File 바이트형식으로 바꿔 저장
		} catch (IOException e1) {
			System.out.println(e1.getMessage());
		}
		
		// 프로필이미지 VO 생성
		ProfileImgVO proVo = new ProfileImgVO(0, proImgFile, proImgName,null);
		proimg_service.insert(proVo);
		
		// 자격증 데이터 가져오기.
		
		ArrayList<CertificateVO> certList = new ArrayList<CertificateVO>(); // 여러개 일경우 받을 List
		for (int i = 0; i < certes.size(); i++) {
			MultipartFile cert = certes.get(i);	//list로 들어온 자격지 File 얻어오기
			String originalName = cert.getOriginalFilename(); // 자격증 파일명
			byte[] certFile = null;
			try {
				certFile = cert.getBytes();
			} catch (IOException e) {
				e.printStackTrace();
			}
			CertificateVO certVo = new CertificateVO(0, 12, originalName,certFile, certName[i], null);
			certList.add(certVo);

			cert_service.insert(certVo);
		}
			
		// 커버이미지 받아오기.
		ArrayList<ClassImgVO> coverList = new ArrayList<ClassImgVO>();
		for(MultipartFile img : images) {
			String originalNames = img.getOriginalFilename();
			byte[] imgFile = null;
			try {
				imgFile = img.getBytes();
			} catch (IOException e) {
				e.printStackTrace();
			}
			ClassImgVO imgVo = new ClassImgVO(0, 1, originalNames, imgFile, null);
			coverList.add(imgVo);
			classimg_service.insert(imgVo);
			
		}
		vo.setClass_auth(1);
		classinfo_service.insert(vo);
		
		for (int i = 0; i < curriculum.size(); i++) {
			System.out.println("curriculum"+i+"  :" + curriculum.get(i)  );
		}
		
		return ".classOpen.ClassEnrollment";
	}
}
