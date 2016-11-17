package board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewService {

	@Autowired
	SqlSessionFactory fac;
	public boolean register(Review r){
		SqlSession sql = fac.openSession();
		int i = sql.insert("board.inReview", r);
		boolean flag;
		if(i==1){
			System.out.println("inReview : 성공");
			flag = true;
		}else{
			System.out.println("inReview : 실패");
			flag = false;
		}
		sql.close();
		return flag;
	}
	public List<Review> getReview(int num){
		System.out.println(num);
		SqlSession sql = fac.openSession();
		List<Review> lr = sql.selectList("board.getReview", num);
		if(lr==null){
			System.out.println("lr : null");
		}else{
			System.out.println("lr :" +lr.size());
		}
		sql.close();
		return lr;
	}
}
