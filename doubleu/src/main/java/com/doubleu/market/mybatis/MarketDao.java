package com.doubleu.market.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

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
			
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<MarketVo> list = null;
			try {
				int totListSize = mapper.totListSize(page);
				page.setTotListSize(totListSize);
				page.pageCompute();

				System.out.println("BoardDao.select()..........................2");
				System.out.println(page.getNowPage());
				System.out.println(page.getFindStr());

				
				
				list = mapper.select(page);
				map.put("page", page);
				System.out.println("page: " + page.toString());
				
				map.put("list", list);
				System.out.println("list: " + list.toString());
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				return map;
			}
		}
		

		
		
	//게시물 insert
	public String insert(MarketVo vo) {
		String msg = "게시물이 저장되었습니다.";
		try {
			int cnt = mapper.insert(vo);
			
			if(cnt<1) {
				System.out.println("dao실패");
				throw new Exception("게시물 저장중 오류 발생");
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
			//delFile(vo.getAttList());
		} finally {
			return msg;
		}
	}
}