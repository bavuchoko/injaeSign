package com.example.demo.service.department;

import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.UserVO;

import java.util.List;

public interface DepartmentService {
    List<DepartmentVO> getDepartment();
    List<UserVO> getCrew(UserVO uvo);
}
