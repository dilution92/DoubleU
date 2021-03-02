package com.doubleu.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.notice.mybatis.FamilyeventMapper;
import com.doubleu.notice.vo.FamilyeventAttVo;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticePage;
import com.doubleu.notice.vo.NoticeVo;

@Service
@Transactional
public class FamilyeventService {
	
	@Autowired
	FamilyeventMapper mapper;
	
	public String insert(FamilyeventVo vo) {
		String msg = "정상 입력 됨";
		int cnt = mapper.insert(vo);
		return msg;
	}

	public List<FamilyeventVo> select(){
		System.out.println("select 시작");
		List<FamilyeventVo> list =  mapper.select();
		System.out.println("select mapper 반환");
		return list;
	}
	
	public FamilyeventVo view(int no) {
		System.out.println("view 시작");
		FamilyeventVo vo =  mapper.view(no);
		System.out.println("view mapper 반환");
		return vo;
	}
	
	public List<FamilyeventAttVo> view1(int no) {
		System.out.println("files view 시작");
		List<FamilyeventAttVo> vo =  mapper.view1(no);
		System.out.println(vo);
		System.out.println("files view mapper 반환");
		return vo;
	}
	
	public String update(FamilyeventVo vo) {
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
	
		System.out.println(page.getNowPage()+"FamilyeventNowPage");
		System.out.println(page.getFindStr());
		
		int totListSize = mapper.totListSizeMain(page);
		
		page.setTotListSize(totListSize);
		page.pageCompute();

		System.out.println("totListSize familyevent" + totListSize);

		pageList = mapper.selectPaging(page);
		System.out.println("테스트 pageList" + pageList);
		
		map.put("page", page);
		map.put("pageList", pageList);

		return map;

	}

}
