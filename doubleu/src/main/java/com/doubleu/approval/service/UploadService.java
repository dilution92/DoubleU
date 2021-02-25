package com.doubleu.approval.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import com.doubleu.approval.vo.AttFileVo;
import com.doubleu.market.vo.MarketAttVo;

@Service
public class UploadService {
	String saveDir;
	int maxSize = 1024*1024*100;
	String encoding = "utf-8";
	MultipartRequest mul;

	public  List<AttFileVo> upload(List<MultipartFile> mul, HttpServletRequest req) {
		String realPath = req.getServletContext().getRealPath("WEB-INF/upload/approval/");
		this.saveDir = realPath;
		List<AttFileVo> attList = new ArrayList<>();
		try {
			for(MultipartFile m : mul) {
				if(!m.getOriginalFilename().equals("")) {
					File oriFile = new File(realPath + m.getOriginalFilename());
					System.out.println("저장 경로 : " +oriFile);
					String uploadFileName = m.getOriginalFilename();
					uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

					UUID uuid = UUID.randomUUID();
					uploadFileName = uuid.toString() + "_" + uploadFileName;
					File saveFile = new File(realPath, uploadFileName);
					m.transferTo(saveFile);
					//file upload
					//사용자가 선택한 파일을 서버어떤공간으로 transfer
					AttFileVo attFile = new AttFileVo();
					attFile.setOriFile(m.getOriginalFilename());
					attFile.setSysFile(uploadFileName);
					System.out.println("추가되야할 파일:" +attFile.getSysFile());
					attList.add(attFile);
				}
			}
			if(attList.isEmpty()) {
				throw new Exception();
			}
		}catch(Exception ex) {
			System.out.println("업로드된 파일이 없습니다.");
		}
		return attList;
	}



	public List<AttFileVo> deleteSystemFile(HttpServletRequest req) {

		List<AttFileVo> delList = new ArrayList<AttFileVo>();
		try {
			if(req.getParameterValues("delSysFile").length > 0) {
				System.out.println("파일삭제 로직 진입");
				String[] delFiles = req.getParameterValues("delSysFile");
				if(delFiles.length > 0) {
					for(String file : delFiles) {
						System.out.println("file : " + file);
						AttFileVo delFile = new AttFileVo();
						delFile.setSysFile(file);
						delList.add(delFile);
					}
				}
				for(String delFile : delFiles) {
					File delSystemFile = new File(saveDir+ delFile);

					if(delSystemFile.exists()) {
						delSystemFile.delete();
					}	
				}
			}
			if(delList.isEmpty()) {
				throw new Exception();
			}
		}
		catch (Exception e) {
			System.out.println("삭제할 파일이 없습니다.");
		}
		return delList;
	}
}


