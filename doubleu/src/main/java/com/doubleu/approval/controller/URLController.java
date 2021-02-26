package com.doubleu.approval.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doubleu.approval.mybatis.ApprovalDao;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.approval.vo.SelectPage;

@RestController
public class URLController {

	@Autowired
	ApprovalDao service;
	
	@RequestMapping(value = "/FileDownload")
	public String FileDownload(HttpServletRequest req, HttpServletResponse resp) throws Exception  {
		String msg = "정상적으로 다운로드 되었습니다.";
		String fileName = req.getParameter("file");
		String directory = req.getServletContext().getRealPath("/WEB-INF/upload/approval");
		File file = new File(directory + "/" + fileName);
		
		String mimeType = req.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			resp.setContentType("application/octet-stream"); //2진 데이터 형식을 전달할 때 사용
		}
		
		String downloadName = null;
		if(req.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		resp.setHeader("Content_disposition", "attachment;filename=\"" + downloadName+"\";");
		
		FileInputStream fileInputStream = new FileInputStream(file); 
		ServletOutputStream servletOutputStream = resp.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		while((data = (fileInputStream.read(b,0,b.length))) != -1) {
			System.out.println(data);
			servletOutputStream.write(b, 0, data);
		}
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
		return msg;
	}
	
	
	@RequestMapping(value = "/approvalGoFormType")
	public ModelAndView goFormType(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		String formType = req.getParameter("formType");
		
		/*
		 * String nowPlace = req.getParameter("nowPlace");
		 * System.out.println("nowPlace: " + nowPlace);
		 * if(nowPlace.equals("indexPlace")) { String nowOutgoingPage =
		 * req.getParameter("nowOutgoingPage"); String nowReceiverPage =
		 * req.getParameter("nowReceiverPage");
		 * 
		 * System.out.println("nowOutgoingPage: "+ nowOutgoingPage);
		 * System.out.println("nowReceiverPage: "+ nowReceiverPage); } else { String
		 * nowChooseSelectPage = req.getParameter("nowChooseSelectPage");
		 * System.out.println("nowChooseSelectPage: " + nowChooseSelectPage); }
		 */
		System.out.println(formType);
		String mainJob = null;
		String formName = null;

		
		switch(formType) {
		case "업무기안" :
			mainJob = "insert/approval_insert_work.jsp";
			formName = "업무 기안";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "업무협조" :
			mainJob = "insert/approval_insert_work.jsp";
			formName = "업무 협조";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "품의서" :
			mainJob = "insert/approval_insert_petition.jsp";
			formName = "품의서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "구매품의서" :
			mainJob = "insert/approval_insert_purchasePetition.jsp";
			formName = "구매품의서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "사유서" :
			mainJob = "insert/approval_insert_explanatory.jsp";
			formName = "사유서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "휴가신청서" :
			mainJob = "insert/approval_insert_vacation.jsp";
			formName = "휴가 신청서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "지각/결근사유서" :
			mainJob = "insert/approval_insert_explanatory.jsp";
			formName = "지각/결근 사유서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		case "지출결의서" :
			mainJob = "insert/approval_insert_purchasePetition.jsp";
			formName = "지출결의서";
			mv.addObject("mainJob", mainJob);
			mv.addObject("formName", formName);
			break;
		}
		
		mv.addObject("btns", "approval_insert_btns.jsp");
		mv.addObject("formType", formType);
		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
	
	@RequestMapping(value = "/approvalGoView")
	public ModelAndView goView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		
		int formNo = Integer.parseInt(req.getParameter("formNo"));
		String formType = null;
		int formState = formNo;
		String mainJob = null;
		switch(formType) {
		case "업무기안" : 
			mainJob = "view/approval_view_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		
		case "업무협조" : 
			mainJob = "view/approval_view_work.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "품의서" : 
			mainJob = "view/approval_view_petition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "구매품의서" : 
			mainJob = "view/approval_view_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "사유서" : 
			mainJob = "view/approval_view_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "휴가신청서" : 
			mainJob = "view/approval_view_vacation.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "지각/결근사유서" : 
			mainJob = "view/approval_view_explanatory.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		case "지출결의서" : 
			mainJob = "view/approval_view_purchasePetition.jsp";
			mv.addObject("mainJob", mainJob);
			break;
		}
		
		mv.setViewName("/ElectronicApproval/approval_index");
		return mv;
	}
}
