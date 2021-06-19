package com.example.demo.dao.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.vo.Criteria;
import com.example.demo.vo.NoticeVO;

public interface NoticeMapper {

	@Autowired
	public List<NoticeVO> getMainList(Criteria cri);
	
	@Autowired
	public int getInsert(NoticeVO nvo);
	
	@Autowired
	public int getTotalCount(Criteria cri);
	
	@Autowired
	public NoticeVO getView(int s_num);
	
	@Autowired
	public void plusCount(int s_num);
	
	@Autowired
	public NoticeVO Update(NoticeVO nvo);
	
	@Autowired
	public int UpdatePro(NoticeVO nvo);
	
	@Autowired
	public int getDelete(int s_num);
	
	@Autowired
	public String fileInfo(int n_num);
}
