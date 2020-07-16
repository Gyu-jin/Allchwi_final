package com.jhta.allchwi.controller.classopen;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.classopen.ClassDateService;
import com.jhta.allchwi.vo.classopen.ClassDateVO;

@Controller
public class ClassDateController {
	
	@Autowired
	private ClassDateService service;
	
	@GetMapping("/class/classDate")
	public String goClassDate() {
		
		return ".classOpen.classDate";
	}
	
	@GetMapping("/class/dateModal")
	public String goClassModal() {
		
		return "classOpen/dateModal";
	}
	
	@PostMapping("/class/classModal")
	@ResponseBody
	public String ClassDateInsert(@RequestParam(value = "startDate[]",defaultValue = "")List<String> startDate,
									@RequestParam(value = "startTime[]",defaultValue = "")List<String> startTime,
									@RequestParam(value = "endTime[]",defaultValue = "")List<String> endTime,
									@RequestParam HashMap<String, Object> formdata) {
		int class_count =  Integer.parseInt((String)formdata.get("class_count"));
		int class_form =  Integer.parseInt((String)formdata.get("class_form"));
		int class_num =  Integer.parseInt((String)formdata.get("class_num"));
		int class_month =  Integer.parseInt((String)formdata.get("monthDate"));
		
		String class_comment = (String)formdata.get("class_comment");
		String class_msg = (String)formdata.get("class_msg");
		System.out.println(class_form);
		if(class_form == 0) {
				
			for(int i = 0; i< class_count; i++) {
				String startD = startDate.get(i);
				String class_startTime = startTime.get(i);
				String class_endTime = endTime.get(i);
				SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
				Date date;
				try {
					date = format.parse(startD);
					Timestamp class_date = new Timestamp(date.getTime());
					ClassDateVO vo = new ClassDateVO(0, 110, class_date, class_startTime, class_endTime, class_comment, class_msg, 0, 0, i+1, null);
					System.out.println("--------- "+i+"번째 ---------");
					System.out.println("class_num  : " + vo.getClass_num());
					System.out.println("class_date : " + vo.getClass_date());
					System.out.println("class_startTime : " + vo.getClass_endTime());
					System.out.println("class_endTime : " + vo.getClass_endTime());
					System.out.println("class_comment : " + vo.getClass_comment());
					System.out.println("class_msg : " + vo.getClass_msg());
					int n = service.insert(vo);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}else {
			SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
			Date date;
			try {
				String startD = startDate.get(0);
				date = format.parse(startD);
				Timestamp class_date = new Timestamp(date.getTime());
				ClassDateVO vo = new ClassDateVO(0, 110, class_date, null, null, class_comment, class_msg, class_month, 0, 1, null);
				int n = service.insert(vo);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}	
		
		
		return "success";
	}
	
}
