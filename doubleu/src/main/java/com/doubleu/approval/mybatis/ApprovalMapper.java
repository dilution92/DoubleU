package com.doubleu.approval.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.doubleu.approval.vo.AttFileVo;
import com.doubleu.approval.vo.DecisionMakerVo;
import com.doubleu.approval.vo.FormPetitionVo;
import com.doubleu.approval.vo.FormVacationVo;
import com.doubleu.approval.vo.FormVo;
import com.doubleu.approval.vo.IndexPage;
import com.doubleu.approval.vo.MemberVo;
import com.doubleu.approval.vo.SelectPage;

@Repository
@Mapper
public interface ApprovalMapper {

	public Integer insert(FormVo vo);
	
	public List<FormVo> selectOutgoing(IndexPage page);
	public int outgoingTotalListSize(IndexPage page);
	
	public int chooseTotalListSize(SelectPage page);
	public List<FormVo> selectChoose(SelectPage page);
	
	public FormVo selectView(FormVo vo);
	public List<DecisionMakerVo> selectDecisionMaker(int formNo);
	public List<AttFileVo> selectAttFile(int formNo);
	
	public int updateR(FormVo Vo);
	public int updatePetition(FormPetitionVo vo);
	public int updateVacation(FormVacationVo vo);
	
	public int insertDicisionMakers(FormVo vo);
	public int deleteDicisionMakers(int FormNo);
	
	public List<MemberVo> selectMember(IndexPage Page);
	public int memberTotalListSize(IndexPage page);
}
