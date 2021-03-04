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

import com.doubleu.login.vo.LoginVo;
import com.doubleu.member.vo.MemberVo;
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
	
	@RequestMapping(value="/work_index", method={RequestMethod.GET,RequestMethod.POST})
	public  ModelAndView work_index(Model model) {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<WorkVo> contentList2 = service2.selectWork();
		model.addAttribute("contentList2", contentList2);
		mv.setViewName("member/workIndex");
		return mv;
	}
	
	@RequestMapping(value="selectWork1",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectWork1() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<WorkVo> contentList2 = service2.selectWork1();
		System.out.println("@@@@list"+contentList2);
		mv.addObject("contentList2", contentList2);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("/member/workStatus");
		return mv;
	}
	
	@RequestMapping(value="selectWork2",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectWork2() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<WorkVo> contentList2 = service2.selectWork2();
		System.out.println("@@@@list"+contentList2);
		mv.addObject("contentList2", contentList2);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("/member/workStatus");
		return mv;
	}
	
	@RequestMapping(value="selectWork3",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView selectWork3() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<WorkVo> contentList2 = service2.selectWork3();
		System.out.println("@@@@list"+contentList2);
		mv.addObject("contentList2", contentList2);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("/member/workStatus");
		return mv;
	}
	
	@RequestMapping(value = "/startWork", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView startWork(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 실행");
		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		int no = loginVo.getMemberNo();
		WorkVo vo = service2.startWork(no);
		
		mv.addObject("work", vo);
		mv.setViewName("redirect:/mainPage");
	
		return mv;
	
	}
	
	@RequestMapping(value = "/endWork", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView endWork(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 실행");
		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		int no = loginVo.getMemberNo();
		WorkVo vo = service2.endWork(no);
		
		mv.addObject("work", vo);
		mv.setViewName("redirect:/mainPage");
		return mv;
	
	}
	
}