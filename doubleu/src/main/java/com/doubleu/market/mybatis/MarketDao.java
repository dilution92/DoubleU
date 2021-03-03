package com.doubleu.market.mybatis;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import com.doubleu.market.Controller.MarketUploadController;
import com.doubleu.market.vo.MarketAttVo;
import com.doubleu.market.vo.MarketPage;
import com.doubleu.market.vo.MarketVo;

@Service
@Transactional
public class MarketDao {
	@Autowired
	MarketMapper mapper;
	
	//transaction
		@Autowired
		PlatformTransactionManager manager;
		TransactionStatus status;
	
		
		
		//게시물 select
		public Map<String, Object> select(MarketPage page) {
			
			System.out.println("BoardDao.select()..........................1");
			System.out.println(page.getNowPage());
			System.out.println(page.getFindStr());
			System.out.println(page.getFindType());
			
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<MarketVo> list = null;
			try {
				int totListSize = mapper.totListSize(page);
				page.setTotListSize(totListSize);
				page.pageCompute();


				list = mapper.select(page);

				map.put("page", page);
				map.put("list", list);
				//map.put("attList", attList);
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				return map;
			}
		}
		

		//검색결과갯수
		public int selectCount(MarketPage page) {
			int cnt = 0;
			cnt = mapper.selectCount(page);
			System.out.println("검색글갯수 : " + cnt);
			
			return cnt;
		}

		//총 게시물 갯수
		public int totalCount() {
			int cnt = 0;
			cnt = mapper.totalCount();
			System.out.println("총글갯수 : " + cnt);
			
			return cnt;
		}
	//게시물 insert
	public String insert(MarketVo vo) {
		String msg = "게시물이 저장되었습니다.";
		try {
			vo.getAttlist().get(0).setFilesMain(1);;
			int cnt = mapper.insert(vo);
			
			if(cnt<1) {
				throw new Exception("게시물 저장중 오류 발생");
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			//delFile(vo.getAttList());
		} finally {
			return msg;
		}
	}


	public MarketVo view(int marketNo) {
		MarketVo vo = new MarketVo();
		List<MarketAttVo> attList = new ArrayList<>();
		try {
			vo = mapper.view(marketNo);
			attList = mapper.selectAtt(marketNo);
			vo.setAttlist(attList);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}


	public String update(MarketVo vo) {
		String msg = "게시물이 수정되었습니다.";
		try {
			int cnt = mapper.update(vo);
			if(cnt>0) {
				if(vo.getAttlist() != null) {
					System.out.println("사진추가작업중...");
					cnt = mapper.insertAtt(vo);
					if(cnt<1) throw new Exception("첨부 저장중 오류 발생");
				}
				if(vo.getDelFiles() != null) {
					System.out.println("사진삭제작업중...");
					cnt = mapper.deleteAtt(vo);
					if(cnt<1) throw new Exception("첨부 파일 삭제중 오류 발생"); 
					delFile(vo.getDelFiles());
				}
			}else {
				throw new Exception("수정중 오류 발생");
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			//delFile(vo.getAttlist());
		} finally {
			return msg;
		}
	}


	public String delete(MarketVo vo) {
			String msg = "게시물이 삭제되었습니다.";
			List<MarketAttVo> attList = null;
			try {
				attList = mapper.selectAtt(vo.getMarketNo());
				mapper.deleteAttNo(vo.getMarketNo());
				int cnt = mapper.delete(vo);
				if(cnt>0) {
					msg = "삭제완료";
					delFile(attList);
				
					
				}else {
					throw new Exception("게시물 삭제중 오류 발생");
				}

			} catch (Exception ex) {
				msg = ex.getMessage();
			} finally {
				return msg;
			}
		}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	public void delFile(List<MarketAttVo> delList) {
		System.out.println("delFile");
		for(MarketAttVo v : delList) {
			System.out.println(v.getOriFile());
			File f = new File(MarketUploadController.saveDir + v.getOriFile());
			if(f.exists()) f.delete();
		}
	}


	public String updateHit(MarketVo vo) {
		String msg = null ;
		int cnt = 0;
		try {
			cnt = mapper.updateHit(vo);
			
			if (cnt>0) {
				msg="업데이트완료";
			}else {
				msg = "업데이트오류";
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			//delFile(vo.getAttlist());
		} finally {
			return msg;
	}




	}


	public List<MarketVo> selectMarketMain() {
		List<MarketVo> list = null;
		try {
			list = mapper.selectMarketMain();
		} catch (Exception e) {
			e.getMessage();
		}
		return list;
	}


	public Map<String, Object> selectMine(MarketPage page) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MarketVo> list = null;
		try {
			int totListSize = mapper.totListSizeMine(page);
			page.setTotListSize(totListSize);
			page.pageCompute();


			list = mapper.selectMine(page);

			map.put("page", page);
			map.put("list", list);
			//map.put("attList", attList);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return map;
		}
	}


	public int selectMineCnt(MarketPage page) {
		int cnt = 0;
		cnt = mapper.selectMineCnt(page);
		System.out.println("검색글갯수 : " + cnt);
		
		return cnt;
	}


	
	}



