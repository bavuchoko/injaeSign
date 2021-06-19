package com.example.demo.service.document;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.document.DocumentMapper;
import com.example.demo.util.FileUploader;
import com.example.demo.vo.DocumentVO;
import com.example.demo.vo.ProcessLineVO;
import com.example.demo.vo.UserVO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class DocumentServiceImpl implements DocumentService{

	@Autowired
    private DocumentMapper docMapper;

    @Autowired
    private FileUploader files;


    //문서 입력하기
    public void insertDocument(DocumentVO doc){
        docMapper.insertDocument(doc);
    }

    //개별문서
    public DocumentVO getDocument(DocumentVO doc){
        return docMapper.getDocument(doc);

    }

    //미결함
    public List<DocumentVO> getYetList(UserVO user){
        if(docMapper.getYetNumber(user).size() == 0){
            return null;
        }else {
            return docMapper.getYetList(docMapper.getYetNumber(user));
        }
    }

    //반려목록
    public List<DocumentVO> getRejectList(UserVO user){
        if(docMapper.getRejectNumber(user).size() == 0){
            return null;
        }else {
            return docMapper.getRejectList(docMapper.getRejectNumber(user));
        }
    }

    //내결재 목록
    @Override
    public List<DocumentVO> getIconfimList(UserVO user) {
        if(docMapper.getIconfirmNumber(user).size() == 0){
            return null;
        }else{
            return docMapper.getIconfirmList(docMapper.getIconfirmNumber(user));
        }
    }

    //완료목록
    @Override
    public List<DocumentVO> getDoneList(UserVO user) {
        if(docMapper.getDoneNumber(user).size() ==0){
            return null;
        }else {
            return docMapper.getDoneList(docMapper.getDoneNumber(user));
        }
    }



    
    //다음결재자 업데이트
    @Override
    public void insertNext(DocumentVO doc) {
        docMapper.insertNext(doc);
    }

    //진행목록 리턴
    public List<ProcessLineVO> getProcessLine(DocumentVO doc) {
        return docMapper.getProcessLine(doc);
    }

    //승인하기
    @Override
    public void approve(DocumentVO doc, ProcessLineVO pv) {
        if(docMapper.getHighestOrders(doc) == docMapper.getUserOrders(pv)){
            docMapper.setDocumentDone(doc);
            docMapper.modifyProcessLine(pv);
            docMapper.finalApprove(pv);
        }else if(docMapper.getHighestOrders(doc) > docMapper.getUserOrders(pv)){
            docMapper.approve(pv); //nextap 다음사람으로 변경
            docMapper.modifyProcessLine(pv);
        }
    }


    //반려하기
    @Override
    public void reject(DocumentVO doc, ProcessLineVO pv) {
        if(docMapper.getUserOrders(pv)==0 || docMapper.getUserOrders(pv)==docMapper.getHighestOrders(doc)) {
            docMapper.rejectEnd(pv);
            docMapper.setDocumentDone(doc);
        }else {
            docMapper.reject(pv);
        }
        System.out.println(pv.getS_num());
        docMapper.modifyProcessLine(pv);
    }



    @Override
    public void insertProcessLine(List<ProcessLineVO> pva){
        docMapper.insertProcessLine(pva);
    }


    public void insertFile(DocumentVO doc, MultipartFile photo, HttpServletRequest request, HttpServletResponse response) throws Exception {

        String changedName = files.uploadFiles(doc, photo, request, response);
        doc.setFiles(changedName);
        docMapper.insertFileToDb(doc);
    }
    
    public void insertContent(DocumentVO doc){
        docMapper.insertContent(doc);
    }

    public DocumentVO getDocVO(HttpServletRequest request) throws UnsupportedEncodingException {

        request.setCharacterEncoding("utf-8");

        DocumentVO doc = new DocumentVO();
        
        doc.setD_num(Integer.parseInt(request.getParameter("d_num")));
        doc.setS_num(Integer.parseInt(request.getParameter("s_num")));
        doc.setDepartment_name(request.getParameter("department_name"));
        doc.setD_code(request.getParameter("d_code"));
        doc.setGrade(request.getParameter("grade"));
        doc.setTitle(request.getParameter("title"));
        doc.setContent(request.getParameter("content"));
        String[] s_nums = request.getParameterValues("s_nums");
        int[] s_num = new int[s_nums.length];

        List<ProcessLineVO> process_line = new ArrayList<ProcessLineVO>();

        for(int i = 0; i< s_num.length; i++) {
            s_num[i] = Integer.parseInt(s_nums[i]);
            ProcessLineVO pvo = new ProcessLineVO();
            pvo.setD_num(doc.getD_num());
            pvo.setS_num(s_num[i]);
            pvo.setOrders(i);

            process_line.add(pvo);

        }
        doc.setNextap(s_num[0]);
        doc.setProcess_line(process_line);
        return doc;
    
    }
   
    @Override
    public int getHighestDocNum() {
    	if(docMapper.checkDCount()==0){
    		return 0;
    	}else {
    	return docMapper.getHighestDocNum()+1;}
    }


    @Override
    public void updateDoc(DocumentVO doc){
        docMapper.updateDoc(doc);
        docMapper.updateContent(doc);
    }
    @Override
    public int getSigniture(DocumentVO doc){
        return docMapper.getSigniture(doc);
    }
    

	@Override
	public int getsign(DocumentVO doc){
	    return docMapper.getsign(doc);
	}
	
    public String getDocSign(int s_num, String signiture) {
        String sign = docMapper.getDocSign(signiture, s_num);
         return sign;
      }
      
      public String getDocStamp(int s_num, String signiture) {
        String stamp = docMapper.getDocStamp(signiture, s_num);
         return stamp;
      }
    
      public void insertSign(ProcessLineVO pv) {
          System.out.println(pv.getSigniture()+"A");
          docMapper.insertSign(pv);
      }

      //내 진행함
    @Override
      public List<DocumentVO> getDocumentList(UserVO user){
    	   if(docMapper.getDocumentNumber(user).size() == 0){
               return null;
           }else{
               return docMapper.getDocumentList(docMapper.getDocumentNumber(user));
           }
       }

    //진행함
    @Override
    public List<DocumentVO> getMyDocumentList(UserVO user) {
        if(docMapper.getDoneNumber(user).size() ==0){
            return null;
        }else {
            return docMapper.getDocumentList(docMapper.getProcessubgNumber(user));
        }
    }

    public int checkUserStamp(ProcessLineVO pv){
        return docMapper.checkUserStamp(pv);
    }

    public int getUserOrders(ProcessLineVO pv){
        return docMapper.getUserOrders(pv);
    }



    public Integer getUserAlreadyDo(DocumentVO doc){
        return docMapper.getUserAlreadyDo(doc);
    }
    public int getUserAlreadyDoCount(DocumentVO doc){
        return docMapper.getUserAlreadyDoCount(doc);
    }


    @Override
    public int getIfiYet(DocumentVO doc){
        return docMapper.getIfiYet(doc);
    }

}
