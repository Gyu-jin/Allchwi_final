package com.jhta.allchwi.service.login;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.dao.login.MemberInfoDAO;
import com.jhta.allchwi.dao.login.MemberLoginDAO;
import com.jhta.allchwi.dao.point.PointDAO;
import com.jhta.allchwi.dao.profileImg.ProfileImgDAO;
import com.jhta.allchwi.vo.login.MemberInfoVO;
import com.jhta.allchwi.vo.login.MemberLoginVO;
import com.jhta.allchwi.vo.point.PointVO;
import com.jhta.allchwi.vo.profileImg.ProfileImgVO;

@Service
public class MemberLoginService{
	@Autowired
	private MemberLoginDAO mld;
	
	@Autowired
	private MemberInfoDAO mid;
	
	@Autowired
	private PointDAO pd;
	
	@Autowired
	private ProfileImgDAO pid;
	
	//아이디 중복확인
	public MemberLoginVO idCheck(String id) {
		return mld.idCheck(id);
	}
	//현재 비밀번호 일치 여부 확인
	public MemberLoginVO checkPwd(HashMap<String, Object> hm) {
		return mld.checkPwd(hm);
	}
	//현재 비밀번호, 아이디로 비밀번호 업데이트
	public int changePwd(HashMap<String, Object> hm) {
		return mld.changePwd(hm);
	}
	//회원가입시 트랜잭션 처리를 위해 인터페이스 상속
	@Transactional
	public int joinMember(HttpSession session, MemberLoginVO mlv, MemberInfoVO miv) throws Exception{
//		인터페이스로 상속을 받아 진행한 상황에서 발생(캐스팅 오류 발생)
//		a Object data 타입을 hashmap으로 변환시 cast 경고 발생 / dto클래스를 따로 만들거나
//		a 방법이 없을 경우 @supresswarning 어노테이션 추가하여 경고창만 없앰(실질적인 해결방법은 아님..)
//		HashMap<String, Object> hm = (HashMap<String, Object>) data;
		//a 받아온 아이디와 비밀번호를 vo에 넣어서 필요한 정보와 같이 DB에 저장
		MemberLoginVO imlv = new MemberLoginVO(0, mlv.getId(), mlv.getPwd(), 0, 0, null, 'n');
		int a = mld.join(imlv);
		//a 회원가입시 1000포인트 적립 / s => save[적립]
		PointVO pv = new PointVO(0, imlv.getMl_num(), 1000, "회원가입적립", null, 's');
		int a1 = pd.insert(pv);
		
		//a 실제 업로드 경로를 변수에 담기
		String realPath = session.getServletContext().getRealPath("/resources/img/profile-defaultImg.jpg");
		//a 기본 이미지 파일 읽어와 DB에 저장하기
		File file = new File(realPath);
//		File file = new File("C:/Users/JHTA/git/Allchwi_final/FinalProject_Allchwi/src/main/webapp/resources/img/profile-defaultImg.jpg");
		String fileName = file.getName();
		byte[] imageByte = null;
		try {
			//a 파일을 바이트 배열로 저장하기
			imageByte = Files.readAllBytes(file.toPath());
		} catch (IOException e) {
			//a 오류시 
			e.printStackTrace();
		}
		//session을 통해 이미지를 바이트 배열로 받고, 해당 파일 이름을 넣어서 DB에 저장
		ProfileImgVO piv = new ProfileImgVO(0, imageByte, fileName, null);
		int a2 = pid.insert(piv);
		
		//a 참조키를 받아야하므로 제일 마지막에 저장, 이름을 vo에 넣고 DB에 저장
		MemberInfoVO imiv = new MemberInfoVO(0, imlv.getMl_num(), piv.getPro_num(), miv.getMb_name(), null, null, null, 0, null, null);
		int a3 = mid.SignIn(imiv);
		
		int result = a + a1 + a2 + a3;
		return result;
	}
	
}
