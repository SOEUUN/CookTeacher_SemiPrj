package com.kh.cook.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.Part;

public class FileUploader {
	public static AttachmentVo uploadFile(Part f , String rootPath) throws IOException {
		// 0. 준비
		String originName = f.getSubmittedFileName(); // 원래 파일 이름
		String ext = originName.substring(originName.lastIndexOf("."),originName.length()); // 파일 확장자
		String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999+1) +ext; // 디비에 넣어줄 이름 : 안 겹치게
		
		// 1. 파일 객체 준비 (경로 + 파일명)
		String filePath = "upload/profile";
		String path = rootPath + filePath + "/";		
		File target = new File(path + changeName);
		
		// 2. 데이터 넣기 (클라이언트 파일 -> 자바 -> 타겟파일)
//		InputStream fis = f.getInputStream();	//클라 파일 -> 자바 통로 연결
//		FileOutputStream fos = new FileOutputStream(target); // 자바 -> 타겟파일 통로 연결
		
		BufferedInputStream bis = new BufferedInputStream(f.getInputStream());
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(target));
		
		
		byte[] buf = new byte[1024];
		
		int size = 0;
		
		while((size = bis.read(buf)) != -1) {			
			bos.write(buf,0 , size);
		}
		
		bos.flush();
		bis.close();
		bos.close();

		AttachmentVo attVo = new AttachmentVo();
		attVo.setChangeName(changeName);
		attVo.setFilePath(filePath);
		attVo.setOriginName(originName);
		
		return attVo;
	}
}
