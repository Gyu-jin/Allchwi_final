package com.jhta.allchwi.controller.search;

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
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.location.BigLocationService;
import com.jhta.allchwi.service.location.SmallLocationService;
import com.jhta.allchwi.vo.admin.BigCategoryVO;
import com.jhta.allchwi.vo.admin.SmallCategoryVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.location.BigLocationVO;
import com.jhta.allchwi.vo.location.SmallLocationVO;

@Controller
public class ListSearchController {
	@Autowired private ClassInfoService service;
	@Autowired private categoryService category_service;
	@Autowired private BigLocationService bloc_service;
	@Autowired private SmallLocationService sloc_service;
	
	@RequestMapping(value="/list/search",method = RequestMethod.GET)
	public ModelAndView goSearchList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
										@RequestParam(value="bcategory_num",defaultValue="-1")int bcategory_num, 
										@RequestParam(value="scategory_num",defaultValue="-1")int scategory_num,
										@RequestParam(value="keyword",defaultValue="")String keyword,
										@RequestParam(value="startDate",defaultValue="")String startDate,
										@RequestParam(value="endDate",defaultValue="")String endDate,
										@RequestParam(value="sloc_num",defaultValue="-1")int sloc_num) {
		
		ModelAndView mv=new ModelAndView(".search.detailSearch");
		HashMap<String, Object> map=new HashMap<String, Object>();
		// bcategory_num 값 map 에 저장
		map.put("bcategory_num", bcategory_num);
		map.put("scategory_num", scategory_num);
		map.put("keyword", keyword);
		map.put("sloc_num", sloc_num);
		int totalRowCount=0;
		List<ClassInfoVO> list=null;
		PageUtil pu=null;
		// bcategory_num 값이 넘어왔을 경우 
		if(bcategory_num>0) {			
			// bcategory_num 값 ModelAndView에 담아 detailSearcj.jsp로 전달
			mv.addObject("bcategory_num",bcategory_num);
			// map에 담긴 #{bcategory_num}값으로 해당하는 count 값 산출
			totalRowCount=service.count(map);
			// 페이징에 필요한 정보 생성
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			// 시작 행 값 산출
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);		
			// map에 담긴 #{bcategory_num}, ${keyword}값으로 해당하는 list 값 산출
			list=service.list(map);
			
		}else if(scategory_num>0 && sloc_num==-1) {			
			mv.addObject("scategory_num",scategory_num);
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);		
			list=service.list(map);

		}else if(keyword!=null && keyword!="" && sloc_num==-1 ) {		
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);	
			list=service.keyword_list(map);
			mv.addObject("keyword",keyword);
			
		}else if(sloc_num>0 && keyword!=null && keyword!="") {			
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);	
			list=service.keyword_list(map);
			mv.addObject("keyword",keyword);
			mv.addObject("sloc_num",sloc_num);
		}else if(scategory_num>0 && sloc_num>0) {
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);		
			list=service.list(map);
			mv.addObject("scategory_num",scategory_num);
		}
		
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
