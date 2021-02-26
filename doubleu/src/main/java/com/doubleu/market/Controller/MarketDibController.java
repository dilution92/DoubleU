package com.doubleu.market.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.mybatis.MarketDibDao;
import com.doubleu.market.vo.MarketDibVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;
@RestController

public class MarketDibController {
	@Autowired
	MarketDibDao dao;
	
	@Autowired
	MarketDao Mdao;
	
	@RequestMapping(value="/marketDib", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketDib(@RequestParam("dibUser") String dibUser, @RequestParam("marketNo") int marketNo,
									MarketDibVo dibvo, MarketVo vo, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		String msg= null;
		int cnt = 0;
		
		dibvo.setMarketNo(marketNo);
		dibvo.setDibUser(dibUser);
		msg = dao.insertDib(dibvo);
		System.out.println(msg);
		
		cnt = dao.selectDib(dibvo);
		System.out.println(cnt);
		vo.setMarketNo(marketNo);
		vo = Mdao.view(marketNo);
		
		
		
		mv.addObject("cnt", cnt);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("/market/market_view");

		return mv;
	}
	@RequestMapping(value="/marketDibdown", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketDibdown(@RequestParam("dibUser") String dibUser, @RequestParam("marketNo") int marketNo,
									MarketDibVo dibvo,MarketVo vo, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		String msg= null;
		int cnt = 0;
		dibvo.setMarketNo(marketNo);
		dibvo.setDibUser(dibUser);
		
		cnt = dao.deleteDib(dibvo);
		
		
		vo.setMarketNo(marketNo);
		vo = Mdao.view(marketNo);
		mv.addObject("cnt", cnt);
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("/market/market_view");
		
		return mv;
	}
}
