package com.example.demo.contorller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.service.admin.AdminService;
import com.example.demo.util.FileUploader;
import com.example.demo.util.UserSha256;
import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.GradeVO;
import com.example.demo.vo.UserVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminController {
	
	@Autowired
	AdminService service;

	@RequestMapping(value= "/admin_hr")
	public String adminSetting(Model model) {
		
		List<UserVO>UserList=service.getUserList();
		model.addAttribute("UserList", UserList);
		model.addAttribute("UserList", service.getUserList());
		
		List<DepartmentVO>DepartmentList=service.getDepartmentList();
		model.addAttribute("DepartmentList", DepartmentList);
		model.addAttribute("DepartmentList", service.getDepartmentList());
		
		List<GradeVO>GradeList=service.getGradeList();
		model.addAttribute("GradeList", GradeList);
		model.addAttribute("GradeList", service.getGradeList());
		
		return "admin/admin_hr";
	}
	
	@PostMapping(value = "/UserJoinPro.do")
	   public String insertUser(UserVO user, HttpServletRequest request, MultipartFile file) throws Exception {
	   
	      // 비밀번호 암호화 (sha256)
	      String encryPassword = UserSha256.encrypt(user.getPw());
	      user.setPw(encryPassword);
	      String inputImg = FileUploader.uploadFiles2(file, request);
	      user.setImage(inputImg);
	      
	      service.insertUser(user);
	      return "redirect:/admin_hr";
	   }
	
	@GetMapping("/userDeletePro.do")
	public String deleteUser(@RequestParam("s_num")int s_num) {
		service.deleteUser(s_num);
		return "redirect:/admin_hr";
	}
	
	@PostMapping(value = "/departmentInsertPro.do")
	public String insertDepartment(DepartmentVO department) {
		service.insertDepartment(department);
		return "redirect:/admin_hr";
	}
	
	@GetMapping("/departmentDeletePro.do")
	public String deleteDepartment(@RequestParam("department_name")String department_name) {
		service.deleteDepartment(department_name);
		return "redirect:/admin_hr";
	}
	
	@PostMapping(value = "/gradeInsertPro.do")
	public String insertGrade(GradeVO grade) {
		service.insertGrade(grade);
		return "redirect:/admin_hr";
	}
	
	@GetMapping("/gradeDeletePro.do")
	public String deleteGrade(@RequestParam("grade")String grade) {
		service.deleteGrade(grade);
		return "redirect:/admin_hr";
	}
	
	
}
