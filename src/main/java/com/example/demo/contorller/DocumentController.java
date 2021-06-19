package com.example.demo.contorller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.department.DepartmentService;
import com.example.demo.service.document.DocumentService;
import com.example.demo.service.user.UserService;
import com.example.demo.util.GetSession;
import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.DocumentVO;
import com.example.demo.vo.ProcessLineVO;
import com.example.demo.vo.UserVO;

@Controller
public class DocumentController {
    @Autowired
    private DocumentService docService;

    @Autowired
    private GetSession gs;
    
    @Autowired
    private DepartmentService dep;
    
    @Autowired
    private UserService userService;
    
   
    //문서 기안하기
    @RequestMapping(value = "insertDocument")
    public String insertDocument(@RequestParam("qqqq") MultipartFile photo, HttpServletRequest request, HttpServletResponse response) throws Exception {

        DocumentVO doc = docService.getDocVO(request);
        
        docService.insertDocument(doc);     //문서테이블 저장
        docService.insertNext(doc);         //다음 결재자 저장
        docService.insertContent(doc);      //컨텐츠테이블 저장
        docService.insertFile(doc, photo, request, response);
        docService.insertProcessLine(doc.getProcess_line());
        //프로세스 테이블에 저장
        return "redirect:/core";
    }


    //초기 core 페이지
    @RequestMapping(value = "core")
    public String getDocumentList(Model model, HttpServletRequest request){
	
        HttpSession session = request.getSession(); 
    	
    	if(!gs.getSession(request)) {
    		return "redirect:/";
    	}
    	
    	UserVO user = gs.getUser(request);

        // 반려함 : rejectList
        model.addAttribute("rejectList",docService.getRejectList(user));
        // 미결목록 : yetList
        model.addAttribute("yetList",docService.getYetList(user));
        // 나의 결제현황 : approved
        model.addAttribute("approved",docService.getIconfimList(user));
        // 완료함 : doneList
        model.addAttribute("doneList",docService.getDoneList(user));
        // 진행함 : processingList
        model.addAttribute("processingList",docService.getMyDocumentList(user));
        model.addAttribute("mydoc",docService.getDocumentList(user));
        
        //부서리스트
        List<DepartmentVO> d_list = dep.getDepartment();
        model.addAttribute("d_list", d_list);
        
        return "/core/core";
    }

    //승인  DocumentVO 객체의 sign == approve
    @RequestMapping(value = "approve")
    public String approve(DocumentVO doc, HttpServletRequest request){
    	HttpSession session = request.getSession();

     	if(!gs.getSession(request)) {
     		return "redirect:/";
     	}

        ProcessLineVO pv = new ProcessLineVO();
     	UserVO user = gs.getUser(request);
        pv.setSigniture(userService.getUserStamp(user.getS_num()));
        pv.setS_num(user.getS_num());
        pv.setD_num(doc.getD_num());
        System.out.println(user.getS_num());
        System.out.println(userService.getUserStamp(18));

        if(docService.checkUserStamp(pv)!=1){
            session.setAttribute("msg", "먼저 도장을 등록해주세요");
            return "redirect:/setting";
        }
        pv.setSign("approve");
        System.out.println(pv.getSigniture()+"b");
        docService.insertSign(pv);
        docService.approve(doc, pv);   //nextap 다음사람으로 변경
        return "redirect:/core";
    } 


    //반려  DocumentVO 객체의 sign == reject
    @RequestMapping(value = "reject")
     public String reject(DocumentVO doc, HttpServletRequest request){
    	HttpSession session = request.getSession(); 
     	
     	if(!gs.getSession(request)) {
     		return "redirect:/core";
     	}
     	
     	UserVO user = gs.getUser(request);
     	int s_num =user.getS_num();
        ProcessLineVO pv = new ProcessLineVO();

        pv.setS_num(s_num);
        pv.setD_num(doc.getD_num());
        docService.getUserOrders(pv);
        pv.setSign("reject");

        docService.reject(doc, pv);  //nextap 테이블 전사람으로 변경
        
        return "redirect:/core";
     }


