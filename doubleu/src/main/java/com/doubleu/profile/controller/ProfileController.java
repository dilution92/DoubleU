package com.doubleu.profile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.vo.ProfileVo;

@RestController
public class ProfileController {
	@Autowired
	ProfileService service;
	
	@GetMapping("/profile_index")
	public String profile_index(Model model) {
		System.out.println("select 컨트롤러 시작");
		
		List<ProfileVo> contentList = service.select();
		model.addAttribute("contentList", contentList);
		return "member/profile_index";
	}
}