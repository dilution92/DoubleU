package com.doubleu.notice.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.doubleu.notice.vo.FamilyeventVo;

@Repository
@Mapper
public interface FamilyeventMapper {
	public int insert(FamilyeventVo vo);
	public List<FamilyeventVo> select();
	public FamilyeventVo view(int no);
	public int update(FamilyeventVo vo); 
}

