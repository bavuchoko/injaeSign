package com.example.demo.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.SignVO;
import com.example.demo.vo.UserVO;

@Mapper
public interface UserMapper {

	public void insertUser(UserVO vo);
	public List<UserVO> selectUserList();
	
	//이명우
	public UserVO userlogin(UserVO vo);
	public UserVO getUserVO(int s_num);
	public int changeUserPw(String expw, String newpw, int s_num2);
	public int changeUserInfo(UserVO vo, int s_num2);
	
	//최영제
    public int insertSign(SignVO sign);
    public int insertStamp(SignVO sign);
    public SignVO getSign(int s_num);
    public int signDelete(int s_num);
    public int stampDelete(int s_num);
    void updateSign(SignVO sign);
    void updateStamp(SignVO sign);
    int checkSign(int s_num); 
    int checkStamp(int s_num);
    String getUserSign(int s_num);
    String getUserStamp(int s_num);
    
    //윤선희
    public List<UserVO> getUserdep(String department_name);
    
}
