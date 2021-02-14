package com.doubleu.email.contorller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.vo.EmailMainVo;

@RestController
public class emailURLController {

	@Autowired
	EmailDao service;
	
	// email_index.jsp
	@RequestMapping(value="/emailIndex", method=RequestMethod.GET)
	public ModelAndView emailIndex(EmailMainVo vo) {
		
		ModelAndView mv = new ModelAndView();

		
		List<EmailMainVo> list = service.select();
		
		mv.addObject("list", list);
		mv.setViewName("email/email_index");

		return mv;
	}


	// email_important.jsp
	@RequestMapping(value="/emailImportant", method=RequestMethod.GET)
	public ModelAndView emailImportant() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_important");

		return mv;
	}


	// email_keep_one.jsp 내 메일함 `NOTES`
	@RequestMapping(value="/emailKeepOne", method=RequestMethod.GET)
	public ModelAndView emailKeepOne() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_keep_one");

		return mv;
	}

	// email_keep_two.jsp 내 메일함 `보관함`
	@RequestMapping(value="/emailKeepTwo", method=RequestMethod.GET)
	public ModelAndView emailKeepTwo() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_keep_two");

		return mv;
	}	

	// email_read.jsp
	@RequestMapping(value="/emailRead", method=RequestMethod.GET)
	public ModelAndView emailRead() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_read");

		return mv;
	}


	// email_result.jsp
	@RequestMapping(value="/emailResult", method=RequestMethod.GET)
	public ModelAndView emailResult() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_result");

		return mv;
	}


	// email_sendEmail.jsp
	@RequestMapping(value="/emailSendEmail", method=RequestMethod.GET)
	public ModelAndView emailSendEmail() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_sendEmail");

		return mv;
	}	

	// email_sendRead.jsp
	@RequestMapping(value="/emailSendRead", method=RequestMethod.GET)
	public ModelAndView emailSendRead() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_sendRead");

		return mv;
	}

	// email_spam.jsp
	@RequestMapping(value="/emailSpam", method=RequestMethod.GET)
	public ModelAndView emailSpam() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_spam");

		return mv;
	}

	// email_temporary_write.jsp
	@RequestMapping(value="/emailTempWrite", method=RequestMethod.GET)
	public ModelAndView emailTempWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_temporary_write");

		return mv;
	}

	// email_temporary.jsp
	@RequestMapping(value="/emailTemp", method=RequestMethod.GET)
	public ModelAndView emailTemp() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_temporary");

		return mv;
	}

	// email_trash.jsp
	@RequestMapping(value="/emailThash", method=RequestMethod.GET)
	public ModelAndView emailThash() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/ email_trash");

		return mv;
	}

	// email_write.jsp
	@RequestMapping(value="/emailWrite", method=RequestMethod.GET)
	public ModelAndView emailWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_write");

		return mv;
	}






}
