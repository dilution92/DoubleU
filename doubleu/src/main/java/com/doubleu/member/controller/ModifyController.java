package com.doubleu.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.doubleu.member.service.MemberService;
import com.doubleu.member.vo.MemberVo;
import com.doubleu.profile.service.ProfileService;
import com.doubleu.profile.vo.ProfileVo;
import com.doubleu.profile.vo.WorkVo;
import com.doubleu.login.vo.LoginVo;


@RestController
public class ModifyController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value="/memberModify",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView modify(LoginVo loginVo, MemberVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		loginVo = (LoginVo) session.getAttribute("member");	
		int memberNo = loginVo.getMemberNo();
		vo.setMemberNo(memberNo);
		
		List<MemberVo> list = memberService.selectOne(memberNo);
		mv.addObject("list", list);
		mv.setViewName("/member/modify");
		return mv;
	}
	@RequestMapping(value="/memberUpdate",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView update(MemberVo vo) {
		ModelAndView mv = new ModelAndView();
		memberService.memberUpdate(vo);
		
		mv.setViewName("redirect:/profileIndex");
		return mv;
	}
	
	@RequestMapping(value="/memberManage",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberManage() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<MemberVo> list = memberService.selectManage();
		System.out.println("@@@@list"+list);
		mv.addObject("contentList1", list);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("member/profile_index");
		return mv;
	}
	
	@RequestMapping(value="/memberBusiness",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberBusiness() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<MemberVo> list = memberService.selectBusiness();
		System.out.println("@@@@list"+list);
		mv.addObject("contentList1", list);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("member/profile_index");
		return mv;
	}
	
	@RequestMapping(value="/memberIT",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberIT() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<MemberVo> list = memberService.selectIT();
		System.out.println("@@@@list"+list);
		mv.addObject("contentList1", list);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("member/profile_index");
		return mv;
	}
	
	@RequestMapping(value="/memberDevelop",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberDevelop() {
		ModelAndView mv = new ModelAndView();
		System.out.println("컨트롤러 시작");
		List<MemberVo> list = memberService.selectDevelop();
		System.out.println("@@@@list"+list);
		mv.addObject("contentList1", list);
		System.out.println("부서검색 컨트롤러 끝");
		mv.setViewName("member/profile_index");
		return mv;
	}
}

