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
	
	
	// 메일 읽기
	public List<EmailMainVo> selectSendRead() {
		
		List<EmailMainVo> list = mapper.selectSendRead();
		System.out.println("selectSendRead() : " + list);
		
		return list;
	}
	
	
	// 메일 보내기
	public int insertSendWrite(EmailMainVo vo) {
		
		int cnt = mapper.insertSendWrite(vo);
		
		System.out.println("insertSendWrite() : " + cnt);
		
		return cnt;
	}
	
}
