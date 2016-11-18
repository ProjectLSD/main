package board.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardService {
	@Autowired
	SqlSessionFactory fac;

	public List<Board> getAll() {
		SqlSession sql = fac.openSession();
		List<Board> b = sql.selectList("board.getAll");
		sql.close();
		return b;
	}

	public Board selectNum(int num) {
		SqlSession sql = fac.openSession();
		Board b = sql.selectOne("board.selectNum", num);
		sql.update("board.plusCount", num);
		sql.close();
		return b;
	}
	public List readSomePage(int p) {
		int block = 5;
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap<>();
		// 5개씩 끊어온다고 가정.
		map.put("start", (p - 1) * block + 1);
		map.put("end", p * block);
		List list = sql.selectList("board.getPart", map);
		sql.close();
		return list;
	}
	
	public int calcLast() {
		SqlSession sql = fac.openSession();
//		List list = sql.selectList("files.getCount");
		int count = sql.selectOne("board.getCount");
		sql.close();
		return count%5==0 ? count/5 : count/5+1;
	}
	
	public int getTotalCount() {
		SqlSession sql = fac.openSession();
		int count = sql.selectOne("board.getCount");
		sql.close();
		return count;
	}
	public boolean insert(String writer, Board vb) {
		try {
			SqlSession ss = fac.openSession();
			vb.setWriter(writer);
			ss.insert("board.insert", vb);
			System.out.println(vb.comments + "/" + vb.likes + "/" + vb.num + "/" + vb.subject + "/" + vb.writer);
			ss.close();

			System.out.println("성공4");
			return true;
		} catch (Exception e) {
			System.out.println("실패");
			System.out.println(vb.comments + "/" + vb.likes + "/" + vb.num + "/" + vb.subject + "/" + vb.writer);
			e.printStackTrace();
			return false;
		}
	}
	public boolean update(Board b){
		SqlSession sql =fac.openSession();
		int i = sql.update("board.upBoard", b);
		boolean flag;
		if(i==1){
			flag = true;
		}else{
			flag = false;
		}
		System.out.println("update확인 :" +i+flag);
		sql.close();
		return flag;
	}
	// 게시판 수정
	public boolean delete(int num){
		SqlSession sql = fac.openSession();
		int i = 0;
		boolean flag;
		i += sql.delete("board.delBoard",num );
		i += sql.delete("board.delReview",num );
		System.out.println("delcount : "+i);
		if(i==0){
			flag = false;
		}else{
			flag = true;
		}
		sql.close();
		
		return flag;
	}

}
