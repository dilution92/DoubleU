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
		System.out.println("@@@@@@@@@@@@@@     "+date+"     @@@@@@@@@@@@@@@@@@@@@@@@@@");
		WorkVo vo = selectWorkOne(no);
		System.out.println("셀렉트원 완료");
		if(vo.getWorkStart() != null && vo.getWorkFinish() != null) {
			System.out.println("1111111111111111111111111111111");

			WorkVo newVo = new WorkVo();
			newVo.setMemberNo(no);
			newVo.setWorkDate(date);
			newVo.setWorkStart(time2);
			mapper.startWork(newVo);
		}else if(vo.getWorkStart() != null && vo.getWorkFinish() == null ){
			// 찍을 이유 없음
		}else if(vo == null ){
			WorkVo newVo = new WorkVo();
			newVo.setMemberNo(no);
			newVo.setWorkDate(date);
			newVo.setWorkStart(time2);
			mapper.startWork(newVo);
		}else {
			System.out.println("예외 발생");
		}
		System.out.println("출근 계산 완료");
		WorkVo vo2 = selectWorkOne(no);
		return vo2;
	}
	
public WorkVo endWork(int no) {
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date time = new Date();
	String time1 = format1.format(time);
	String date = time1.substring(0, 10);
	String time2 = time1.substring(11, 19);
	System.out.println("@@@@@@@@@@@@@@     "+date+"     @@@@@@@@@@@@@@@@@@@@@@@@@@");
	WorkVo vo = selectWorkOne(no);
	System.out.println("셀렉트원 완료");
	if(vo.getWorkStart() != null && vo.getWorkFinish() == null) {
		System.out.println("1111111111111111111111111111111");
		vo.setWorkFinish(time2);
		mapper.endWork(vo);
	}else if(vo.getWorkStart() == null && vo.getWorkFinish() !=null ){
		System.out.println("출근하지 않았다고 알람뜨게 하고 싶음");
	}else if(vo.getWorkStart() == null && vo.getWorkFinish() == null ){
		System.out.println("출근하지 않았다고 알람뜨게 하고 싶음");
	}else if(vo.getWorkStart() != null && vo.getWorkFinish() != null ){
		System.out.println("출근을 먼저 누르세요");
	}else {
		System.out.println("예외발생");
	}
	System.out.println("퇴근 계산 완료");
		WorkVo vo2 = selectWorkOne(no);
		return vo2;
	}

	public WorkVo selectWorkOne(int no) {
		WorkVo vo = mapper.selectWorkOne(no);
		return vo;
	}
	
	public WorkVo selectMain(int no) {
		WorkVo vo = mapper.selectMain(no);
		return vo;
	}
}