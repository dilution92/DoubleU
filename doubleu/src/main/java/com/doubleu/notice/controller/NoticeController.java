package com.doubleu.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.login.vo.LoginVo;
import com.doubleu.notice.service.FamilyeventService;
import com.doubleu.notice.service.NoticeService;
import com.doubleu.notice.service.NoticeUploadService;
import com.doubleu.notice.vo.FamilyeventAttVo;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeAttVo;
import com.doubleu.notice.vo.NoticePage;
import com.doubleu.notice.vo.NoticeVo;

@RestController
public class NoticeController {
	@Autowired
	NoticeService service1;

	@Autowired
	FamilyeventService service2;

	@Autowired
	NoticeUploadService file;

	/* -------------------- 공지사항 -------------------- */

	// 공지사항 글쓰기 -> index
	@RequestMapping(value = "/noticeInsertR", method = RequestMethod.POST)
	public ModelAndView noticeInsertR(NoticeVo vo, NoticePage page, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);

		String msg = "";
		msg = service1.insert(vo);

		mv.addObject("loginName", loginName);
		mv.addObject("viewMsg", msg);

		// 페이징
		Map<String, Object> map = service1.selectPaging(page);

		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.setViewName("redirect:/noticeIndex");

		return mv;
	}

	// 공지사항 view
	@RequestMapping(value = "/noticeView", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeView(@RequestParam int no, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		service1.updateHit(no);
		NoticeVo vo = service1.view(no);
		List<NoticeAttVo> att = service1.view1(no);
		mv.addObject("obj", vo);
		mv.addObject("att", att);

		mv.setViewName("notice/notice_view");
		return mv;
	}

	// 공지사항 update
	@RequestMapping(value = "/noticeUpdateR", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeUpdate(NoticeVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		String msg = service1.update(vo);
		System.out.println(msg);
		List<NoticeVo> contentList1 = service1.select();
		mv.addObject("contentList1", contentList1);
		mv.setViewName("redirect:/noticeIndex");
		return mv;
	}

	// 공지사항 delete
	@RequestMapping(value = "/noticeDeleteR", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView noticeDelete(@RequestParam int no, HttpSession session) {
		System.out.println("delete");
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		String msg = "";
		msg = service1.delete(no);
		mv.setViewName("redirect:/noticeIndex");
		System.out.println(msg);
		return mv;
	}

	

	/* -------------------- 경조사 -------------------- */

	// 경조사 글쓰기 -> index
	@RequestMapping(value = "/familyeventInsertR", method = RequestMethod.POST)
	public ModelAndView familyeventInsertR(FamilyeventVo vo, NoticePage page, HttpSession session,
			@RequestParam("familyeventFile") List<MultipartFile> mul) {
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		String msg = "";
		List<FamilyeventAttVo> attList = file.upload(mul);
		vo.setAttList(attList);

		msg = service2.insert(vo);
		// 페이징
		Map<String, Object> map = service1.selectPaging(page);

		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("viewMsg", msg);
		mv.setViewName("redirect:/familyeventIndex");
		return mv;
	}

	// 경조사 view
	@RequestMapping(value = "/familyeventView", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView familyeventView(@RequestParam int no, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		service2.updateHit(no);
		FamilyeventVo vo = service2.view(no);
		List<FamilyeventAttVo> att = service2.view1(no);
		mv.addObject("obj", vo);
		mv.addObject("att", att);

		mv.setViewName("notice/familyevent_view");
		return mv;
	}

	// 경조사 update
	@RequestMapping(value = "/familyeventUpdateR", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView familyeventUpdate(FamilyeventVo vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		String msg = service2.update(vo);
		System.out.println(msg);
		List<FamilyeventVo> contentList = service2.select();
		mv.addObject("contentList", contentList);
		mv.setViewName("redirect:/familyeventIndex");
		return mv;
	}

	// 경조사 delete
	@RequestMapping(value = "/familyeventDeleteR", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView familyeventDelete(@RequestParam int no, HttpSession session) {
		System.out.println("delete");
		ModelAndView mv = new ModelAndView();

		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		String loginName = loginVo.getMemberName();
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + loginName);
		mv.addObject("loginName", loginName);

		String msg = "";
		msg = service2.delete(no);
		mv.setViewName("redirect:/familyeventIndex");
		System.out.println(msg);
		return mv;
	}
}
