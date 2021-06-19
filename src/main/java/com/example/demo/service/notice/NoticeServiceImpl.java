package com.example.demo.service.notice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.notice.NoticeMapper;
import com.example.demo.vo.Criteria;
import com.example.demo.vo.NoticeVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getMainList(Criteria cri) {
		return mapper.getMainList(cri);
	}
	
	@Override
	public boolean getInsert(NoticeVO nvo) {
		return mapper.getInsert(nvo) == 1;
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public NoticeVO getView(int s_num) {
		mapper.plusCount(s_num);
		return mapper.getView(s_num);
	}
	
	@Override
	public NoticeVO Update(NoticeVO nvo) {
		return mapper.Update(nvo);
	}
	
	@Override
	public boolean UpdatePro(NoticeVO nvo) {
		return mapper.UpdatePro(nvo) == 1;
	}
	
	@Override
	public boolean getDelete(int s_num) {
		return mapper.getDelete(s_num) == 1;
	}
	
	@Override
	public String fileInfo(int n_num) {
		return mapper.fileInfo(n_num);
	}
}
