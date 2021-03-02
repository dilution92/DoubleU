package com.doubleu.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.notice.mybatis.NoticeMapper;
import com.doubleu.notice.vo.NoticeAttVo;
import com.doubleu.notice.vo.NoticePage;
import com.doubleu.notice.vo.NoticeVo;

@Service
@Transactional
public class NoticeService {
	@Autowired
	NoticeMapper mapper;
	
	public String insert(NoticeVo vo) {
		String msg = "정상 입력 됨";
		int cnt = mapper.insert(vo);
		return msg;
	}
	
	public List<NoticeVo> select(){
		System.out.println("select 시작");
		List<NoticeVo> list = mapper.select();
		System.out.println("select mapper 반환");
		return list;
	}
	
	public NoticeVo view(int no) {
		System.out.println("view 시작");
		NoticeVo vo =  mapper.view(no);
		System.out.println("view mapper 반환");
		return vo;
	}
	
	public List<NoticeAttVo> view1(int no) {
		System.out.println("files view 시작");
		List<NoticeAttVo> vo =  mapper.view1(no);
		System.out.println(vo);
		System.out.println("files view mapper 반환");
		return vo;
	}
	
	public String update(NoticeVo vo) {
		System.out.println("update 시작");
		String msg = "";
		int cnt =  mapper.update(vo);
		if(cnt<0) {
			msg = "수정 중 오류 발생";
		}else {
			msg = "정상적으로 수정되었습니다.";
		}
		System.out.println("update mapper 반환");
		return msg;
	}
	
	public String delete(int no) {
		System.out.println("delete 시작");
		String msg = "";  
		mapper.delete(no);
	
		System.out.println("delete mapper 반환");
		return msg;
	}
	
	// 페이징 처리
	public int totListSizeMain(NoticePage page) {

		int totListSize = mapper.totListSizeMain(page);
		System.out.println(page);

		page.setTotListSize(totListSize);
		page.pageCompute();
		return totListSize;

	}

	// 페이징 처리
	public Map<String, Object> selectPaging(
			NoticePage page) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<NoticeVo> pageList = null;
		
		if(page ==null || page.getNowPage()==0) {
			page.setNowPage(1);
		}
		
		System.out.println(page.getNowPage()+"NoticeNowPage");
		System.out.println(page.getFindStr());
		
		int totListSize = mapper.totListSizeMain(page);
		
		page.setTotListSize(totListSize);
		page.pageCompute();

		System.out.println("totListSize notice" + totListSize);

		pageList = mapper.selectPaging(page);
		System.out.println("테스트 pageList" + pageList);
		
		map.put("page", page);
		map.put("pageList", pageList);
		
		return map;

	}
	
	// 조회수
	public int updateHit(int notice_hit) {
		return mapper.updateHit(notice_hit);
	}

}
