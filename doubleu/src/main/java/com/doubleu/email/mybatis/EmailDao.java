package com.doubleu.email.mybatis;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.email.vo.AttEmailVo;
import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.email.vo.EmailReceiverVo;
import com.doubleu.login.vo.LoginVo;


@Service
@Transactional
public class EmailDao {
	
	@Autowired
	EmailMapper mapper;
	
	
	// mybatis 실행
	
	
	// 메일 읽기
	public List<EmailMainVo> selectSendRead(String memberMid) {
		
		List<EmailMainVo> list = mapper.selectSendRead(memberMid);
		
		return list;
	}
	
	// 메일 왼쪽 사이드바 받은 메일함 count;
	public int selectSendEmail() {
		
		int cnt = mapper.selectSendEmail();
		System.out.println("받은 메일함 : " + cnt);
		return cnt;
		
	}
	
	// 검색bar
	
	public List<EmailMainVo> selectSearch(String findStr) {
		
		List<EmailMainVo> list = mapper.selectFindStr(findStr);
		System.out.println(list);
		
		return list;
	}
	
	
	// 1.1 보낸 사람, 제목, 기간
	public List<EmailMainVo> selectSearchName(
			String findName, 
			String findContents, 
			String findDate
			) {
		
		List<EmailMainVo> list = mapper.selectSearchDetail(
				findName, findContents, findDate);
		System.out.println(list);
		
		return list;
		
	}
	
	// 메일 보내기
	public int insertSendWrite(EmailMainVo vo) {
		
		System.out.println("insertSendWrite mybatis 데이터 실행 전");
		int cnt = mapper.insertSendWrite(vo);
		System.out.println("insertSendWrite mybatis 데이터 실행 후 : " + cnt);
		
		return cnt;
	}
	
	public List<EmailMainVo> selectEmailNo(int emailNo) {
		
		System.out.println("selectEmailNo");
		List<EmailMainVo> list = mapper.selectEmailNo(emailNo);
		System.out.println(list);
		
		return list;
	}
	
	public List<AttEmailVo> selectFiles(int emailNo) {
		List<AttEmailVo> list = mapper.selectFiles(emailNo);
		System.out.println(list);
		
		return list;
	}

	// 받는 사람
	public List<EmailReceiverVo> selectSendPerson(int emailNo) {
		List<EmailReceiverVo> list = mapper.selectSendPerson(emailNo);
		System.out.println("selectSend : " + list);
		
		return list;

	}

	// 참조
	public List<EmailReceiverVo> selectRefPerson(int emailNo) {
		List<EmailReceiverVo> list = mapper.selectRefPerson(emailNo);
		System.out.println("selectRefPerson : " + list);
		
		return list;
	}
	
	
	
	// 페이징 처리
	public int totListSizeMain(EmailPage page, HttpSession session, LoginVo vo) {
		
		vo = (LoginVo) session.getAttribute("member");
		String memberMid = vo.getMemberMid();
		page.setMemberMid(memberMid);
		
		int totListSize = mapper.totListSizeMain(page);
		System.out.println(page);
		
		page.setTotListSize(totListSize);
		page.pageCompute();
		return totListSize;
		
	}
	
	// 페이징 처리
	public List<EmailMainVo> selectPaging(EmailPage page, HttpSession session, LoginVo vo) {
		
		vo = (LoginVo) session.getAttribute("member");
		String memberMid = vo.getMemberMid();
		page.setMemberMid(memberMid);
		List<EmailMainVo> list = mapper.selectPaging(page);
		System.out.println("selectP : " + list);
		
		return list;
	}
	
	
}
