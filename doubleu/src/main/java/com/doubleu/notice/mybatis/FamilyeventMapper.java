package com.doubleu.notice.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.notice.vo.FamilyeventAttVo;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticePage;
import com.doubleu.notice.vo.NoticeVo;

@Repository
@Mapper
public interface FamilyeventMapper {
	public int insert(FamilyeventVo vo);
	public List<FamilyeventVo> select();
	public FamilyeventVo view(int no);
	public List<FamilyeventAttVo> view1(int no);
	public int update(FamilyeventVo vo);
	public void delete(int no);
	
	//페이지
	public int totListSizeMain(NoticePage page);
	public List<NoticeVo> selectPaging(NoticePage page);
	
	// 조회수
	public int updateHit(int notice_hit);
}

