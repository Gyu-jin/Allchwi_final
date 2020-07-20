package com.jhta.allchwi.controller.myClassManage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.service.myclassmanage.MyClassManageService;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.myclassmanage.MyClassManageVO;

@Controller
public class MyClassManageController {
	@Autowired
	private MyClassManageService mcms;
	
	@RequestMapping("/myClass/myClassManage")
	public String goMyClassMagnage(HttpSession session, Model model, @RequestParam(value="class_num", defaultValue = "0")int class_num) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		int ml_num = (int)session.getAttribute("ml_num");
		hm.put("ml_num", ml_num);
		hm.put("class_num", class_num);
		List<MyClassManageVO> list = mcms.searchApply(hm);
		List<ClassInfoVO> myClass = mcms.searchMyClass(ml_num);
		model.addAttribute("list", list);
		model.addAttribute("myClass", myClass);
		return ".myClass.myClassManage";
	}
}
