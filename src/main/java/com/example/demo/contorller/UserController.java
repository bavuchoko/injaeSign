package com.example.demo.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.user.UserService;
import com.example.demo.util.UserSha256;
import com.example.demo.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	@PostMapping(value = "/userlogin")
	public String userlogin(UserVO vo, HttpServletRequest request, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		session = request.getSession();
	
		UserVO uvo = null;
		vo.setPw(UserSha256.encrypt(vo.getPw()));
		uvo = service.userlogin(vo);
		
		if(uvo==null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", "loginfail");
			return "redirect:/";
		}else {
			session.setAttribute("user", uvo.getS_num());
			session.setAttribute("userName", uvo.getName());
			session.setAttribute("userGrade", uvo.getGrade());
			session.setAttribute("userDepartment", uvo.getDepartment_name());
			session.setAttribute("userImage", uvo.getImage());
			session.setAttribute("userEmail", uvo.getEmail());
			
			return "redirect:/core";
		}
		
	}
	
	@RequestMapping(value = "/userlogout")
	public String userlogout(HttpServletRequest request, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		rttr.addFlashAttribute("msg", "logout");
		session.invalidate();
		
		return "redirect:/";
	}
	
	
}
