package topChart.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChartService {

	@Autowired
	SqlSessionFactory fac;
	
	public List readTopChart() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.top");
		sql.close();
		return list;
	}
}
