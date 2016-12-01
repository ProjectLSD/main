package cash.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class cashService {

	@Autowired
	SqlSessionFactory fac;

	public String point(String id) {
		SqlSession sql = fac.openSession();
		String point;
		String r = "";
		List li = sql.selectList("myInfo.infoMember", id);
		if (li.toString() == "[]") {
			r = "band";
		} else {
			r = "member";
		}
		if(r=="member"){
			point = sql.selectOne("point.viewPoint", id);
		}else{
			point = sql.selectOne("point.viewPointB", id);
		}
		sql.close();
		return point;
	}

	public String chargeResult(int point, String id) {
		SqlSession sql = fac.openSession();
		String r = "";
		int result;
		List li = sql.selectList("myInfo.infoMember", id);
		if (li.toString() == "[]") {
			r = "band";
		} else {
			r = "member";
		}
		
		HashMap map = new HashMap<>();
		map.put("point", point);
		map.put("id", id);
		if(r=="member"){
			result = sql.update("point.updatePoint", map);
		}else{
			result = sql.update("point.updatePointB", map);
		}
		sql.close();
		String rst;
		if (result == 1) {
			rst = "true";
		} else {
			rst = "false";
		}
		return rst;
	}

}
