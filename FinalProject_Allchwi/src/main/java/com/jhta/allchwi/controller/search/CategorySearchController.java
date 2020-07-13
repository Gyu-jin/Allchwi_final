package com.jhta.allchwi.controller.search;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Controller
public class CategorySearchController {
	@Autowired private ClassInfoService service;
	
	@RequestMapping(value="/category/search",method = RequestMethod.GET)
	public ModelAndView goSmallCategory(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
										@RequestParam(value="bcategory_num",defaultValue="-1")int bcategory_num, 
										@RequestParam(value="scategory_num",defaultValue="-1")int scategory_num) {
		
		ModelAndView mv=new ModelAndView(".search.detailSearch");
		HashMap<String, Object> map=new HashMap<String, Object>();
		int totalRowCount=0;
		if(bcategory_num>0) {
			map.put("bcategory_num", bcategory_num);
			mv.addObject("bcategory_num",bcategory_num);
			totalRowCount=service.count(map);
		}else if(scategory_num>0) {
			map.put("scategory_num", scategory_num);
			mv.addObject("scategory_num",scategory_num);
			totalRowCount=service.count(map);
		}
			
		
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 6, 5);
		int startRow=pu.getStartRow()-1;
		map.put("startRow", startRow);
		List<ClassInfoVO> list=service.list(map);
		mv.addObject("list", list);
		mv.addObject("pu",pu);

		return mv;
	}
}
