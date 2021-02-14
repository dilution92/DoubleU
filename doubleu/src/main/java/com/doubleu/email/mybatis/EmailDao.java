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
	
	public List<EmailMainVo> select() {
		
		List<EmailMainVo> list = mapper.select();
		System.out.println("EmailDao dao : " + list);
		
		return list;
	}
	
}
