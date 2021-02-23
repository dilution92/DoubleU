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
import com.doubleu.approval.vo.UpdateFormStateVo;
import com.doubleu.approval.vo.UpdateMakerOrderVo;

@Repository
@Mapper
public interface ApprovalMapper {

	public Integer insert(FormVo vo);

	//발신 문서 목록 출력
	public List<FormVo> selectOutgoing(IndexPage page);
	public int outgoingTotalListSize(IndexPage page);
	
	//문서 상태 별 문서 목록 출력
	public int chooseTotalListSize(SelectPage page);
	public List<FormVo> selectChoose(SelectPage page);
	public int chooseTotalListSizeReceiver(SelectPage page);
	public List<FormVo> selectChooseRecevier(SelectPage page);
	//상세보기
	public FormVo selectView(FormVo vo);
	public List<DecisionMakerVo> selectDecisionMaker(int formNo);
	public List<AttFileVo> selectAttFile(int formNo);
	
	//업데이트
	public int updateR(FormVo Vo);
	public int updatePetition(FormPetitionVo vo);
	public int updateVacation(FormVacationVo vo);
	
	//결재란 수정
	public int insertDicisionMakers(FormVo vo);
	public int deleteDicisionMakers(int formNo);
	
	
	//직원 목록 출력
	public List<MemberVo> selectMember(IndexPage page);
	public int memberTotalListSize(IndexPage page);
	
	//수신 목록 출력
	public List<FormVo> selectReceiver(IndexPage page);
	public int receiverTotalListSize(IndexPage page);
	
	//결재자 정보 출력
	public DecisionMakerVo selectMaker(DecisionMakerVo vo);
	
	//상신 취소 버튼 클릭 시 상태 업데이트
	public int updateFormState(UpdateFormStateVo vo);
	
	//삭제 버튼 클릭 시 문서 삭제	
	public int deleteForm(int formNo);
	public int deletePetition(int formNo);
	public int deleteVacation(int formNo);
	public int deleteAttFileList(int formNo);
	
	//승인-반려 버튼 클릭 시 문서 업데이트
	public int updateDecisionApproval(DecisionMakerVo makerVo);
	public int updateDecisionReject(DecisionMakerVo makerVo);
	
	//승인 결재 시 결재권자 순서 업데이트
	public int updateMakerOrder(UpdateMakerOrderVo makerOrderVo);
	
	
}
