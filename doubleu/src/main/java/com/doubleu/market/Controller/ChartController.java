package com.doubleu.market.Controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.ChartDao;
import com.doubleu.market.mybatis.MarketDao;

@Controller
public class ChartController {
		
	@Autowired
	ChartDao dao; 

	   @RequestMapping(value="/marketSelectPrice", method={RequestMethod.GET, RequestMethod.POST})
	   public ModelAndView getPrice(HttpServletRequest req){
			ModelAndView mv = new ModelAndView();

			String msg ;
			String findStr = req.getParameter("selectPrice");
			int cnt = dao.selectfindCnt(findStr);
			
			if (cnt>0) {
				
				int price= dao.selectPrice(findStr);
				
				List<Map<String, Object>> priceList = dao.selectPriceChart(findStr);
				
				mv.addObject("priceList", priceList);
				mv.addObject("price", price);
				mv.setViewName("market/market_price_range");
				
			}else  {
				msg = "정확한 상품명을 입력해주세요";
				mv.addObject("msg", msg);
				mv.setViewName("market/market_price_range");
			}
	        
	        return mv;

	    }
	   @RequestMapping(value="/marketSelectPricePopup", method={RequestMethod.GET, RequestMethod.POST})
	   public ModelAndView getPricePopup(HttpServletRequest req){
		   ModelAndView mv = new ModelAndView();
		   
		   String msg ;
		   String findStr = req.getParameter("selectPrice");
		   int cnt = dao.selectfindCnt(findStr);
		   
		   if (cnt>0) {
			   
			   int price= dao.selectPrice(findStr);
			   
			   List<Map<String, Object>> priceList = dao.selectPriceChart(findStr);
			   
			   mv.addObject("priceList", priceList);
			   mv.addObject("price", price);
			   mv.setViewName("market/market_price_popup");
			   
		   }else  {
			   msg = "정확한 상품명을 입력해주세요";
			   mv.addObject("msg", msg);
			   mv.setViewName("market/market_price_popup");
		   }
		   
		   return mv;
		   
	   }

	}