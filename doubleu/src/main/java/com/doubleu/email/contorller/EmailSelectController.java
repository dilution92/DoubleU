package com.doubleu.email.contorller;

import java.net.http.HttpRequest;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.service.EmailReveiverService;
import com.doubleu.email.service.EmailUploadService;
import com.doubleu.email.service.SelectSerivce;
import com.doubleu.email.service.SelectMoveFolderService;
import com.doubleu.email.vo.AttEmailVo;
import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.email.vo.EmailReceiverVo;
import com.doubleu.login.vo.LoginVo;

@RestController
public class EmailSelectController {

	/* DI ──────────────────────────────────────────────────────────────────────── */

	@Autowired
	EmailDao DaoService;

	@Autowired
	SelectMoveFolderService emailMoveService; 

	/* 이동하기 ────────────────────────────────────────────────────────────────────────── */

	
	// 중요 메일함
		@RequestMapping(value="/selectImpMailBtn", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView selectImpMailBtn(
				EmailMainVo vo,
				EmailPage page,
				HttpServletRequest req,
				HttpSession session
				) {
			ModelAndView mv = new ModelAndView();
			
			int emailBox = 1; //중요 메일함
			vo.setEmailMailBox(emailBox);
			
			int cnt = emailMoveService.selectMoveFolder(req, vo);
		
			mv.setViewName("redirect:/emailIndex");
			return mv;
		}
	
	
	// 스팸 메일함
	@RequestMapping(value="/selectSendMailBtn", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView emailSpamSelect(
			EmailMainVo vo,
			EmailPage page,
			HttpServletRequest req,
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView();
		
		int emailBox = 4; //스팸 메일함
		vo.setEmailMailBox(emailBox);
		
		int cnt = emailMoveService.selectMoveFolder(req, vo);
	
		mv.setViewName("redirect:/emailIndex");
		return mv;
	}
	
	// 임시 메일함
		@RequestMapping(value="/selectTempMailBtn", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView selectTempMailBtn(
				EmailMainVo vo,
				EmailPage page,
				HttpServletRequest req,
				HttpSession session
				) {
			ModelAndView mv = new ModelAndView();
			
			int emailBox = 2; //중요 메일함
			vo.setEmailMailBox(emailBox);
			
			int cnt = emailMoveService.selectMoveFolder(req, vo);
		
			mv.setViewName("redirect:/emailIndex");
			return mv;
		}
		// 휴지통
		@RequestMapping(value="/selectTrashMailBtn", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView selectTrashMailBtn(
				EmailMainVo vo,
				EmailPage page,
				HttpServletRequest req,
				HttpSession session
				) {
			ModelAndView mv = new ModelAndView();
			
			int emailBox = 5; //휴지통
			vo.setEmailMailBox(emailBox);
			
			int cnt = emailMoveService.selectMoveFolder(req, vo);
			System.out.println("트레쉬메일 ----------" + cnt);
			mv.setViewName("redirect:/emailIndex");
			return mv;
		}
		
		
}


