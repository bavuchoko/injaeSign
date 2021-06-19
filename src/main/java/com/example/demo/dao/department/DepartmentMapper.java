package com.example.demo.dao.department;

import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
   List<DepartmentVO> getDepartment();
   List<UserVO> getcrew(UserVO uvo);
}
