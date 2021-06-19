package com.example.demo.util;

import java.io.File;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.vo.DocumentVO;

@Service
public class FileUploader {

    //이름 변경 메서드
    public static String fileRename(String originalName) throws Exception{
        UUID uuid =UUID.randomUUID();
        String savedName =uuid.toString()+"_"+originalName;
        return savedName;
    }

    //파일 서버에 저장하는 메서드
    public static String uploadFiles(DocumentVO doc, MultipartFile photo, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String filePath ="/files/documentfiles";
        ServletContext context = request.getServletContext();
        String fileSavePath = context.getRealPath(filePath);

        String fileName = photo.getOriginalFilename();
        
        if(fileName == null || fileName.equals(" ")) {
        	return null;
        	
        }else {
	        URLEncoder.encode(fileName, "UTF-8");
	        String reFileName = fileRename(fileName);
	
	        String PathFile = fileSavePath + "/" + reFileName;
	
	        if(fileName == null || fileName.length() == 0) {
	        }else{
	            File imageFile = new File(PathFile);
	            photo.transferTo(imageFile);
	        }
	
	        return reFileName;
	        //원본명은 : originalName
	        //서버에 저장되는 & DB에 올라가야 되는 파일명 : changedName
        }
    }
    
    //박보람 유저세팅 이미지변경 메서드
    public static String uploadFiles2(MultipartFile target, HttpServletRequest request) throws Exception {
    	
    	String filePath ="/files/image";
       
        ServletContext context = request.getServletContext();
        String serverPath = context.getRealPath(filePath);

        String originalName = target.getOriginalFilename();
        URLEncoder.encode(originalName, "UTF-8");
        String changedName = fileRename(originalName);
        String stringPathandFile = serverPath + "/" + changedName;
        File file = new File(stringPathandFile);
        target.transferTo(file);

        
        return changedName;
            //원본명은 : originalName
            //서버에 저장되는 & DB에 올라가야 되는 파일명 : changedName
        }


}