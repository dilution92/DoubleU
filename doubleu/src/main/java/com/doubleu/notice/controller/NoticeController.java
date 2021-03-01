package com.doubleu.notice.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.notice.service.FamilyeventService;
import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.service.NoticeUploadService;
import com.doubleu.notice.vo.FamilyeventAttVo;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeAttVo;
import com.doubleu.notice.vo.NoticeVo;

@RestController
public class NoticeController {
	@Autowired
	NoticeService service1;
	
	@Autowired
	FamilyeventService service2;
	
	@Autowired
	NoticeUploadService file;
	
/* -------------------- 사내공지 -------------------- */

	
	// 사내공지 글쓰기 -> index
	@RequestMapping(value = "/noticeInsertR", method= RequestMethod.POST)
	public ModelAndView noticeInsertR(NoticeVo vo) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		msg = service1.insert(vo);
		mv.addObject("viewMsg", msg);
		mv.setViewName("redirect:/noticeIndex");
		return mv;
	}

	// 사내공지 index view
	@RequestMapping(value = "/noticeView", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView noticeView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVo vo = service1.view(no); 
		List<NoticeAttVo> att = service1.view1(no);
		mv.addObject("obj", vo);
		mv.addObject("att", att);
		
		mv.setViewName("notice/notice_view");
		return mv;
	}
   
   // 경조사 index update
   @RequestMapping(value = "/noticeUpdateR", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeUpdate(NoticeVo vo){
      ModelAndView mv = new ModelAndView();
	  String msg = service1.update(vo);
	  System.out.println(msg);
	  List<NoticeVo> contentList1 = service1.select();
      mv.addObject("contentList1", contentList1);
      mv.setViewName("/notice/notice_index");
	  return mv;
   }
   
   // 경조사 index delete
   @RequestMapping(value = "/noticeDeleteR", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView noticeDelete(@RequestParam int no){
	  System.out.println("delete");
      ModelAndView mv = new ModelAndView();
	  String msg = "";
	  msg = service1.delete(no);
	  mv.setViewName("redirect:/noticeIndex");
	  System.out.println(msg);
	  return mv;
   }

	

/* -------------------- 경조사 -------------------- */
	
	// 경조사 글쓰기 -> index
	@RequestMapping(value = "/familyeventInsertR", method= RequestMethod.POST)
	public ModelAndView familyeventInsertR(FamilyeventVo vo,
										@RequestParam("familyeventFile") List<MultipartFile> mul) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		List<FamilyeventAttVo> attList = file.upload(mul);
		vo.setAttList(attList);
		
		msg = service2.insert(vo);
		mv.addObject("viewMsg", msg);
		mv.setViewName("redirect:/familyeventIndex");
		return mv;
	}
	
	
	// 경조사 index view
	@RequestMapping(value = "/familyeventView", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView familyeventView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView();
		
		FamilyeventVo vo = service2.view(no);
		List<FamilyeventAttVo> att = service2.view1(no);
		mv.addObject("obj", vo);
		mv.addObject("att", att);
		System.out.println(att.get(0).getOriFile());
		
		mv.setViewName("notice/familyevent_view");
		return mv;
	}
   
   // 경조사 index update
   @RequestMapping(value = "/familyeventUpdateR", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventUpdate(FamilyeventVo vo){
      ModelAndView mv = new ModelAndView();
	  String msg = service2.update(vo);
	  System.out.println(msg);
	  List<FamilyeventVo> contentList = service2.select();
      mv.addObject("contentList", contentList);
      mv.setViewName("/notice/familyevent_index");
	  return mv;
   }
   
   // 경조사 index delete
   @RequestMapping(value = "/familyeventDeleteR", method = {RequestMethod.POST, RequestMethod.GET})
   public ModelAndView familyeventDelete(@RequestParam int no){
	  System.out.println("delete");
      ModelAndView mv = new ModelAndView();
	  String msg = "";
	  msg = service2.delete(no);
	  mv.setViewName("redirect:/familyeventIndex");
	  System.out.println(msg);
	  return mv;
   }
}
