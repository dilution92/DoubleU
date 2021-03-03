package com.doubleu.email.contorller;

import java.net.http.HttpRequest;
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
import com.doubleu.email.service.SelectSerivce;
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
	
	@Autowired
	SelectSerivce selectService;

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
		
		// 받은 메일함 count 
		int cnt = selectService.selectSendEmail(req, session);
		int emailMailBox = 3; //보낸 메일함
		
		page.setEmailMailBox(emailMailBox);
		
		Map<String, Object> map = DaoService.selectPaging(page, session);
		System.out.println("page : " + page);
		
		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_index");

		return mv;
	}
	
	
	// 보낸 메일함
	@RequestMapping(value="/emailEmailT", 
			method={RequestMethod.GET, RequestMethod.POST})

	public ModelAndView emailEmailT(
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
		String memberAddress = loginVo.getMemberEmail();
		int EmailBox = 3;
		
		vo.setMemberMid(memberMid);
		vo.setEmailAddress(memberAddress);
		
		
		page.setMemberMid(memberMid);
		page.setEmailMailBox(EmailBox);
		page.setEmailAddress(memberAddress);
		
	

		int cnt = selectService.selectSendEmail(req, session);
	
		// 페이징
		Map<String, Object> map = DaoService.selectPaging(page, session);
		
		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_sendEmailT");

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

		String emailAddress = loginVo.getMemberEmail();
		String findStr = req.getParameter("emailFindStr");
		int mailBox = 3;
		
		page.setFindStr(findStr);
		page.setEmailAddress(emailAddress);
		page.setEmailMailBox(mailBox);
		
		
		
		Map<String, Object> map = DaoService.selectPaging(page, session);
		
		
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
			EmailPage page,
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
		List<AttEmailVo> attFileList = FileUpLoadService.upload(mul, req);
		vo.setAttFileList(attFileList);

		System.out.println("DaoService.insertSendWrite(vo) 실행 전");
		int cnt = DaoService.insertSendWrite(vo);
		
		page.setMemberMid(memberMid);
		
		// 받은 메일함 count 
		int readCnt = selectService.selectSendEmail(req, session);
		
		mv.addObject("EmailMainVo", vo);
		mv.addObject("readCnt", readCnt);
		mv.setViewName("email/email_result");

		return mv;
	}


	// email_read.jsp
	@RequestMapping(
			value="/emailRead", 
			method= {RequestMethod.GET, RequestMethod.POST})

	public ModelAndView emailRead(
			EmailMainVo vo,
			HttpServletRequest req,
			HttpSession session
			) {

		ModelAndView mv = new ModelAndView();
		
		String emailNo_ = req.getParameter("emailNoBtn");
		int emailNo = Integer.parseInt(emailNo_);

		System.out.println(emailNo);
		List<EmailMainVo> selectEmailNo = DaoService.selectEmailNo(emailNo);
		List<AttEmailVo> selectFiles = DaoService.selectFiles(emailNo);
		List<EmailReceiverVo> selectSendList= DaoService.selectSendPerson(emailNo);
		List<EmailReceiverVo> selectRefList= DaoService.selectRefPerson(emailNo);
		
		int cnt = selectService.selectSendEmail(req, session);
		
		mv.addObject("selectRefList", selectRefList);
		mv.addObject("selectSendList", selectSendList);
		mv.addObject("selectRead", selectEmailNo);
		mv.addObject("selectFiles", selectFiles);
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_read");

		return mv;
	}

	
	// email_write.jsp
	@RequestMapping(
			value="/emailWrite", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView emailWrite(
			EmailPage page,
			EmailMainVo vo,
			LoginVo loginVo,
			HttpSession session,
			HttpServletRequest req
			) {
	
		ModelAndView mv = new ModelAndView();

		loginVo = (LoginVo) session.getAttribute("member");	
		String memberMid = loginVo.getMemberMid();
		int memberNo = loginVo.getMemberNo();
		String emailAddress = loginVo.getMemberEmail();
		int EmailBox = 2;
		
		vo.setMemberMid(memberMid);
		vo.setMemberNo(memberNo);
		vo.setEmailAddress(emailAddress);
		
		page.setMemberMid(memberMid);
		page.setEmailMailBox(EmailBox);
		page.setEmailAddress(emailAddress);
		
		int cnt = selectService.selectSendEmail(req, session);
		
		
		
		List<LoginVo> memberList = DaoService.selectMembers();
		
		
		
		mv.addObject("readCnt", cnt);
		mv.addObject("memberList", memberList);
		mv.setViewName("email/email_write");

		return mv;
	}
	
	
	// 임시저장
	@RequestMapping(
			value="/emailTemp", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView emailTemp(
			@RequestParam("attEmailFileList") 
			List<MultipartFile> mul,
			EmailMainVo vo,
			LoginVo loginVo,
			EmailPage page,
			HttpServletRequest req,
			HttpSession session
			) {
		
		
		ModelAndView mv = new ModelAndView();

		loginVo = (LoginVo) session.getAttribute("member");	
		String memberMid = loginVo.getMemberMid();
		int memberNo = loginVo.getMemberNo();
		int EmailBox = 2; // 임시저장
		
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
		List<AttEmailVo> attFileList = FileUpLoadService.upload(mul, req);
		vo.setAttFileList(attFileList);
		
		int tempCnt = DaoService.insertTemporary(vo);
		
		page.setMemberMid(memberMid);
		page.setEmailMailBox(EmailBox);
		int cnt = selectService.selectSendEmail(req, session);
		
		
		
		
		System.out.println("임시저장 : " + tempCnt);
		
		mv.addObject("readCnt", cnt);
		mv.setViewName("redirect:/emailIndex");

		return mv;
	}
	
	// email_temporary.jsp
	@RequestMapping(value="/emailTempList", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView emailTempList(
			EmailMainVo vo,
			LoginVo loginVo,
			EmailPage page,
			HttpServletRequest req,
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView();
		
		int mailBox = 2; // 임시보관함
		page.setEmailMailBox(mailBox);
		
		int cnt = selectService.selectSendEmail(req, session);
		Map<String, Object> map = DaoService.selectTemp(page, session);
		
		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_temporary");

		return mv;
	}
	
	// 임시 저장 읽기
	@RequestMapping(
			value="/emailTempRead", 
			method= {RequestMethod.GET, RequestMethod.POST})

	public ModelAndView emailTempRead(
			EmailMainVo vo,
			HttpServletRequest req,
			HttpSession session
			) {

		ModelAndView mv = new ModelAndView();
		
		String emailNo_ = req.getParameter("emailNoBtn");
		int emailNo = Integer.parseInt(emailNo_);

		System.out.println(emailNo);
		List<EmailMainVo> selectEmailNo = DaoService.selectEmailNo(emailNo);
		List<AttEmailVo> selectFiles = DaoService.selectFiles(emailNo);
		List<EmailReceiverVo> selectSendList= DaoService.selectSendPerson(emailNo);
		List<EmailReceiverVo> selectRefList= DaoService.selectRefPerson(emailNo);
		
		int cnt = selectService.selectSendEmail(req, session);
		
		mv.addObject("selectRefList", selectRefList);
		mv.addObject("selectSendList", selectSendList);
		mv.addObject("selectRead", selectEmailNo);
		mv.addObject("selectFiles", selectFiles);
		mv.addObject("readCnt", cnt);
		mv.setViewName("email/email_tempRead");

		return mv;
	}
	
	// 메인 index에서 메일 휴지통으로 보내기
	@RequestMapping(
			value="/DeleteSendTrash", 
			method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView DeleteSendTrash(
			EmailMainVo vo,
			LoginVo loginVo,
			EmailPage page,
			HttpServletRequest req,
			HttpSession session) {

		ModelAndView mv = new ModelAndView();
		
		String values[] = req.getParameterValues("deleteBtnList");
		
		int mailBox = 5; // 휴지통
		
		String[] array = null;
		
		for(int i=0; i<values.length; i++) {
			String str = values[i];
			array = str.split(",");
		}
		
		for(String arrayList : array) {
			System.out.println(arrayList);
			int arrayListInt = Integer.parseInt(arrayList);
			vo.setEmailMailBox(mailBox);
			vo.setEmailNo(arrayListInt);
			int cnt = DaoService.updateSendTrash(vo);
		}
		
		mv.setViewName("redirect:/emailIndex");
		return mv;
	
	}
	
	// 휴지통
	@RequestMapping(value="/emailThash", method=RequestMethod.GET)
	public ModelAndView emailThash(
			EmailMainVo vo,
			LoginVo loginVo,
			EmailPage page,
			HttpServletRequest req,
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView();

		
		int mailBox = 5;
		page.setEmailMailBox(mailBox);
		
		int cnt = selectService.selectSendEmail(req, session);
		Map<String, Object> map = DaoService.selectTemp(page, session);
		
		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("readCnt", cnt);
		
		mv.setViewName("email/email_trash");

		return mv;
	}
	
	// email_spam.jsp
	@RequestMapping(value="/emailSpam", method=RequestMethod.GET)
	public ModelAndView emailSpam(
			EmailMainVo vo,
			LoginVo loginVo,
			EmailPage page,
			HttpServletRequest req,
			HttpSession session
			) {
		ModelAndView mv = new ModelAndView();

		
		int mailBox = 4; //스팸 메일함
		page.setEmailMailBox(mailBox);
		
		int cnt = selectService.selectSendEmail(req, session);
		Map<String, Object> map = DaoService.selectTemp(page, session);
		
		mv.addObject("page", map.get("page"));
		mv.addObject("list", map.get("pageList"));
		mv.addObject("readCnt", cnt);
		
		mv.setViewName("email/email_spam");

		return mv;
	}
	
	// email_important.jsp
		@RequestMapping(value="/emailImportant", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView emailImportant(
				EmailMainVo vo,
				LoginVo loginVo,
				EmailPage page,
				HttpServletRequest req,
				HttpSession session
				) {
			ModelAndView mv = new ModelAndView();

			
			int mailBox = 1; //중요 메일함
			page.setEmailMailBox(mailBox);
			
			int cnt = selectService.selectSendEmail(req, session);
			Map<String, Object> map = DaoService.selectTemp(page, session);
			
			mv.addObject("page", map.get("page"));
			mv.addObject("list", map.get("pageList"));
			mv.addObject("readCnt", cnt);
			mv.setViewName("email/email_important");

			return mv;
		}
		
		// 휴지통에서 전체삭제하기
		@RequestMapping(value="/emailDeleteAll", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView emailDeleteAll(
				EmailMainVo vo,
				LoginVo loginVo,
				EmailPage page,
				HttpServletRequest req,
				HttpSession session
				) {
			ModelAndView mv = new ModelAndView();

			
			String values[] = req.getParameterValues("deleteBtnList");
			String[] array = null;
			
			for(int i=0; i<values.length; i++) {
				String str = values[i];
				array = str.split(",");
			}
			
			for(String arrayList : array) {
				int arrayListInt = Integer.parseInt(arrayList);
				vo.setEmailNo(arrayListInt);
				int cnt = DaoService.updateAllDelete(vo);
			}
			
			mv.setViewName("redirect:/emailIndex");
			return mv;
		}
		
		// 스팸 차단 모달
		@RequestMapping(value="/emailSpamSelect", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView emailSpamSelect(
				EmailMainVo vo,
				LoginVo loginVo,
				EmailPage page,
				HttpServletRequest req,
				HttpSession session
				) {
			ModelAndView mv = new ModelAndView();
			
			int emailBox = 4; // 스팸 메일함
			vo.setEmailMailBox(emailBox);
			
			String values[] = req.getParameterValues("deleteBtnList");
			String[] array = null;
			
			for(int i=0; i<values.length; i++) {
				String str = values[i];
				array = str.split(",");
			}
			
			for(String arrayList : array) {
				System.out.println("emailSpamSelect" + arrayList);
				int arrayListInt = Integer.parseInt(arrayList);
				vo.setEmailNo(arrayListInt);
				
				int cnt = DaoService.updateSendTrash(vo); // 스팸 메일함으로 이동 update
			}
			
			mv.setViewName("redirect:/emailSpam");
			return mv;
		}
		
		// emailReplyRead
				@RequestMapping(value="/emailReplyRead", method={RequestMethod.GET, RequestMethod.POST})
				public ModelAndView emailReplyRead(
						EmailMainVo vo,
						EmailPage page,
						HttpServletRequest req,
						HttpSession session
						) {
					ModelAndView mv = new ModelAndView();
				
					mv.setViewName("email/email_reply");
					return mv;
				}
	
}


