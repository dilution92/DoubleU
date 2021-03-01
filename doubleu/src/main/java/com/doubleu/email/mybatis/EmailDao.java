package com.doubleu.email.mybatis;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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

	// 메일 왼쪽 사이드바 받은 메일함 count;

	public int selectSendEmail(EmailMainVo vo) {
		
		int cnt = mapper.selectSendEmail(vo);		
		System.out.println("받은 메일함 : " + cnt);
		return cnt;
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

		int totListSize = mapper.totListSizeMain(page);
		System.out.println(page);

		page.setTotListSize(totListSize);
		page.pageCompute();
		return totListSize;

	}

	// 페이징 처리
	public Map<String, Object> selectPaging(
			EmailPage page, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<EmailMainVo> pageList = null;
		
		LoginVo loginVo = (LoginVo) session.getAttribute("member");
		
		String emailAddress = loginVo.getMemberEmail();
		
		page.setEmailAddress(emailAddress);

		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
	
		
		System.out.println(page.getNowPage());
		System.out.println(page.getFindStr());
		
		int totListSize = mapper.totListSizeMain(page);
		
		page.setTotListSize(totListSize);
		page.pageCompute();

		System.out.println("totListSize " + totListSize);

		pageList = mapper.selectPaging(page);
		System.out.println("테스트 pageList" + pageList);
		
		map.put("page", page);
		map.put("pageList", pageList);

		
		return map;

	}

	// 임시저장
	public int insertTemporary(EmailMainVo vo) {
	
		int cnt = mapper.insertTemporary(vo);
		System.out.println("임시 저장 cnt : " + cnt);
		return cnt;
	}

	
	// 주소록 멤버 조회
	public List<LoginVo> selectMembers() {
		
		List<LoginVo> loginList = mapper.selectMembers();
		System.out.println("loginList --->" + loginList); 
		return loginList;
		
	}
	
	// 삭제하기
	public int updateSendTrash(EmailMainVo vo) {
		
		int cnt = mapper.updateSendTrash(vo);
		System.out.println("업데이트 행 " + cnt);
		return cnt;
	}
}
