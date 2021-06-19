package com.example.demo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.user.ReportMapper;
import com.example.demo.vo.DepartmentVO;

@Service
public class ReportServiceimpl implements ReportService {
	
	@Autowired
	private ReportMapper mapper;
	
	@Override
	public List<DepartmentVO> getDepartmentList() {
		return mapper.getDepartmentList();
	}
}
