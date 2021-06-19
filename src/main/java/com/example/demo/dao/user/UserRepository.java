package com.example.demo.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.vo.UserVO;

@Repository
public class UserRepository {
	
	private UserMapper userMapper;
	
	public void insertUser(UserVO vo) {
		userMapper.insertUser(vo);
	}
	
	public List<UserVO> selectUserList(){
		return userMapper.selectUserList();
	}
}
