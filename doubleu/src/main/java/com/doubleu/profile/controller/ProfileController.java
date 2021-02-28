package com.doubleu.profile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.service.WorkService;
import com.doubleu.profile.vo.ProfileVo;
import com.doubleu.profile.vo.WorkVo;

@RestController
public class ProfileController {
	@Autowired
	ProfileService service1;
	
	@Autowired
	WorkService service2;
	
	@GetMapping("/profile_index")
	public String profile_index(Model model) {
		System.out.println("select 컨트롤러 시작");
		
		List<ProfileVo> contentList1 = service1.selectProfile();
		model.addAttribute("contentList1", contentList1);
		return "member/profile_index";
	}
	
	@GetMapping("/work_index")
	public String work_index(Model model) {
		System.out.println("select 컨트롤러 시작");
		
		List<WorkVo> contentList2 = service2.selectWork();
		model.addAttribute("contentList2", contentList2);
		return "member/workStatus";
	}
}