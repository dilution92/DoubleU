package com.doubleu.market.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@Controller
public class MarketUrlController {
	@Autowired
	MarketDao dao;
	
	// market_index.jsp
	@RequestMapping(value="/marketIndex",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView marketIndex(MarketPage page) {
		ModelAndView mv = new ModelAndView();
		

		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = dao.select(page);
		
		int cnt = dao.totalCount();
		
		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		mv.addObject("attList", map.get("attList"));
		mv.addObject("cnt", cnt);
		mv.setViewName("market/market_index");
		//System.out.println("list size: " + map.get("list").toString());
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
	@RequestMapping(value="/marketView", method={RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketView(MarketVo v, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		System.out.println("marketNo: " + v.getMarketNo());
		MarketVo vo = dao.view(v.getMarketNo());
		
		//System.out.println("view컨트롤러......");
		//System.out.println("페이지:" + page.getNowPage());
		//System.out.println(page.getFindStr());
		//System.out.println(vo.getMarketSubject());
		//System.out.println("att:"+vo.getAttlist());
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("market/market_view");
		
		return mv;
	}
	
	
	// market_update.jsp
	@RequestMapping(value="/marketUpdate", method=RequestMethod.GET)
	public ModelAndView marketUpdate(MarketVo v, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		MarketVo vo = dao.view(v.getMarketNo());
		mv.addObject("vo", vo);
		mv.addObject("page", page);
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
