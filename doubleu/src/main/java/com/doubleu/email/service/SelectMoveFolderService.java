package com.doubleu.email.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.email.mybatis.EmailDao;
import com.doubleu.email.vo.EmailMainVo;

@Service
public class SelectMoveFolderService {
	
	@Autowired
	EmailDao DaoService;
	
	public int selectMoveFolder(HttpServletRequest req, EmailMainVo vo) {
		
		String values[] = req.getParameterValues("deleteBtnList");
		String[] array = null;
		int cnt = 0;
		
		for(int i=0; i<values.length; i++) {
			String str = values[i];
			array = str.split(",");
		}
		
		
		for(String arrayList : array) {
			System.out.println("selectMoveFolder" + arrayList);
			int arrayListInt = Integer.parseInt(arrayList);
			vo.setEmailNo(arrayListInt);
			cnt = DaoService.updateSendTrash(vo); 
			System.out.println("selectMoveFolder-------" + cnt);
		}
		
	
		
		return cnt;
		
	}
}
