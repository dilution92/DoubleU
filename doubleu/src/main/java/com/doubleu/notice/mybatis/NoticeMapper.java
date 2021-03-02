package com.doubleu.notice.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.notice.vo.FamilyeventAttVo;
import com.doubleu.notice.vo.FamilyeventVo;
import com.doubleu.notice.vo.NoticeAttVo;
import com.doubleu.notice.vo.NoticePage;
import com.doubleu.notice.vo.NoticeVo;

@Repository
@Mapper
public interface NoticeMapper {
	public int insert(NoticeVo vo);
	public List<NoticeVo> select();
	public NoticeVo view(int no);
	public List<NoticeAttVo> view1(int no);
	public int update(NoticeVo vo);
	public void delete(int no);
	
	//페이지
	public int totListSizeMain(NoticePage page);
	public List<NoticeVo> selectPaging(NoticePage page);
}
