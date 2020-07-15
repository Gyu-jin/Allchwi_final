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
		
		//if문에서 쓸 변수 모음
		int totalRowCount=0;
		List<ClassInfoVO> list=null;
		PageUtil pu=null;
		boolean k=keyword!=null && keyword!="";
		boolean s=startDate!=null && startDate!="";
		boolean e=endDate!=null && endDate!="";
		
		
		// bcategory_num 값이 넘어왔을 경우 
		if(bcategory_num>0 && sloc_num==-1 ||(bcategory_num>0  && sloc_num>0)) {			
			// bcategory_num 값 ModelAndView에 담아 detailSearcj.jsp로 전달
			mv.addObject("bcategory_num",bcategory_num);
			mv.addObject("sloc_num",sloc_num);
			// map에 담긴 #{bcategory_num}값으로 해당하는 count 값 산출
			totalRowCount=service.count(map);
			// 페이징에 필요한 정보 생성
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			// 시작 행 값 산출
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);		
			// map에 담긴 #{bcategory_num}, ${keyword}값으로 해당하는 list 값 산출
			list=service.list(map);
			System.out.println("1 큰 카테고리만 들어왔을 때 or 2 큰 카테고리랑 작은 지역 둘 다 들어왔을 때");
			
		
		}else if(scategory_num>0 && sloc_num==-1) {	
			mv.addObject("scategory_num",scategory_num);
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);		
			list=service.list(map);
			System.out.println("3 작은 카테고리만 들어왔을 때");
			
			
		}else if(k && sloc_num==-1 ) {		
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);	
			list=service.keyword_list(map);
			mv.addObject("keyword",keyword);
			System.out.println("4 키워드만 들어왔을 때");
			
			
		}else if(scategory_num>0 && sloc_num>0) {
			
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);		
			list=service.list(map);
			mv.addObject("scategory_num",scategory_num);
			System.out.println("5 작은카테고리랑 작은지역 둘다 들어왔을 때");
			
			
		}else if(sloc_num>0 && k) {			
			System.out.println("키워드 : " + keyword);
			System.out.println("작은지역 : " + sloc_num);
			totalRowCount=service.count(map);
			pu=new PageUtil(pageNum, totalRowCount, 6, 5);
			int startRow=pu.getStartRow()-1;
			map.put("startRow", startRow);	
			list=service.keyword_list(map);
			mv.addObject("keyword",keyword);
			mv.addObject("sloc_num",sloc_num);
			System.out.println("6 키워드랑 작은지역 둘다 들어왔을 때");
			
			
		}else if(s && e && k) {
			System.out.println("7 시작날짜, 끝날짜, 키워드 들어왔을 때");			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Timestamp start_Date = new Timestamp(((java.util.Date)df.parse(startDate)).getTime());
				Timestamp end_Date = new Timestamp(((java.util.Date)df.parse(endDate)).getTime());
				System.out.println(start_Date + "," + end_Date);
				map.put("start_Date",start_Date);
				map.put("end_Date",end_Date);
				totalRowCount=service.count(map);
				pu=new PageUtil(pageNum, totalRowCount, 6, 5);
				int startRow=pu.getStartRow()-1;
				map.put("startRow", startRow);	
				list=service.date_list(map);
				mv.addObject("keyword",keyword);
				mv.addObject("sloc_num",sloc_num);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
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
		mv.addObject("sloc_num",sloc_num);
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
