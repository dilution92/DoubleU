package com.doubleu.approval.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.doubleu.approval.vo.AttFileVo;
import com.doubleu.market.vo.MarketAttVo;

@Service
public class UploadService {
	String saveDir = "C:\\Users\\정해준\\문서\\DoubleU\\doubleu\\src\\main\\webapp\\WEB-INF\\upload\\approval\\";


	public  List<AttFileVo> upload(List<MultipartFile> mul) {
		List<AttFileVo> attList = new ArrayList<>();
		String msg;
		try {
	    for(MultipartFile m : mul) {
	    	if(m.getOriginalFilename() != "") {
	    	File oriFile = new File(saveDir + m.getOriginalFilename());
	    	System.out.println("oriFile : " +oriFile);
	    	//file upload
	    	m.transferTo(oriFile); //사용자가 선택한 파일을 서버어떤공간으로 transfer
	    	AttFileVo vo = new AttFileVo();
	    	vo.setOriFile(m.getOriginalFilename());
	    
	    	attList.add(vo);
	    	}
	    }
		}catch(Exception ex) {
			System.out.println("업로드된 파일이 없습니다.");
		}
		return attList;
		}
	
	
	public String upload
	}
