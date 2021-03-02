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
}
//수정완료되면 확인가능하도록
/*
 * @RequestMapping(value="/update.do") public String update(MemberVO vo) throws
 * Exception{ s.updateMember(vo); return "member_list.do"; }
 */
