package com.example.demo.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.vo.UserVO;

@Service
public class GetSession {
	
	public boolean getSession(HttpServletRequest request) {
		HttpSession session = request.getSession();


		if(session.getAttribute("user") == null || session.getAttribute("user") == "") {
			session.setAttribute("msg", "wrongAccess");
			return false;
		}else {
		   
			return true;
		}
	}
	
	
	public UserVO getUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            UserVO user =new UserVO();
            user.setS_num(Integer.parseInt((String.valueOf(session.getAttribute("user")))));
            user.setName((String)session.getAttribute("userName"));
            user.setEmail((String)session.getAttribute("userEmail"));

            return user;
        }else {

            return null;
        }
    }
	
}
