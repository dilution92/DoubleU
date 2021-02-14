package com.doubleu.market.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.doubleu.market.vo.MarketAttVo;


@Service
public class MarketUploadController {
	String saveDir = "C:\\Users\\wotjd\\Documents\\DoubleU\\doubleu\\src\\main\\webapp\\WEB-INF\\upload\\market\\";


	public  List<MarketAttVo> upload(List<MultipartFile> mul) {
		List<MarketAttVo> attList = new ArrayList<>();
		String msg ;
		try {
	    for(MultipartFile m : mul) {
	    	File oriFile = new File(saveDir + m.getOriginalFilename());
	    	System.out.println(oriFile.toString());
	    	
	    	//file upload
	    	m.transferTo(oriFile); //사용자가 선택한 파일을 서버어떤공간으로 transfer
	   
	    	MarketAttVo vo = new MarketAttVo();
	    	vo.setOriFile(m.getOriginalFilename());
	    
	    	attList.add(vo);
	    }
	    
	    	

		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attList;
	
	
		}
	}
