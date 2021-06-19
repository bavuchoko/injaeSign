package com.example.demo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.user.UserMapper;
import com.example.demo.vo.SignVO;
import com.example.demo.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	//이명우
	@Autowired
	private UserMapper mapper;

	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<UserVO> selectUserList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 이명우
	@Override
	public UserVO userlogin(UserVO vo) {
		return mapper.userlogin(vo);
	}
	
	@Override
	public UserVO getUserVO(int s_num) {
		return mapper.getUserVO(s_num);
	}
	
	@Override
	public int changeUserPw(String expw, String newpw, int s_num2) {
		return mapper.changeUserPw(expw, newpw, s_num2);
	}
	
	@Override
	public int changeUserInfo(UserVO vo, int s_num2) {
		return mapper.changeUserInfo(vo, s_num2);
	}

   //최영제
   @Override
   public boolean insertSign(SignVO sign) {
      return mapper.insertSign(sign) == 1;
   }
   
   @Override
   public boolean insertStamp(SignVO sign) {
      return mapper.insertStamp(sign) == 1;
   }
   
   @Override
   public SignVO getSign(int s_num) {
      return mapper.getSign(s_num);
   }
   
   @Override
   public boolean signDelete(int s_num) {
      return mapper.signDelete(s_num) == 1;
   }
   
   @Override
   public boolean stampDelete(int s_num) {
      return mapper.stampDelete(s_num) == 1;
   }
   
   @Override
   public boolean checkDuplicateSession(String inputId, String sessionId) {
      
      if(inputId.equals(sessionId)) {
         return true;
      }
      return false;
   }
   
   @Override
   public void updateSign(SignVO sign) {
      mapper.updateSign(sign); 
   }
      @Override
   public void updateStamp(SignVO sign) {
      mapper.updateStamp(sign);
   }
   
   @Override
   public int checkSign(int s_num) {
      return mapper.checkSign(s_num);
   }
   
   @Override
   public int checkStamp(int s_num) {
      return mapper.checkStamp(s_num);
   }
   
   @Override
	public String getUserSign(int s_num) {
		return mapper.getUserSign(s_num);
	}
	 
	   @Override
	public String getUserStamp(int s_num) {

	    return mapper.getUserStamp(s_num);
	}
   
   
   //윤선희
   @Override
	public List<UserVO> getUserdep(String department_name) {
		return mapper.getUserdep(department_name);
	}
	
}
