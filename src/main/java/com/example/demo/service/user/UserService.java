package com.example.demo.service.user;

import java.util.List;

import com.example.demo.vo.SignVO;
import com.example.demo.vo.UserVO;

public interface UserService {

	void insertUser(UserVO vo);
	List<UserVO> selectUserList();
	
	//이명우
	public UserVO userlogin(UserVO vo);
	public UserVO getUserVO(int s_num);
	public int changeUserPw(String expw, String newpw, int s_num2);
	public int changeUserInfo(UserVO vo, int s_num2);
	
	//최영제
    public boolean insertSign(SignVO sign);
    public boolean insertStamp(SignVO sign);
    public SignVO getSign(int s_num);
    public boolean signDelete(int s_num);
    public boolean stampDelete(int s_num);
    public boolean checkDuplicateSession(String inputId, String sessionId);
    void updateSign(SignVO sign);
    void updateStamp(SignVO sign);
    int checkSign(int s_num); 
    int checkStamp(int s_num);
    
    String getUserSign(int s_num);
    String getUserStamp(int s_num);
    
    //윤선희
    public List<UserVO> getUserdep(String department_name);
    
  
	
}
