package com.example.demo.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.vo.GradeVO;

@Controller
public class MainController {
	
	@RequestMapping(value = "/")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping(value = "/apply_service")
	public String apply_service() {
		return "apply_service";
	}
	
}
