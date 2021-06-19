package com.example.demo.dao.document;

import com.example.demo.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DocumentMapper {
  
	DocumentVO getDocument(DocumentVO doc);
    List<DocumentVO> getYetNumber(UserVO user);
    List<DocumentVO> getRejectNumber(UserVO user);
    List<DocumentVO> getDocumentNumber(UserVO user);
    List<DocumentVO> getProcessubgNumber(UserVO user);
    List<DocumentVO> getIconfirmNumber(UserVO user);
    List<DocumentVO> getDoneNumber(UserVO user);
    List<DocumentVO> getYetList(List<DocumentVO> doca);
    List<DocumentVO> getRejectList(List<DocumentVO> doca);
    List<DocumentVO> getDocumentList(List<DocumentVO> doca);
    List<DocumentVO> getIconfirmList(List<DocumentVO> doca);
    List<DocumentVO> getDoneList(List<DocumentVO> doca);
    List<ProcessLineVO> getProcessLine(DocumentVO doc);
    List<UserVO> getProcessImg(DocumentVO doc);
    List<DocumentVO> getMyDocumentList(List<DocumentVO> doca);
    List<DocumentVO> getMyDocNumber(UserVO user);
    int checkDCount();
    Integer getUserAlreadyDo(DocumentVO docs);
    void updateDoc(DocumentVO doc);
    void updateContent(DocumentVO doc);
    int getHighestOrders(DocumentVO doc);
    int getUserOrders(ProcessLineVO pv);
    void setDocumentDone(DocumentVO doc);
    void approve(ProcessLineVO pv);
    void reject(ProcessLineVO pv);
    void rejectEnd(ProcessLineVO pv);
    void insertNext(DocumentVO doc);
    void modifyNext(DocumentVO doc);
    void insertDocument(DocumentVO doc);
    void insertProcessLine(List<ProcessLineVO> pva);
    void modifyProcessLine(ProcessLineVO pv);
    void insertFileToDb(DocumentVO doc);
    void insertContent(DocumentVO doc);
    void finalApprove(ProcessLineVO pv);
    int getHighestDocNum();
    int getSigniture(DocumentVO doc);
    int getsign(DocumentVO doc);
    int getMyOrders(ProcessLineVO pv);
    int getHightstOders(ProcessLineVO pv);
    int checkUserStamp(ProcessLineVO pv);
    int getIfiYet(DocumentVO doc);
    int getUserAlreadyDoCount(DocumentVO doc);

    String getDocSign(String signiture, int s_num);
    String getDocStamp(String signiture, int s_num);


    void insertSign(ProcessLineVO pv);
}