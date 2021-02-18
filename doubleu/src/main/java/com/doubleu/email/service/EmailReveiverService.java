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
		for(String a : emailReceiverAddress) {
			System.out.println(emailReceiverAddress);
			System.out.println(emailReceiverRef);
		}
		
		
		for(int i=0; i < emailReceiverAddress.length; i++) {
			
			EmailReceiverVo rev = new EmailReceiverVo();
			
			rev.setEmailReceiverAddress(emailReceiverAddress[i]);
			rev.setEmailReceiverRef(emailReceiverRef[i]);
			list.add(rev);
		}
		
		return list;

	}

}