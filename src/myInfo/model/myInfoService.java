package myInfo.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class myInfoService {

	@Autowired
	SqlSessionFactory fac;
	
	public List info(String id){
		SqlSession sql = fac.openSession();
		List li = sql.selectList("myInfo.info",id);
		sql.close();
		
		return li;
	}
}
