package com.doubleu.profile.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.profile.vo.MemberVo;


@Service
@Transactional
public class ProfileDao{
	@Autowired
	ProfileMapper mapper;

	/*
	 * public MemberVo view(int memberNo) { MemberVo vo = new MemberVo();
	 * //List<MemberAttVo> attList = new ArrayList<>(); try { vo =
	 * mapper.view(memberNo); attList = mapper.selectAtt(memberNo);
	 * vo.setAttlist(attList); } catch (Exception ex) { ex.printStackTrace(); }
	 * finally { return vo; } }
	 */
}