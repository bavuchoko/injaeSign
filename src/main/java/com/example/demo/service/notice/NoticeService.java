package com.example.demo.service.notice;

import java.util.List;

import com.example.demo.vo.Criteria;
import com.example.demo.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> getMainList(Criteria cri);
	public boolean getInsert(NoticeVO nvo);
	public int getTotalCount(Criteria cri);
	public NoticeVO getView(int s_num);
	public NoticeVO Update(NoticeVO nvo);
	public boolean UpdatePro(NoticeVO nvo);
	public boolean getDelete(int s_num);
	public String fileInfo(int n_num);
}
