package com.doubleu.email.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.email.vo.AttEmailVo;
import com.doubleu.email.vo.EmailMainVo;

@Service
@Transactional
public class EmailDao {
	
	@Autowired
	EmailMapper mapper;
	
	
	// mybatis 실행
	
	
	// 메일 읽기
	public List<EmailMainVo> selectSendRead() {
		
		List<EmailMainVo> list = mapper.selectSendRead();
		System.out.println("selectSendRead() : " + list);
		
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
	
	
	
	
}
