package com.example.demo.service.admin;

import java.util.List;

import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.GradeVO;
import com.example.demo.vo.UserVO;

public interface AdminService {

	public void insertUser(UserVO user);
	public boolean deleteUser(int s_num);
	public List<UserVO> getUserList();
	public void insertDepartment(DepartmentVO department);
	public boolean deleteDepartment(String department_name);
	public List<DepartmentVO> getDepartmentList();
	public void insertGrade(GradeVO grade);
	public boolean deleteGrade(String grade);
	public List<GradeVO> getGradeList();
	
}
