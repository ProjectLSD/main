package search.model;

import java.util.List;

import javax.xml.ws.Action;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class searchService {

	@Autowired
	SqlSessionFactory fac;

	public List readSomeContain(String w) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("search.searchSome", "%" + w + "%");
		sql.close();
		return list;
	}
}
