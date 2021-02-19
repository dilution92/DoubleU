package com.doubleu.notice.mybatis;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.doubleu.notice.vo.FamilyeventVo;

@Repository
@Mapper
public interface FamilyeventMapper {
	public int insert(FamilyeventVo vo);
}
