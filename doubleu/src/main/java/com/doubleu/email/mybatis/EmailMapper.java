package com.doubleu.email.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.email.vo.AttEmailVo;
import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailReceiverVo;

@Repository
@Mapper
public interface EmailMapper {
	public List<EmailMainVo> selectSendRead();
	public int insertSendWrite(EmailMainVo vo);
	public int selectSendEmail();
	public List<EmailMainVo> selectFindStr(String findStr);
	public List<EmailMainVo> selectEmailNo(int emailNo);
	public List<AttEmailVo> selectFiles(int emailNo);
	public List<EmailMainVo> selectSearchDetail(String findName, String findContents, String findDate);
	public List<EmailReceiverVo> selectSendPerson(int emailNo);
	public List<EmailReceiverVo> selectRefPerson(int emailNo);
}
