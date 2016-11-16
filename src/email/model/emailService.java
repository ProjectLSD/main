package email.model;

import java.util.HashMap;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class emailService {

	@Autowired
	SqlSessionFactory fac;

	public List findpass(String regid, String regname) {
		SqlSession sql = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", regid);
		map.put("name", regname);
		List<HashMap> list = sql.selectList("member.findEmail", map);
		sql.close();
		return list;
	}
}
  