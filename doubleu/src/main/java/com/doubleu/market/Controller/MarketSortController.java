package com.doubleu.market.Controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.mybatis.SortDao;
import com.doubleu.market.vo.MarketPage;

@Controller
public class MarketSortController {
	@Autowired
	SortDao dao; 
	@Autowired
	MarketDao Mdao; 
	
	 @RequestMapping(value="/marketLowprice", method={RequestMethod.GET, RequestMethod.POST})
	   public ModelAndView marketLowprice(HttpServletRequest req, MarketPage page){
			ModelAndView mv = new ModelAndView();

			String findStr = "";
			String findType = "";
			
			if(page ==null || page.getNowPage()==0) {
				page.setNowPage(1);
			}
			if(req.getParameter("findStr") != null) {
				findStr = req.getParameter("findStr");
			}
			if(req.getParameter("findType") != null) {
				findType = req.getParameter("findType");
			}
			
			page.setFindType(findType);
			page.setFindStr(findStr);
			Map<String, Object> map = dao.selectLowprice(page);
			int cnt = Mdao.selectCount(page);
			mv.addObject("list", map.get("list"));
			mv.addObject("page", map.get("page"));
			mv.addObject("cnt", cnt);
			mv.setViewName("market/market_index");
			
	        
	        return mv;

	    }
	 @RequestMapping(value="/marketLatest", method={RequestMethod.GET, RequestMethod.POST})
	 public ModelAndView marketLatest(HttpServletRequest req,MarketPage page){
		 ModelAndView mv = new ModelAndView();
		 
		 String findStr = "";
			String findType = "";
			
			if(page ==null || page.getNowPage()==0) {
				page.setNowPage(1);
			}
			if(req.getParameter("findStr") != null) {
				findStr = req.getParameter("findStr");
			}
			if(req.getParameter("findType") != null) {
				findType = req.getParameter("findType");
			}
			
			page.setFindType(findType);
			page.setFindStr(findStr);
		 Map<String, Object> map = dao.selectLatest(page);
			int cnt = Mdao.selectCount(page);
		 
		 mv.addObject("list", map.get("list"));
		 mv.addObject("page", map.get("page"));
		 mv.addObject("cnt", cnt);
		 mv.setViewName("market/market_index");
		 
		 
		 return mv;
		 
	 }
	
}
