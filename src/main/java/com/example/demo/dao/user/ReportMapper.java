package com.example.demo.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.DepartmentVO;

@Mapper
public interface ReportMapper {
	
	public List<DepartmentVO> getDepartmentList();
}
