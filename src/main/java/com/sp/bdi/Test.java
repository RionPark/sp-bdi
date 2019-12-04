package com.sp.bdi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {

	public static void main(String[] args) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("uiNum", "91");
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		list.add(map);
		List<Map<String,String>> list2= new ArrayList<Map<String,String>>();
		for(Map<String,String> ui : list) {
			list2.add(ui);
		}

		System.out.println(list ==list2);
		System.out.println(list.get(0) ==list2.get(0));
	}
}
