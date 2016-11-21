package myInfo.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.Member;

@Component
public class myInfoService {

	@Autowired
	SqlSessionFactory fac;

	public List info(String id) {
		SqlSession sql = fac.openSession();
		List li = sql.selectList("myInfo.info", id);
		sql.close();

		return li;
	}

	public boolean checkPass(String pass, String id) {
		SqlSession sql = fac.openSession();
		boolean result;
		String rst = sql.selectOne("member.selectPass", id);
		sql.close();

		if (rst.equals(pass)) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}

	public int Input(String pass,String email,String phonenum1,String phonenum2,String phonenum3,String name,String id) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
			map.put("pass",pass);
			map.put("email",email);
			map.put("phonenum1",phonenum1);
			map.put("phonenum2",phonenum2);
			map.put("phonenum3",phonenum3);
			map.put("name",name);
			map.put("id", id);
		System.out.println("!");
			int rst = sql.update("myInfo.updateMember", map);
		System.out.println("@");
		 System.out.println(rst);
		sql.close();
		return rst;
	}
}