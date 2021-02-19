package com.doubleu.email.service;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import com.doubleu.email.vo.EmailReceiverVo;



@Service
public class EmailReveiverService {

	public List<EmailReceiverVo> insertRev(HttpServletRequest req) {
		
		List<EmailReceiverVo> list = new ArrayList<>();
		
		// 메일 쓰기 받은 사람, 참조 배열로 받기
		String[] emailReceiverAddress = req.getParameterValues("emailReceiverAddress");
		String[] emailReceiverRef = req.getParameterValues("emailReceiverRef"); 
		
		
		// 출력 테스트
		for(String print : emailReceiverAddress) {
			System.out.println(print);
		}
		
		for(String print : emailReceiverRef) {
			System.out.println(print);
		}
		
		// 받는 사람
		for(int i=0; i < emailReceiverAddress.length; i++) {
			
			EmailReceiverVo rev = new EmailReceiverVo();
			rev.setEmailReceiverAddress(emailReceiverAddress[i]);
			rev.setEmailReceiverRef(0); // 0이면 미참조
			list.add(rev);
		}
		
		// 참조
		for(int i=0; i < emailReceiverRef.length; i++) {
			
			EmailReceiverVo rev = new EmailReceiverVo();
			rev.setEmailReceiverAddress(emailReceiverRef[i]);
			rev.setEmailReceiverRef(1); // 1이면 참조
			list.add(rev);
		}
		
		
		return list;

	}

}