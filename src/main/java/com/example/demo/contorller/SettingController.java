package com.example.demo.contorller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.user.UserService;
import com.example.demo.util.UserSha256;
import com.example.demo.vo.SignVO;
import com.example.demo.vo.UserVO;
@Controller
public class SettingController {
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/setting")
	public String setting(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		UserVO uvo = null;
		
		HttpSession session = request.getSession();
		int s_num = (int)session.getAttribute("user");
		
		if(session.getAttribute("user") == null || session.getAttribute("user") == "") {
			rttr.addFlashAttribute("msg", "wrongAccess");
			return "redirect:/";
		}else {
			uvo = userservice.getUserVO(s_num);
		}
		
        SignVO list = userservice.getSign((int)session.getAttribute("user"));
        model.addAttribute("list", list);
		
		model.addAttribute("uvo", uvo);
		return "/setting/private";
	}
	
	//이명우
	@RequestMapping(value = "/changeUserPw")
	public String changeUserPw(HttpServletRequest request, RedirectAttributes rttr,
			@RequestParam("expw") String expw, @RequestParam("newpw") String newpw) {
		
		HttpSession session = request.getSession();
		int s_num = (int)session.getAttribute("user");
		
		if(session.getAttribute("user") == null || session.getAttribute("user") == "") {
			rttr.addFlashAttribute("msg", "wrongAccess");
			return "redirect:/";
		}
		
		expw = UserSha256.encrypt(expw);
		newpw = UserSha256.encrypt(newpw);
				
		int s_num2 = s_num;
		int result = userservice.changeUserPw(expw, newpw, s_num2);
		
		if(result > 0) {
			rttr.addFlashAttribute("msg", "changedpw");
			
		}else {
			rttr.addFlashAttribute("msg", "failedchangespw");
		}
		
		return "redirect:/setting";
	}
	
	@RequestMapping(value = "/changeUserInfo")
	public String changeUserInfo(UserVO vo, HttpServletRequest request, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		int s_num = (int)session.getAttribute("user");
		
		if(session.getAttribute("user") == null || session.getAttribute("user") == "") {
			rttr.addFlashAttribute("msg", "wrongAccess");
			return "redirect:/";
		}
		
		int s_num2 = s_num;
		int result = userservice.changeUserInfo(vo, s_num2);
		
		if(result > 0 ) {
			rttr.addFlashAttribute("msg", "changedinfo");
		}else {
			rttr.addFlashAttribute("msg", "failedchangesinfo");
		}
		
		return "redirect:/setting";
	}
	
	//End 이명우
	
	  //최영제
    @ResponseBody
    @RequestMapping(value = "/signUpload")
    public String signUpload(HttpServletRequest request, MultipartFile file, Model model) {
       
       String filePath ="/files/sign";
        ServletContext context = request.getServletContext();
        String fileSavePath = context.getRealPath(filePath);
        
        SignVO sign = new SignVO();
        
        int s_num = (int)session.getAttribute("user");
        
        if(userservice.checkStamp(s_num) != 1 && userservice.checkSign(s_num) != 1) {
       
           try {
              MultipartFile multipartFile = file;
              File saveFile = new File(fileSavePath, multipartFile.getOriginalFilename());
               sign.setS_num(s_num);
               sign.setSign(multipartFile.getOriginalFilename());
               sign.setSign_path(fileSavePath);
               userservice.insertSign(sign);
              
              multipartFile.transferTo(saveFile);
              return "1";
           } catch(Exception e) {
              System.out.println(e.getMessage());
              return "0";
           } // end catch
        
        }else if(userservice.checkStamp(s_num) == 1 || userservice.checkSign(s_num) == 1) {
           try {
              MultipartFile multipartFile = file;
              File saveFile = new File(fileSavePath, multipartFile.getOriginalFilename());
               sign.setS_num(s_num);
               sign.setSign(multipartFile.getOriginalFilename());
               sign.setSign_path(fileSavePath);
               userservice.updateSign(sign);
              
              multipartFile.transferTo(saveFile);
              return "1";
           } catch(Exception e) {
              System.out.println(e.getMessage());
              return "0";
           } // end catch
        }
        
        return null;
    }
    
    /** * 캡쳐된 화면 서버 저장 * @param request * @return * @throws Exception */
    @ResponseBody
    @RequestMapping(value = "/ImgSaveTest", method = RequestMethod.POST)
    public ModelMap insertSign(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request, final HttpServletResponse response) throws Exception{
       
       ModelMap map = new ModelMap();
       String binaryData = request.getParameter("imgSrc");
       FileOutputStream stream = null;
       try{
          SignVO sign = new SignVO();
          int s_num = (int)session.getAttribute("user");
          
          if(binaryData == null || binaryData.trim().equals("")) {
              throw new Exception();
          }
          binaryData = binaryData.replaceAll("data:image/png;base64,", "");
          byte[] file = Base64.decodeBase64(binaryData);
          String fileName=  UUID.randomUUID().toString();
          
          String filePath ="/files/sign";
          ServletContext context = request.getServletContext();
          String fileSavePath = context.getRealPath(filePath);
          
          if(userservice.checkSign(s_num) != 1 && userservice.checkStamp(s_num) != 1) {
             sign.setS_num(s_num);
             sign.setStamp(fileName+".png");
             sign.setSign_path(fileSavePath);
             userservice.insertStamp(sign);
               
             stream = new FileOutputStream(fileSavePath+"/"+fileName+".png");
             stream.write(file);
             stream.close();
             map.addAttribute("msg", "저장성공!");
             return map;
             
          }else if(userservice.checkSign(s_num) == 1 || userservice.checkStamp(s_num) != 1) {
             sign.setS_num(s_num);
             sign.setStamp(fileName+".png");
             sign.setSign_path(fileSavePath);
             userservice.updateStamp(sign);
               
             stream = new FileOutputStream(fileSavePath+"/"+fileName+".png");
             stream.write(file);
             stream.close();
             map.addAttribute("msg", "저장성공!");
             return map;
          }
          
          
       }catch(Exception e){
          e.printStackTrace();
          map.addAttribute("msg", "에러발생!");
          return map;
       }finally{
          if(stream != null) {
             stream.close();
          }
       }
    return map;
       
    }
    
    @RequestMapping(value = "/signDelete")
    public String signDelete(HttpServletRequest request, RedirectAttributes rttr) {
       int s_num = Integer.parseInt(request.getParameter("s_num"));
       if(userservice.signDelete(s_num)) {
          rttr.addFlashAttribute("result", "삭제성공!");
       }else{
          rttr.addFlashAttribute("result", "삭제실패!");
       };
       
       return "redirect:/setting";
    }
    
    @RequestMapping(value = "/stampDelete")
    public String stampDelete(HttpServletRequest request, RedirectAttributes rttr) {
       int s_num = Integer.parseInt(request.getParameter("s_num"));
       if(userservice.stampDelete(s_num)) {
          rttr.addFlashAttribute("result", "삭제성공!");
       }else{
          rttr.addFlashAttribute("result", "삭제실패!");
       };
       
       return "redirect:/setting";
    }
}
