package com.example.demo.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.admin.AdminMapper;
import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.GradeVO;
import com.example.demo.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper mapper;

	 

	@Override
	public void insertUser(UserVO user) {
		mapper.insertUser(user);

	}
	
	@Override
	public boolean deleteUser(int s_num) {
		return mapper.deleteUser(s_num);
	}
	
	@Override
	public List<UserVO> getUserList() {
		List <UserVO> UserList = mapper.getUserList();
		return UserList;
	}
	
	@Override
	public void insertDepartment(DepartmentVO department) {
		mapper.insertDepartment(department);
		
	}
	
	
	
	@Override
	public boolean deleteDepartment(String department_name) {
		return mapper.deleteDepartment(department_name);
	}
	
	@Override
	public List<DepartmentVO> getDepartmentList() {
		List <DepartmentVO> DepartmentList = mapper.getDepartmentList();
		return DepartmentList;
	}
	
	@Override
	public void insertGrade(GradeVO grade) {
		mapper.insertGrade(grade);
		
	}
	
	@Override
	public boolean deleteGrade(String grade) {
		return mapper.deleteGrade(grade);
	}
	
	@Override
	public List<GradeVO> getGradeList() {
		List <GradeVO> GradeList = mapper.getGradeList();
		return GradeList;
	}

	
	
}
