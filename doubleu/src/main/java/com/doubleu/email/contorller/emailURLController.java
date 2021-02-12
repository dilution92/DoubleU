package com.doubleu.email.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class emailURLController {
	
	// email_index.jsp
	@RequestMapping(value="/emailIndex", method=RequestMethod.GET)
	public ModelAndView emailIndex() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("email/email_index");
		
		return mv;
	}
		
}
