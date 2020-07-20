package com.jhta.allchwi.controller.search;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.categoryService;
import com.jhta.allchwi.service.classopen.ClassDateService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.location.BigLocationService;
import com.jhta.allchwi.service.location.SmallLocationService;
import com.jhta.allchwi.vo.admin.BigCategoryVO;
import com.jhta.allchwi.vo.admin.SmallCategoryVO;
import com.jhta.allchwi.vo.classopen.ClassDateVO;
import com.jhta.allchwi.vo.classopen.ClassImgVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.location.BigLocationVO;
import com.jhta.allchwi.vo.location.SmallLocationVO;

@Controller
public class ListSearchController {
	@Autowired private ClassInfoService service;
	@Autowired private categoryService category_service;
	@Autowired private BigLocationService bloc_service;
	@Autowired private SmallLocationService sloc_service;
	@Autowired private ClassDateService date_service;
	
	@RequestMapping(value="/list/search",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView goSearchList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
										@RequestParam(value="bcategory_num",defaultValue="-1")int bcategory_num, 
										@RequestParam(value="scategory_num",defaultValue="-1")int scategory_num,
										@RequestParam(value="keyword",defaultValue="")String keyword,
										@RequestParam(value="startDate",defaultValue="")String startDate,
										@RequestParam(value="endDate",defaultValue="")String endDate,
										@RequestParam(value="sloc_num",defaultValue="-1")int sloc_num) {
		
		ModelAndView mv=new ModelAndView(".search.detailSearch");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		// 필요한 정보(파라미터로 받아온 정보) map 에 저장
		map.put("bcategory_num", bcategory_num);
		map.put("scategory_num", scategory_num);
		map.put("keyword", keyword);
		map.put("sloc_num", sloc_num);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
	
		System.out.println("bcategory_num : " + bcategory_num);
		System.out.println("scategory_num : " +scategory_num);
		System.out.println("keyword : "+ keyword);
		System.out.println("sloc_num : "+ sloc_num);
		System.out.println(startDate + "~" + endDate);
		
		
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 6, 5);
		System.out.println("endPageNUm : "+pu.getEndPageNum());
		System.out.println("총 글의 갯수 : " +totalRowCount);
		int startRow=pu.getStartRow()-1;
		map.put("startRow", startRow);	
		List<ClassInfoVO> list=service.list(map);
		
		
		
		
		List<BigCategoryVO> bigcalte_list=category_service.bcate_list();
		List<SmallCategoryVO> smallcate_list = category_service.allscate_list();
		List<BigLocationVO> bloc_list=bloc_service.blocList();
		String scategory_name=category_service.scatename(scategory_num);
		String bcategory_name=category_service.bcatename(bcategory_num);
		mv.addObject("scategory_name", scategory_name);
		mv.addObject("bcategory_name", bcategory_name);
		mv.addObject("smallcate_list", smallcate_list);
		mv.addObject("bigcalte_list", bigcalte_list);
		mv.addObject("bloc_list", bloc_list);
		mv.addObject("list", list);
		mv.addObject("keyword",keyword);
		mv.addObject("sloc_num",sloc_num);
		mv.addObject("bcategory_num",bcategory_num);
		mv.addObject("scategory_num",scategory_num);

		mv.addObject("pu",pu);

		return mv;
	}
	
	@PostMapping("/locatrion/search")
	@ResponseBody
	public List<SmallLocationVO> getScate(int bloc_num){
		List<SmallLocationVO> sloc_list = sloc_service.slocList(bloc_num);
		return sloc_list;
	}
}
