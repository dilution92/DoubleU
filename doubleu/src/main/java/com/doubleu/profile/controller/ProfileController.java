package com.doubleu.profile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "/startWork", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView startWork(@RequestParam int no) {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 실행");
		WorkVo vo = service2.startWork(no);
		
		mv.addObject("startVo", vo);
		mv.setViewName("MainPage/index");
		return mv;
	
	}
	
	@RequestMapping(value = "/endWork", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView endWork(HttpSession req) {
		ModelAndView mv = new ModelAndView();
		int no = (int) req.getAttribute("MemberNo");
		String endTime = service2.endWork(no);
		
		mv.addObject("endTime", endTime);
		mv.setViewName("MainPage/index");
		return mv;
	
	}
	
}