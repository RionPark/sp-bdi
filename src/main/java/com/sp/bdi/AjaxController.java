package com.sp.bdi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AjaxController {
	private List<String> list = new ArrayList<String>();
	public AjaxController() {
		for(int i=1;i<=10;i++) {
			list.add("name" + i);
		}
	}
	
	@RequestMapping(value="/ajax", method=RequestMethod.GET)
	public @ResponseBody List<String> getAjax(@RequestParam Map<String,String> map) {
		log.debug("param=>{}", map);
		String searchName = map.get("searchName");
		
		if(searchName==null || searchName.trim().equals("")) {
			return this.list;
		}
		List<String> list  = new ArrayList<String>();
		for(String str : this.list) {
			if(str.indexOf(searchName)!=-1) {
				list.add(str);
			}
		}
		
		return list;
	}
	@RequestMapping(value="/ajax", method=RequestMethod.POST)
	public @ResponseBody Map<String,String> postAjax(@RequestParam Map<String,String> map) {
		log.debug("param=>{}", map);
		Map<String,String> rMap = new HashMap<String,String>();
		rMap.put("greeting", "hello");
		return rMap;
	}

	@RequestMapping(value="/ajax", method=RequestMethod.DELETE)
	public @ResponseBody List<String> deleteAjax(@RequestBody Map<String,String> map) {
		int idx = list.indexOf(map.get("searchName"));
		if(idx!=-1) {
			list.remove(idx);
		}
		return list;
	}
	@RequestMapping(value="/ajax/json", method=RequestMethod.POST)
	public @ResponseBody List<String> postJson(@RequestBody Map<String,String> map) {
		log.debug("param=>{}", map);
		String searchName = map.get("searchName");
		if(list.indexOf(searchName)==-1) {
			list.add(searchName);
		}
		return list;
	}
	
	public static void main(String[] args) {
		long startTime = System.currentTimeMillis();
//		for(int i=1;i<=1000000;i++) {
//			
//		}
//		System.out.println("execute time : " + (System.currentTimeMillis()-startTime));

//		for(int i=1;i<=1000000;i++) {
//			System.out.print(i);
//		}
//		System.out.println();
//		System.out.println("execute time : " + (System.currentTimeMillis()-startTime));
	}
}









