package com.doubleu.email.contorller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


@RestController
public class emailURLController {
	
	


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


	// email_temporary_write.jsp
	@RequestMapping(value="/emailTempWrite", method=RequestMethod.GET)
	public ModelAndView emailTempWrite() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("email/email_temporary_write");

		return mv;
	}



}
