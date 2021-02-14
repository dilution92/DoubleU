package com.doubleu.approval.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.approval.vo.ApprovalFormVo;

@Service
@Transactional
public class ApprovalDao {

	@Autowired
	ApprovalMapper mapper;
	
	public String insert(ApprovalFormVo vo) {
		String msg = "정상적으로 등록되었습니다.";
		System.out.println("service도착");
		int cnt = mapper.insert(vo);
		
		
		return msg;
	}
}
