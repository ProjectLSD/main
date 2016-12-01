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
	public List readTopPop() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.toppop");
		sql.close();
		return list;
	}
	public List readTopRock() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.toprock");
		sql.close();
		return list;
	}   
	public List readTopJazz() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.topjazz");
		sql.close();
		return list;
	}
	public List readTopHiphop() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.tophiphop");
		sql.close();
		return list;
	}
	public List readTopCountry() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.topcountry");
		sql.close();
		return list;
	}
	public List readTopElectronic() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("topchart.topelectronic");
		sql.close();
		return list;
	}
}
