package cash.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class cashService {
	
	 @Autowired
	 SqlSessionFactory fac;
	 
	 public String point(String id){
		 SqlSession sql = fac.openSession();
		 String point = sql.selectOne("point.viewPoint",id);
		 sql.close();
		return point;
	 }
}