    //개별 문서 보기
    @RequestMapping(value = "getDocument")
    public String getDocument(Model model,HttpServletRequest request) throws UnsupportedEncodingException {
    	DocumentVO doc = new DocumentVO();
        UserVO user = gs.getUser(request);
        request.setCharacterEncoding("utf-8");
        doc.setD_num(Integer.parseInt(request.getParameter("d_num")));
        int s_num = user.getS_num();
        doc.setS_num(s_num);

        if(docService.getSigniture(doc)==0){
            HttpSession session = request.getSession();
            session.setAttribute("msg","도장을 등록해 주세요");
            return "redirect:/setting";
        }else {
            String donechecker ="";
            String yet = "";

            if((docService.getUserAlreadyDo(doc)!=null)){

                if(docService.getUserAlreadyDo(doc)==3){
                    donechecker ="approved";
                }
                else if(docService.getUserAlreadyDo(doc)==4){
                    donechecker = "rejected";
                }
                else if(docService.getUserAlreadyDo(doc)==8){
                    donechecker ="yet";
                }

                if(docService.getIfiYet(doc) == user.getS_num()){
                    yet ="yes";
                }else { yet = "no";}
            }
        model.addAttribute("yet",yet);
        model.addAttribute("checker", donechecker);
        model.addAttribute("details", docService.getDocument(doc));
        model.addAttribute("sign", userService.getUserSign(s_num));
        model.addAttribute("stamp", userService.getUserStamp(s_num));
        return "/report/document_readreport";
        }
    }
    
    @RequestMapping(value = "getDocument2")
    public String getDocument2(Model model,HttpServletRequest request) throws UnsupportedEncodingException {
    	DocumentVO doc = new DocumentVO();
        UserVO user = gs.getUser(request);
        request.setCharacterEncoding("utf-8");
        doc.setD_num(Integer.parseInt(request.getParameter("d_num")));
        doc.setS_num(user.getS_num());

        if(docService.getSigniture(doc)==0 && docService.getsign(doc)==0 ){
            HttpSession session = request.getSession();
            session.setAttribute("msg","도장또는 사인을 등록해 주세요");
            return "redirect:/setting";
        }else {
        model.addAttribute("details", docService.getDocument(doc));
        return "/report/document_none";
        }
    }
    
    
    //소속원 
    @RequestMapping(value = "getcrew")
    @ResponseBody
    public List<UserVO> getcrew(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        String department_name = request.getParameter("department_name");
        String name = request.getParameter("self");
        
        UserVO uvo = new UserVO();
        uvo.setDepartment_name(department_name);
        uvo.setName(name);
        
        return dep.getCrew(uvo);
    }

    //수정페이지로 가기
    @RequestMapping(value = "updateDocGo")
    public String updateDocGo(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
        DocumentVO doc = new DocumentVO();
        request.setCharacterEncoding("utf-8");
        doc.setD_num(Integer.parseInt(request.getParameter("d_num")));

        model.addAttribute("details", docService.getDocument(doc));

        return "/report/document_updatereport";
    }

    //문서수정내용 입력
    @RequestMapping(value = "updateDocDone")
    public String updateDoc(HttpServletRequest request) throws UnsupportedEncodingException {
        DocumentVO doc = new DocumentVO();
        ProcessLineVO pv = new ProcessLineVO();
        request.setCharacterEncoding("utf-8");
        doc.setD_num(Integer.parseInt(request.getParameter("d_num")));
        doc.setContent(request.getParameter("content"));
        doc.setTitle(request.getParameter("title"));
        pv.setD_num(Integer.parseInt(request.getParameter("d_num")));
        pv.setS_num((Integer)request.getAttribute("user"));
        docService.updateDoc(doc);
        docService.approve(doc, pv);
    	return "redirect:core";
    }
    
    @RequestMapping(value="/organmap")
    @ResponseBody
     public List<UserVO> getorganmap(HttpServletRequest request) throws UnsupportedEncodingException {
          request.setCharacterEncoding("utf-8");
          List<UserVO> list = userService.getUserdep(request.getParameter("name"));
          return list;
     }
    
}
