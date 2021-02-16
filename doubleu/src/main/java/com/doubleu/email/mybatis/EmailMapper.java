package com.doubleu.email.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.email.vo.EmailMainVo;

@Repository
@Mapper
public interface EmailMapper {
	public List<EmailMainVo> selectSendRead();
	public int insertSendWrite(EmailMainVo vo);
}
