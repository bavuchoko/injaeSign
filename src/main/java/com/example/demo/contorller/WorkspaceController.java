package com.example.demo.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.document.DocumentService;
import com.example.demo.util.GetSession;
import com.example.demo.vo.UserVO;
@Controller
public class WorkspaceController {
	
	@Autowired
	private DocumentService docService;
	

    @Autowired
    private GetSession gs;
	
	//미결함
	@RequestMapping(value = "/workspace_yetList")
	public String workspace_yetList(Model model, HttpServletRequest request) {

    	if(!gs.getSession(request)) {
    		return "redirect:/";
    	}

	    UserVO user = gs.getUser(request);
        model.addAttribute("list", docService.getYetList(user));
		model.addAttribute("type", "미결함");
		return "/workspace/documents";
	}
	
	//진행함
	@RequestMapping(value = "/workspace_processingList")
	public String workspace_processingList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(); 
    	
    	if(!gs.getSession(request)) {
    		return "redirect:/";
    	}
	    UserVO user = gs.getUser(request);
		
        model.addAttribute("list",docService.getMyDocumentList(user));
		model.addAttribute("mydoc",docService.getDocumentList(user));
		model.addAttribute("type", "진행함");
		return "/workspace/documents";
	}
	
	//반려함
	@RequestMapping(value = "/workspace_rejectList")
	public String workspace_rejectList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(); 
    	
    	if(!gs.getSession(request)) {
    		return "redirect:/";
    	}
	    UserVO user = gs.getUser(request);
		
		model.addAttribute("list", docService.getRejectList(user));
		model.addAttribute("type", "반려함");
		return "/workspace/documents";
	}
	
	//완료함
	@RequestMapping(value = "/workspace_doneList")
	public String workspace_doneList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession(); 
    	
    	if(!gs.getSession(request)) {
    		return "redirect:/";
    	}
	    UserVO user = gs.getUser(request);
		
		model.addAttribute("list",docService.getDoneList(user));
		model.addAttribute("type", "완료함");
		return "/workspace/documents";
	}

	

	
//    model.addAttribute("rejectList",docService.getRejectList(user));
//    // 미결목록 : yetList
//    model.addAttribute("yetList",docService.getYetList(user));
//    // 나의 결제현황 : approved
//    model.addAttribute("approved",docService.getIconfimList(user));
//    // 완료함 : doneList
//    model.addAttribute("doneList",docService.getDoneList(user));
//    // 진행함 : processingList
//    model.addAttribute("processingList",docService.getMyDocumentList(user));
}
