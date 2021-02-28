package com.doubleu.market.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doubleu.market.vo.MarketReplVo;
import com.doubleu.market.vo.MarketVo;

@Service
public class MarketReplDao {
	@Autowired
	MarketReplMapper mapper;
	
	public String insert(MarketReplVo rvo) {
		String msg = "댓글이 저장되었습니다.";
		try {
			int cnt = mapper.insert(rvo);
			
			if(cnt<1) {
				throw new Exception("댓글 저장중 오류 발생");
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
		} finally {
			return msg;
		}
	}

	public Map<String, Object> select(int marketNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MarketVo> list = null;
		try {
			
			list = mapper.select(marketNo);

			map.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return map;
}
}

	public String update(MarketReplVo rvo) {
		String msg = "댓글이 수정되었습니다.";
		try {
			int cnt = mapper.update(rvo);
			
			if(cnt<1) {
				throw new Exception("댓글 수정중 오류 발생");
			}
		} catch (Exception ex) {
			msg = ex.getMessage();
		} finally {
		return msg;
	}
}

	public String delete(MarketReplVo rvo) {
		String msg = "댓글 삭제";
		try {
			int cnt = mapper.delete(rvo);
			if(cnt<1) {
				msg = "댓글 삭제 중 오류";
			}
		} catch (Exception e) {
			msg = e.getMessage();
		}
		return null;
	}
}