package com.spring.main.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtil {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//파일 다운로드 및 삭제시 활용
	String fullpath="C:/STSworkspace2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/RealProject/resources/upload/";
	
	
	//파일 업로드
	public String upload(MultipartHttpServletRequest multi, String fileName) {
		
		String newFileName="";
		
		//저장 경로
		String root = multi.getSession().getServletContext().getRealPath("/");
		logger.info(root);
		String path = root+"resources\\upload\\";		
		//경로 생성
		File dir = new File(path);
		if(!dir.isDirectory()){
			logger.info("폴더 없음 생성 시작");
			dir.mkdir();
		}		
		//파일 가져옴
		Iterator<String> files = multi.getFileNames();
		//파일 -> 메모리
		while(files.hasNext()){
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);			
			//새파일 생성
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			logger.info("저장 파일 명 : "+newFileName);
			
			//메모리 -> 새파일
			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}		
		return newFileName;
	}

	//파일 삭제
	public int delete(String fileName) {		
		int succcess = 0;		
		try{
			String delName = fullpath+fileName;
			logger.info(delName);
			File file = new File(delName);
			if(file.exists()){
				file.delete();			
			}else{
				logger.info("이미 삭제된 파일");
			}	
			succcess = 1;
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return succcess;
	}
	
	//파일 다운로드
	public void download(String file, String oriFile, HttpServletResponse resp) throws Exception {
		//한글깨짐
		String downFile = URLEncoder.encode(oriFile, "UTF-8");
		//파일 객체 생성
		fullpath += file;
		logger.info("path : "+fullpath);
		File fileObj = new File(fullpath);
		//파일 읽기
		InputStream is = new FileInputStream(fileObj);
		//반환객체 생성
		resp.setContentType("application/octet-stream");
		resp.setHeader("content-Disposition", 
				"attachment; filename=\""+downFile+"\""); 
		//파일 추가
		OutputStream os = resp.getOutputStream();
		byte[] buffer = new byte[1024];
		int length;
		while((length = is.read(buffer))!=-1){
			os.write(buffer,0,length);
		}
		os.flush();
		os.close();
		is.close();
		
	}

}
