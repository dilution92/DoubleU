package com.doubleu.profile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.profile.mybatis.ProfileMapper;
import com.doubleu.profile.vo.WorkVo;


@Service
public class WorkService {

	@Autowired
	ProfileMapper mapper;

	public List<WorkVo> selectWork(){
		System.out.println("select 시작");
		List<WorkVo> list = mapper.selectWork();
		System.out.println("select mapper 반환");
		return list;
	}
}