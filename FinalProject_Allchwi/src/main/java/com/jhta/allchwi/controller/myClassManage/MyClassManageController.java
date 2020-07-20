package com.jhta.allchwi.controller.myClassManage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.myclassmanage.MyClassManageService;
import com.jhta.allchwi.vo.myclassmanage.MyClassManageVO;

@Controller
public class MyClassManageController {
	@Autowired
	private MyClassManageService mcms;
	
	@GetMapping("/myClass/myClassManage")
	public String goMyClassMagnage(HttpSession session, Model model) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		int ml_num = (int)session.getAttribute("ml_num");
		hm.put("ml_num", ml_num);
		List<MyClassManageVO> list = mcms.searchApply(hm);
		model.addAttribute("list", list);
		return ".myClass.myClassManage";
	}
}
