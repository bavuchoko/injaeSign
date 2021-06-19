package com.example.demo.contorller;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.FileInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.notice.NoticeService;
import com.example.demo.vo.Criteria;
import com.example.demo.vo.NoticeVO;
import com.example.demo.vo.PageDTO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	@RequestMapping(value = "/notice")
	public String notice(HttpServletRequest request, Criteria cri, Model model) {
		
		Criteria cri1 = new Criteria(cri.getPageNum(), cri.getAmount());
		cri1.setType(cri.getType());
		cri1.setWord(cri.getWord());
		
		model.addAttribute("list", service.getMainList(cri1));
		
		int total = service.getTotalCount(cri1);
		model.addAttribute("PageMaker",new PageDTO(cri1, total));
		return "/notice/notice";
	}
	
	@RequestMapping(value = "/noticeWrite")
	public String noticeWrite() {
		return "/notice/noticeWrite";
	}
	
    public String fileRename(String originalName) throws Exception{
        UUID uuid =UUID.randomUUID();
        String savedName =uuid.toString()+"_"+originalName;
        return savedName;
    }

    @RequestMapping(value = "/noticeWritepro")
    public String upload(@RequestParam("file") MultipartFile photo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
    	
    	HttpSession session = request.getSession();
    	
		if(session.getAttribute("user") != null || session.getAttribute("user") != "") {
			
	    	String filePath ="/files/notice";
	        ServletContext context = request.getServletContext();
	        String fileSavePath = context.getRealPath(filePath);
	        
	        String fileName = photo.getOriginalFilename();
	        URLEncoder.encode(fileName, "UTF-8"); 
	        String reFileName = fileRename(fileName);
	        String PathFile = fileSavePath + "/" + reFileName;
	        
	        if(fileName == null || fileName.length() == 0) {
	        }else{ 
	             File imageFile = new File(PathFile);
	             photo.transferTo(imageFile);
	        }
	        
	        NoticeVO nvo = new NoticeVO();
	        nvo.setTitle(request.getParameter("title"));
	        nvo.setContent(request.getParameter("content").replace("<br>", "\n"));
	        nvo.setFile(reFileName);
	        nvo.setS_num((int)session.getAttribute("user"));
	        
			if(service.getInsert(nvo)) {
				rttr.addFlashAttribute("result","공지사항 등록성공");
				return "redirect:/notice";
			}else {
				rttr.addFlashAttribute("result","공지사항 등록실패");
				return "redirect:/notice";
			}
		}else {
			rttr.addFlashAttribute("result","로그인 후 이용해주세요!");
			return "redirect:/notice";
		}
	}
	
	@RequestMapping(value = "/noticeView")
	public String noticeView(@RequestParam("n_num") int n_num, Model model) {
		NoticeVO nvo = new NoticeVO();
		nvo = service.getView(n_num);
		String content = nvo.getContent();
		nvo.setContent(content.replace("\n", "<br>"));
		model.addAttribute("view", nvo);
		return "/notice/noticeView";
	}
	
	@RequestMapping(value = "/noticeUpdate")
	public String noticeUpdate(HttpServletRequest request, @RequestParam("n_num") int n_num, Model model, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") != null || session.getAttribute("user") != "") {
			if((int)session.getAttribute("user") == service.getView(n_num).getS_num()) {
				model.addAttribute("view", service.getView(n_num));
				return "/notice/noticeUpdate";
			}else {
				rttr.addFlashAttribute("result", "다른회원의 게시물입니다!");
				return "redirect:/notice";
			}
		}else {
			rttr.addFlashAttribute("result", "로그인 후 이용해주세요!");
			return "redirect:/notice";
		}
		
	}
	
	@RequestMapping(value = "/noticeUpdatepro")
	public String noticeUpdatepro(@RequestParam("file") MultipartFile photo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
    	
    	HttpSession session = request.getSession();
    	
		if(session.getAttribute("user") != null || session.getAttribute("user") != "") {
			
	    	String filePath ="/files/notice";
	        ServletContext context = request.getServletContext();
	        String fileSavePath = context.getRealPath(filePath);
	        
	        String fileName = photo.getOriginalFilename();
	        URLEncoder.encode(fileName, "UTF-8"); 
	        String reFileName = fileRename(fileName);
	        String PathFile = fileSavePath + "/" + reFileName;
	        
	        if(fileName == null || fileName.length() == 0) {
	        }else{ 
	             File imageFile = new File(PathFile);
	             photo.transferTo(imageFile);
	        }
	        
	        NoticeVO nvo = new NoticeVO();
	        nvo.setN_num(Integer.parseInt(request.getParameter("n_num")));
	        nvo.setTitle(request.getParameter("title"));
	        nvo.setContent(request.getParameter("content"));
	        nvo.setFile(reFileName);

			if(service.UpdatePro(nvo)) {
				rttr.addFlashAttribute("result","업데이트 성공!");
				return "redirect:/notice";
			}else {
				rttr.addFlashAttribute("result","업데이트 실패!");
				return "redirect:/notice";
			}
		}else {
			rttr.addFlashAttribute("result","로그인 후 이용해주세요!");
			return "redirect:/notice";
		}
	}
	
	@RequestMapping(value = "/getDelete")
	public String getDelete(HttpServletRequest request, @RequestParam("n_num") int n_num, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("user") != null || session.getAttribute("user") != "") {
			if((int)session.getAttribute("user") == service.getView(n_num).getS_num()) {
				if(service.getDelete(n_num)) {
					rttr.addFlashAttribute("result", "성공적으로 삭제되었습니다!");
					return "redirect:/notice";
				}else {
					rttr.addFlashAttribute("result", "삭제 실패!");
					return "redirect:/notice";
				}
			}else {
				rttr.addFlashAttribute("result", "다른회원의 게시물입니다!");
				return "redirect:/notice";
			}
		}else {
			rttr.addFlashAttribute("result", "로그인 후 이용해주세요!");
			return "redirect:/notice";
		}
		
		
	}	//delete end
 
}	//controller end
