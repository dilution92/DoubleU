package com.doubleu.email.contorller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.doubleu.email.vo.AttEmailVo;



@Service
public class EmailUploadController {
	String saveDir = "C:\\Users\\user\\Desktop\\git\\DoubleU\\doubleu\\src\\main\\webapp\\WEB-INF\\upload\\email";


	public List<AttEmailVo> upload(List<MultipartFile> mul) {
		
		List<AttEmailVo> attFileList = new ArrayList<>();
		String msg ;
		
		try {
	    for(MultipartFile m : mul) {
	    	File oriFile = new File(saveDir + m.getOriginalFilename());
	    	System.out.println(oriFile.toString());
	    	
	    	//file upload
	    	m.transferTo(oriFile); //사용자가 선택한 파일을 서버어떤공간으로 transfer
	   
	    	AttEmailVo vo = new AttEmailVo();
	    	vo.setOriFile(m.getOriginalFilename());
	    
	    	attFileList.add(vo);
	    }
	    
	    	

		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attFileList;
	
	
		}
	}
