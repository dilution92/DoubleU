package com.doubleu.market.Controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;

@Controller
public class ChartController {
		
	@Autowired
	MarketDao dao; 

		@RequestMapping(value="/marketSelectPrice", method={RequestMethod.GET, RequestMethod.POST})
	   public ModelAndView getPrice(HttpServletRequest req){
			ModelAndView mv = new ModelAndView();

			String findStr = req.getParameter("selectPrice");
			int price= dao.selectPrice(findStr);
	        System.out.println("컨트롤러가격:"+price);
	        mv.addObject("price", price);
	        mv.setViewName("market/market_price_range");
	        
	        return mv;
	 
	    }

	}

