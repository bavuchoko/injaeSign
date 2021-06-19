package com.example.demo.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.document.DocumentService;
import com.example.demo.service.user.ReportService;
import com.example.demo.service.user.UserService;
import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.UserVO;
@Controller
public class ReportController {
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private ReportService reportservice;
	
	@Autowired
	private DocumentService docService;
	
	@RequestMapping(value = "/report")
	public String report(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		
		int d_num = docService.getHighestDocNum();
		
		HttpSession session = request.getSession();
		
		int s_num = (int)session.getAttribute("user");
		
		if(session.getAttribute("user") == null || session.getAttribute("user") == "") {
			rttr.addFlashAttribute("msg", "wrongAccess");
			return "redirect:/";
		}
		
		String contractType = request.getParameter("contractType");
		model.addAttribute("contractType", contractType);
		
		UserVO uvo = userservice.getUserVO(s_num);
        
        List<DepartmentVO> d_list = reportservice.getDepartmentList();
        
        System.out.println(d_list.get(0).getDepartment_name());
        System.out.println(d_list.get(1).getDepartment_name());
        
        model.addAttribute("uvo", uvo);
        model.addAttribute("d_list", d_list);
        model.addAttribute("document_number", d_num);
        
		return "/report/document_report";

	}
	
	
}
