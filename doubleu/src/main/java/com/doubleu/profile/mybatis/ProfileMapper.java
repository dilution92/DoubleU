package com.doubleu.profile.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.doubleu.profile.vo.ProfileVo;
import com.doubleu.profile.vo.WorkVo;


@Repository
@Mapper
public interface ProfileMapper {
	public List<ProfileVo> selectProfile();
	public List<WorkVo> selectWork();
}

