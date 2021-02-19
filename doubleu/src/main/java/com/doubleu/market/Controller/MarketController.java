package com.doubleu.market.Controller;

import java.util.List;
import java.util.Map;

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
	
	//select결과화면->index
	@RequestMapping(value="/marketSelect" , method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketSelect(MarketPage page) {
		ModelAndView mv = new ModelAndView();
		
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = dao.select(page);
		int cnt = dao.selectCount();

		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		mv.addObject("cnt", cnt);
		mv.setViewName("market/market_index");
		
		return mv;
	}
	
	//insert결과화면->index
	@RequestMapping(value="/marketInsertR", method= {RequestMethod.GET , RequestMethod.POST})
	public ModelAndView marketInsertR(@RequestParam("attList") List<MultipartFile> mul, 
								@ModelAttribute MarketVo vo, @ModelAttribute MarketPage page) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<MarketAttVo> attList = fu.upload(mul);
		
		vo.setAttlist(attList);
		System.out.println("attList: " + vo.getAttlist());
		System.out.println("marketInsertR.....");
		System.out.println("가격 : " +vo.getMarketPrice());
		msg = dao.insert(vo);
		System.out.println(msg);
		/*System.out.println("catenum : " + vo.getCategoryNo());
		System.out.println("membersno: "+ vo.getMembersNo());
		System.out.println("subject : "+vo.getMarketSubject());
		System.out.println("price: "+vo.getMarketPrice());
		System.out.println("account: " +vo.getMarketAccount());
		System.out.println("hit : " +vo.getMarketHit());
		System.out.println("doc : " + vo.getMarketDoc());
		System.out.println("date: " + vo.getMarketDate());
		System.out.println("attList" + vo.getAttlist());*/
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		Map<String, Object> map = dao.select(page);
		
		int cnt = dao.totalCount();
		
		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		mv.addObject("cnt", cnt);
		mv.setViewName("redirect:/marketIndex");
		return mv;
	}
}
