package com.doubleu.notice.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.notice.vo.NoticeVo;

@Repository
@Mapper
public interface NoticeMapper {
	public int insert(NoticeVo vo);
}
