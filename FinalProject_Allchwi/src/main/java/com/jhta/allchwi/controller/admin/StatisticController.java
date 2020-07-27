package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.dao.admin.StatisticDAO;
import com.jhta.allchwi.vo.admin.Statistic1VO;
import com.jhta.allchwi.vo.admin.Statistic3VO;

@Controller
public class StatisticController {
	@Autowired
	private StatisticDAO dao;
	
	
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
	
	
	@GetMapping("/admin/statisticAjax3")
	@ResponseBody
	public List<Statistic3VO> statisticAjax3(){
		List<Statistic3VO> cate_list =  dao.cate_statlist();
		return cate_list;
	}
	
	
}
