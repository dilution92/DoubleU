package com.doubleu.email.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	
	
	// 메일 보내기
	public int insertSendWrite(EmailMainVo vo) {
		
		System.out.println("insertSendWrite mybatis 데이터 실행 전");
		int cnt = mapper.insertSendWrite(vo);
		System.out.println("insertSendWrite mybatis 데이터 실행 후 : " + cnt);
		
		return cnt;
	}
	
}
