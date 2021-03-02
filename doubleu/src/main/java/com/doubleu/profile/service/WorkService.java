package com.doubleu.profile.service;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		List<WorkVo> list2 = mapper.selectWork();
		System.out.println("select mapper 반환");
		return list2;
	}
	
	public WorkVo startWork(int no) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		String date = time1.substring(0, 10);
		String time2 = time1.substring(11, 19);
		
		WorkVo vo = selectWorkOne(no);
		if(vo.getWorkStart() != null && vo.getWorkFinish() != null) {
			WorkVo newVo = new WorkVo();
			vo.setMemberNo(no);
			vo.setWorkDate(date);
			vo.setWorkStart(time2);
			mapper.startWork(newVo);
		}else if(vo.getWorkStart() != null && vo.getWorkFinish() == null ){
			// 찍을 이유 없음
		}else if(vo.getWorkStart() == null && vo.getWorkFinish() == null ){
			WorkVo newVo = new WorkVo();
			vo.setMemberNo(no);
			vo.setWorkDate(date);
			vo.setWorkStart(time2);
			mapper.startUpdateWork(newVo);
		}else {
			System.out.println("예외 발생");
		}
		
		WorkVo vo2 = selectWorkOne(no);
		
		
		
		return vo2;
	}
	
public String endWork(int no) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		String date = time1.substring(0, 10);
		String time2 = time1.substring(11, 19);
		
		mapper.endWork(no , date , time2);
		
		
		System.out.println(date);
		System.out.println(time2);
		
		return time2;
	}

	public WorkVo selectWorkOne(int no) {
		WorkVo vo = mapper.selectWorkOne(no);
		return vo;
	}
}