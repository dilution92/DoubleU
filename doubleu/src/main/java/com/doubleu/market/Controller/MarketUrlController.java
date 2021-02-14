package com.doubleu.market.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MarketUrlController {
	
	// market_index.jsp
	@RequestMapping(value="/marketIndex", method=RequestMethod.GET)
	public ModelAndView emailIndex() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("market/market_index");
		
		return mv;
	}
	
	// market_price_range.jsp
	@RequestMapping(value="/marketPriceRange", method=RequestMethod.GET)
	public ModelAndView marketPriceRange() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("market/market_price_range");
		
		return mv;
	}
	
	
	// market_insert.jsp
	@RequestMapping(value="/marketInsert", method=RequestMethod.GET)
	public ModelAndView marketInsert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("market/market_insert");
		
		return mv;
	}
	
	// market_view.jsp
	@RequestMapping(value="/marketView", method=RequestMethod.GET)
	public ModelAndView marketView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("market/market_view");
		
		return mv;
	}
	
	
	// market_update.jsp
	@RequestMapping(value="/marketUpdate", method=RequestMethod.GET)
	public ModelAndView marketUpdate() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("market/market_update");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/marketNewpage")
	public ModelAndView marketNewpage() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("market/market_price_popup");
		return mv;
		
	}
		
}
