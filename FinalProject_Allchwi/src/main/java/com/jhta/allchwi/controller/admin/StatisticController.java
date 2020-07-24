package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.dao.admin.Statistic1DAO;
import com.jhta.allchwi.vo.admin.Statistic1VO;

@Controller
public class StatisticController {
	@Autowired
	private Statistic1DAO dao;
	
	
	@GetMapping("/admin/statistic1")
	public String statstic() {
	
		return ".admin.statistic1";
	
	}
	
	@GetMapping("/admin/statisticAjax1")
	@ResponseBody
	public List<Statistic1VO> statisticAjax(int thisyear, int nextyear){
		List<Statistic1VO> list = dao.list(thisyear,nextyear);
		
		
		
		return list;
	}
	
	
	
	
	
	
	
	@GetMapping("/admin/statistic2")
	public String statstic2() {
		return ".admin.statistic2";
	}
	
	@GetMapping("/admin/statistic3")
	public String statstic3() {
		return ".admin.statistic3";
	}
	
	
	
}
