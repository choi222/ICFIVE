package com.spring.main.service;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

public class FileService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//파일 업로드
		public String fileUpload(MultipartHttpServletRequest multi, String fileName) {
		
		String newFileName = "";//변환된 파일명
		
		//1. 저장경로찾기
		String root = ((HttpServletRequest) multi).getSession().getServletContext().getRealPath("/");
		String path  = root+"/resources/upload/";
		logger.info("path : "+path);
		
		//2. 경로 없으면 만들기
		File dir = new File(path);
		if(!dir.isDirectory()){
			logger.info("폴더 없음! 생성 시작");
			dir.mkdir();
		}
		
		//3. 파일 뽑아 내기		
		Iterator<String> files = ((MultipartRequest) multi).getFileNames();
		
		while(files.hasNext()){
			String uploadFile = files.next();
			
			//파일 -> 메모리
			MultipartFile mfile = ((MultipartRequest) multi).getFile(uploadFile);
			
			//4. 파일 저장(새이름)
			//새로운 파일 만들기
			newFileName = System.currentTimeMillis()
					+"."+fileName.substring(fileName.lastIndexOf(".")+1);
			logger.info("새로운 파일명 : "+newFileName);
			//메모리 -> 새파일
			try {
				mfile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}		
		
		return newFileName;
	}

}

