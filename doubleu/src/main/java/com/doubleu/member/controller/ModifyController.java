package com.doubleu.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.member.service.MemberService;
import com.doubleu.member.vo.MemberVo;

@RestController
public class ModifyController {
	@Autowired
	MemberService memberService;
	@RequestMapping(value = "/memberModify", method= RequestMethod.POST)
	public String memberList(Model model) {
		//List<MemberVo> list = memberService.memberList();
		//model.addAttribute("list",list);
		return "member/modify.jsp";
	}
}
//수정완료되면 확인가능하도록
/*
 * @RequestMapping(value="/update.do") public String update(MemberVO vo) throws
 * Exception{ s.updateMember(vo); return "member_list.do"; }
 */
