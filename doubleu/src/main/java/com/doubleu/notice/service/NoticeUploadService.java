package com.doubleu.notice.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.doubleu.notice.vo.FamilyeventAttVo;


@Service
public class NoticeUploadService {
	String saveDir = "C:\\Users\\Sungyeon.Kang\\Documents\\DoubleU\\doubleu\\src\\main\\webapp\\WEB-INF\\upload\\notice\\";


	public List<FamilyeventAttVo> upload(List<MultipartFile> mul) {

		List<FamilyeventAttVo> attList = new ArrayList<>();
		String msg;

		try {
			for(MultipartFile m : mul) {
				File oriFile = new File(saveDir + m.getOriginalFilename());
				System.out.println(oriFile.toString());

				//file upload
				m.transferTo(oriFile); //사용자가 선택한 파일을 서버어떤공간으로 transfer

				FamilyeventAttVo vo = new FamilyeventAttVo();
				vo.setOriFile(m.getOriginalFilename());

				attList.add(vo);
			}

		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attList;

	}
}

