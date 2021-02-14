package com.doubleu.approval.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.doubleu.approval.vo.ApprovalAttFileVo;
import com.doubleu.market.vo.MarketAttVo;

@Service
public class ControllerApprovalUpload {
	String saveDir = "C:\\Users\\정해준\\OneDrive\\문서\\DoubleU\\doubleu\\src\\main\\webapp\\WEB-INF\\upload\\approval\\";


	public  List<ApprovalAttFileVo> upload(List<MultipartFile> mul) {
		List<ApprovalAttFileVo> attList = new ArrayList<>();
		String msg;
		try {
	    for(MultipartFile m : mul) {
	    	File oriFile = new File(saveDir + m.getOriginalFilename());
	    	System.out.println(oriFile.toString());
	    	
	    	//file upload
	    	m.transferTo(oriFile); //사용자가 선택한 파일을 서버어떤공간으로 transfer
	   
	    	ApprovalAttFileVo vo = new ApprovalAttFileVo();
	    	vo.setOriFile(m.getOriginalFilename());
	    
	    	attList.add(vo);
	    }
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attList;
		}
	}
