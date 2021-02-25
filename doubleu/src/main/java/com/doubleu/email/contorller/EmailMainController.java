package com.doubleu.email.contorller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.service.EmailReveiverService;
import com.doubleu.email.service.EmailUploadService;
import com.doubleu.email.vo.AttEmailVo;
import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.email.vo.EmailReceiverVo;
import com.doubleu.login.vo.LoginVo;

@RestController
public class EmailMainController {

	/* DI ──────────────────────────────────────────────────────────────────────── */

	@Autowired
	EmailDao DaoService;

	@Autowired 
	// 파일
	EmailUploadService FileUpLoadService; 

	@Autowired
	// 메일쓰기 받은 사람
	EmailReveiverService emailReveiverService;

	/* ────────────────────────────────────────────────────────────────────────── */


	//email_index.jsp	
	@RequestMapping(value="/emailIndex", 
			method={RequestMethod.GET, RequestMethod.POST})

	public ModelAndView emailIndex(
			LoginVo loginVo,
			EmailMainVo vo,
			HttpServletRequest req,
			HttpSession session,
			EmailPage page
			) {

		ModelAndView mv = new ModelAndView();
		
		// 세션값 가져오기
		loginVo = (LoginVo) session.getAttribute("member");	
		String memberMid = loginVo.getMemberMid();
		vo.setMemberMid(memberMid);
		
		// 받은 메일함 count 
		int cnt = DaoService.selectSendEmail(memberMid);	
	
		// 페이징
		Map<String, Object> map = DaoService.selectPaging(page, session, loginVo);
		
		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_index");

		return mv;
	}
	
	

	// 메일 검색 바 내용, email_name 으로 검색
	@RequestMapping(value="/selectFindStr", 
			method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectFindStr(
			EmailMainVo vo,
			HttpServletRequest req,
			EmailPage page,
			LoginVo loginVo,
			HttpSession session
			) {

		ModelAndView mv = new ModelAndView();

		String memberMid = loginVo.getMemberMid();
		vo.setMemberMid(memberMid);
		
		String findStr = req.getParameter("emailFindStr");
		page.setFindStr(findStr);
		
		Map<String, Object> map = DaoService.selectPaging(page, session, loginVo);
		
		
		mv.addObject("page", map.get("page"));
		mv.addObject("findStrResult", map.get("pageList"));
		mv.setViewName("email/ajax/email_select_search");

		return mv;
	}


	// email_result.jsp
	@RequestMapping(value="/emailResult", 
			method={RequestMethod.GET, RequestMethod.POST})

	public ModelAndView emailResult(
			@RequestParam("attEmailFileList") 
			List<MultipartFile> mul,
			@ModelAttribute EmailMainVo vo, 
			HttpServletRequest req,
			LoginVo loginVo,
			HttpSession session
			) {

		ModelAndView mv = new ModelAndView();

		loginVo = (LoginVo) session.getAttribute("member");	
		String memberMid = loginVo.getMemberMid();
		int memberNo = loginVo.getMemberNo();
		vo.setMemberMid(memberMid);
		vo.setMemberNo(memberNo);
		
		// 메일 쓰기 받은 사람
		List<EmailReceiverVo> emailRevList = emailReveiverService.insertRev(req);
		vo.setEmailRevList(emailRevList);

		// 중요 표시 체크
		String emailChk = req.getParameter("emailChk");

		if(emailChk == null) {
			emailChk = "";
			vo.setEmailChk(emailChk);
		}else {
			emailChk = "!";
			vo.setEmailChk(emailChk);
		}

		// 파일 업로드 
		List<AttEmailVo> attFileList = FileUpLoadService.upload(mul);
		vo.setAttFileList(attFileList);

		System.out.println("DaoService.insertSendWrite(vo) 실행 전");
		int cnt = DaoService.insertSendWrite(vo);

		mv.addObject("EmailMainVo", vo);
		mv.setViewName("email/email_result");

		return mv;
	}


	// email_read.jsp
	@RequestMapping(
			value="/emailRead", 
			method= {RequestMethod.GET, RequestMethod.POST})

	public ModelAndView emailRead(
			EmailMainVo vo,
			HttpServletRequest req

			) {

		ModelAndView mv = new ModelAndView();

		String emailNo_ = req.getParameter("emailNoBtn");
		int emailNo = Integer.parseInt(emailNo_);

		System.out.println(emailNo);
		List<EmailMainVo> selectEmailNo = DaoService.selectEmailNo(emailNo);
		List<AttEmailVo> selectFiles = DaoService.selectFiles(emailNo);
		List<EmailReceiverVo> selectSendList= DaoService.selectSendPerson(emailNo);
		List<EmailReceiverVo> selectRefList= DaoService.selectRefPerson(emailNo);
		
		mv.addObject("selectRefList", selectRefList);
		mv.addObject("selectSendList", selectSendList);
		mv.addObject("selectRead", selectEmailNo);
		mv.addObject("selectFiles", selectFiles);
		mv.setViewName("email/email_read");

		return mv;
	}

	
	// email_write.jsp
	@RequestMapping(
			value="/emailWrite", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView emailWrite(
			EmailMainVo vo,
			LoginVo loginVo,
			HttpSession session
			) {
	
		ModelAndView mv = new ModelAndView();

		loginVo = (LoginVo) session.getAttribute("member");	
		String memberMid = loginVo.getMemberMid();
		vo.setMemberMid(memberMid);
		
		int cnt = DaoService.selectSendEmail(memberMid);	
		
		int tempCnt = DaoService.insertTemporary(vo, session, loginVo);
		System.out.println(tempCnt);
		
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_write");

		return mv;
	}
	
	
	// 임시저장
	@RequestMapping(
			value="/emailTemp", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView emailTemp(
			EmailMainVo vo,
			LoginVo loginVo,
			HttpServletRequest req,
			HttpSession session
			) {
		
		
		ModelAndView mv = new ModelAndView();

		loginVo = (LoginVo) session.getAttribute("member");	
		String memberMid = loginVo.getMemberMid();
		int memberNo = loginVo.getMemberNo();
		
		vo.setMemberMid(memberMid);
		vo.setMemberNo(memberNo);
		
		System.out.println("테스트 ----------" + vo);
		
		String emailTitle = req.getParameter("emailTitle");
		
		if(emailTitle == null || emailTitle.equals("")) {
			emailTitle = "제목없음";
		}
		
		int cnt = DaoService.selectSendEmail(memberMid);	
		
		
		int tempCnt = DaoService.insertTemporary(vo, session, loginVo);
		System.out.println(tempCnt);
		
		mv.addObject("title", emailTitle);
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_write");

		return mv;
	}

}


