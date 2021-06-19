package com.example.demo.service.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.department.DepartmentMapper;
import com.example.demo.vo.DepartmentVO;
import com.example.demo.vo.UserVO;

@Service
public class DepartmentServiceImpl implements  DepartmentService{

    @Autowired
    private DepartmentMapper mapper;
    @Override
    public List<DepartmentVO> getDepartment() {
        return mapper.getDepartment();
    }

    @Override
    public List<UserVO> getCrew(UserVO uvo) {
        return mapper.getcrew(uvo);
    }
}
