package com.example.demo.service.document;


import com.example.demo.vo.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

public interface DocumentService {

	DocumentVO getDocument(DocumentVO doc );
    List<DocumentVO> getYetList(UserVO user);
    List<DocumentVO> getRejectList(UserVO user);
    List<DocumentVO> getDocumentList(UserVO user);
    List<DocumentVO> getIconfimList(UserVO user);
    List<DocumentVO> getDoneList(UserVO user);
    List<DocumentVO> getMyDocumentList(UserVO user);
    Integer getUserAlreadyDo(DocumentVO docs);

    int getIfiYet(DocumentVO doc);
    int getUserAlreadyDoCount(DocumentVO doc);
    void insertNext(DocumentVO doc);
    void approve(DocumentVO doc, ProcessLineVO pv);
    void reject(DocumentVO doc, ProcessLineVO pv);
    void insertDocument(DocumentVO doc);
    void insertProcessLine(List<ProcessLineVO> pva);
    int getUserOrders(ProcessLineVO pv);
    void insertFile(DocumentVO doc, MultipartFile photo, HttpServletRequest request, HttpServletResponse response) throws Exception;
    void insertContent(DocumentVO doc);
    int checkUserStamp(ProcessLineVO pv);
    DocumentVO getDocVO(HttpServletRequest request) throws UnsupportedEncodingException;
    
    int getHighestDocNum();
    int getSigniture(DocumentVO doc);
    
    void updateDoc(DocumentVO doc);
    void insertSign(ProcessLineVO pv);
    int getsign(DocumentVO doc);
   
   

}
