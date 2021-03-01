package com.doubleu.market.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.mybatis.MarketDibDao;
import com.doubleu.market.mybatis.MarketReplDao;
import com.doubleu.market.vo.MarketDibVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketReplVo;
import com.doubleu.market.vo.MarketVo;

@RestController
public class MarketReplController {
	@Autowired
	MarketDao dao;
	
	@Autowired
	MarketDibDao Ddao;
	
	@Autowired
	MarketReplDao replDao; 
	
	@RequestMapping(value="/marketReplInsert", method={RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketReplInsert(@RequestParam("dibUser") String dibUser,
			MarketDibVo dibvo,MarketVo v, MarketPage page, MarketReplVo rvo) {
		ModelAndView mv = new ModelAndView();
		System.out.println("marketNo: " + v.getMarketNo());
		MarketVo vo = dao.view(v.getMarketNo());
		
		int cnt = Ddao.selectDib(dibvo);
		
		dibvo.setDibUser(dibUser);
		Map<String, Object> dMap = Ddao.selectDiblist(dibvo);
		
		System.out.println("dibuser:"+dibUser);
		
		//댓글입력
		//rvo.setReplWriter(dibUser);
		rvo.setMarketNo(v.getMarketNo());
		String replMsg = replDao.insert(rvo);

		//댓글조회
		int marketNo = v.getMarketNo();
		Map<String, Object> replMap  = replDao.select(marketNo);
		mv.addObject("marketRepllist", replMap.get("list"));
		mv.addObject("marketlist", dMap.get("list"));
		mv.addObject("vo", vo);
		mv.addObject("cnt", cnt);
		mv.addObject("page", page);
		mv.setViewName("market/market_view");
		
		return mv;
	}
	
	@RequestMapping(value="/marketReplModi", method=RequestMethod.GET)
	public ModelAndView marketReplModi(MarketVo v, MarketPage page,
			@RequestParam("replDocmodi") String replDoc,
			@RequestParam("marketNo") int marketNo,
			MarketReplVo rvo) {
		ModelAndView mv = new ModelAndView();
		System.out.println(replDoc);
		
		MarketVo vo = dao.view(v.getMarketNo());
		int replNo = rvo.getReplNo();
		System.out.println("수정시 replNo :"+replNo);
		rvo.setMarketNo(marketNo);
		rvo.setReplDoc(replDoc);
		String msg = replDao.update(rvo);
		System.out.println("replDao완");
		System.out.println(msg);
		
		Map<String, Object> replMap  = replDao.select(marketNo);
		
		mv.addObject("marketRepllist", replMap.get("list"));
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("market/market_view");
		
		return mv;
	}
	@RequestMapping(value="/marketReplDel", method=RequestMethod.GET)
	public ModelAndView marketReplDel(MarketVo v, MarketPage page,
			@RequestParam("marketNo") int marketNo,
			MarketReplVo rvo) {
		ModelAndView mv = new ModelAndView();
		
		MarketVo vo = dao.view(v.getMarketNo());
		int replNo = rvo.getReplNo();
		System.out.println("수정시 replNo :"+replNo);
		rvo.setMarketNo(marketNo);
		
		String msg = replDao.delete(rvo);
		System.out.println("replDao완");
		System.out.println(msg);
		
		Map<String, Object> replMap  = replDao.select(marketNo);
		
		mv.addObject("marketRepllist", replMap.get("list"));
		mv.addObject("vo", vo);
		mv.addObject("page", page);
		mv.setViewName("market/market_view");
		
		return mv;
	}
}
