package com.doubleu.approval.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FileDownload() {
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = req.getParameter("file");
		String directory = req.getServletContext().getRealPath("/WEB-INF/upload/approval");
		File file = new File(directory + "/" + fileName);
		
		String mimeType = req.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			resp.setContentType("application/octet-stream"); //2진 데이터 형식을 전달할 때 사용
		}
		
		String downloadName = null;
		if(req.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		resp.setHeader("Content_disposition", "attachment;filename=\"" + downloadName+"\";");
		
		FileInputStream fileInputStream = new FileInputStream(file); 
		ServletOutputStream servletOutputStream = resp.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		while((data = (fileInputStream.read(b,0,b.length))) != -1) {
			System.out.println(data);
			servletOutputStream.write(b, 0, data);
		}
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}



}
