package com.doubleu.market.Controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.mybatis.MarketDibDao;
import com.doubleu.market.vo.MarketDibVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@Controller
public class MarketUrlController {
	@Autowired
	MarketDao dao;
	
	@Autowired
	MarketDibDao Ddao;
	
	// market_index.jsp
	@RequestMapping(value="/marketIndex",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView marketIndex(HttpServletRequest req, 
			MarketDibVo dibvo,MarketVo vo, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		

		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = dao.select(page);
		
		int cnt = dao.totalCount();
		
		
		String dibUser = req.getParameter("dibUser");
		System.out.println("index user :"+dibUser);
		dibvo.setDibUser(dibUser);
		Map<String, Object> dMap = Ddao.selectDiblist(dibvo);

		int hitCnt = vo.getMarketHit();
		hitCnt = hitCnt+1;
		vo.setMarketHit(hitCnt);
		String msg = dao.updateHit(vo);
		System.out.println(msg);
		
		mv.addObject("marketlist", dMap.get("list"));
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
	public ModelAndView marketView(@RequestParam("dibUser") String dibUser,
			MarketDibVo dibvo,MarketVo v, MarketPage page) {
		ModelAndView mv = new ModelAndView();
		System.out.println("marketNo: " + v.getMarketNo());
		MarketVo vo = dao.view(v.getMarketNo());
		
		int hitCnt = vo.getMarketHit();
		hitCnt = hitCnt+1;
		vo.setMarketHit(hitCnt);
		String msg = dao.updateHit(vo);
		System.out.println(msg);
		int cnt = Ddao.selectDib(dibvo);
		
		dibvo.setDibUser(dibUser);
		Map<String, Object> dMap = Ddao.selectDiblist(dibvo);
		
		vo.setMarketHit(hitCnt);
		mv.addObject("marketlist", dMap.get("list"));
		mv.addObject("vo", vo);
		mv.addObject("cnt", cnt);
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
