package com.doubleu.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.notice.mybatis.NoticeMapper;
import com.doubleu.notice.vo.NoticeVo;

@Service
public class NoticeService {
	@Autowired
	NoticeMapper mapper;
	
	public String insert(NoticeVo vo) {
		String msg = "정상 입력 됨";
		int cnt = mapper.insert(vo);
		return msg;
	}
}
