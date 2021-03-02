package com.doubleu.email.mybatis;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.email.vo.AttEmailVo;
import com.doubleu.email.vo.EmailMainVo;
import com.doubleu.email.vo.EmailPage;
import com.doubleu.email.vo.EmailReceiverVo;
import com.doubleu.login.vo.LoginVo;

@Repository
@Mapper
public interface EmailMapper {
	/*select*/
	
	// 메인함 사이드 바
	public int selectSendEmail(EmailMainVo vo);
	
	
	public List<EmailMainVo> selectEmailNo(int emailNo);
	
	// 파일 데이터 가져오기
	public List<AttEmailVo> selectFiles(int emailNo);
	public List<EmailMainVo> selectSearchDetail(String findName, String findContents, String findDate);
	
	// 받은 사람
	public List<EmailReceiverVo> selectSendPerson(int emailNo);
	// 참조
	public List<EmailReceiverVo> selectRefPerson(int emailNo);
	
	
	//페이지
	public int totListSizeMain(EmailPage page);
	public List<EmailMainVo> selectPaging(EmailPage page);
	
	
	// 메일 쓰기
	public int insertSendWrite(EmailMainVo vo);
	public int insertTemporary(EmailMainVo vo);
	
	// 멤버 조회
	public List<LoginVo> selectMembers();

	// 삭제하기
	public int updateSendTrash(EmailMainVo vo);
	
	// 임시저장 조회
	public List<EmailMainVo> selectTemp(EmailPage page);
	public int totListSizeTemp(EmailPage page);
	
	// 데이터 삭제하기
	public int updateAllDelete(EmailMainVo vo);
	
	// 스팸 메일함으로 이동하기
	public int spamMoveSelect(EmailMainVo vo);
}
