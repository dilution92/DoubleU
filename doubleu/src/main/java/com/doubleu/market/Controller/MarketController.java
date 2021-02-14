package com.doubleu.market.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.market.mybatis.MarketDao;
import com.doubleu.market.vo.MarketAttVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;


@RestController
public class MarketController {

	@Autowired
	MarketDao dao; 
	
	@Autowired
	MarketUploadController fu;
	
	@RequestMapping(value="/bInsertR", method=RequestMethod.POST)
	public ModelAndView insertR(@RequestParam("attList") List<MultipartFile> mul, 
								@ModelAttribute MarketVo vo, @ModelAttribute MarketPage page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<MarketAttVo> attList = fu.upload(mul);
		
		vo.setAttlist(attList);
		
		msg = dao.insert(vo);
		System.out.println("subject : "+vo.getMarketSubject());
		mv.setViewName("market/market_index");
		return mv;
	}
}
