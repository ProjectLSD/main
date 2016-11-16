package board.model;

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

}
