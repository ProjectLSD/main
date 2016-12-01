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

	public List infoMember(String id) {
		SqlSession sql = fac.openSession();
		List li = sql.selectList("myInfo.infoMember", id);
		sql.close();

		return li;
	}
	
	public List infoBand(String id) {
		SqlSession sql = fac.openSession();
		List li = sql.selectList("myInfo.infoBand", id);
		sql.close();

		return li;
	}

	public boolean checkPass(String pass, String id) {
		SqlSession sql = fac.openSession();
		System.out.println("ChPP!!!!!");
		List li = sql.selectList("myInfo.infoMember", id);
		System.out.println(li.toString());
		String r="";
		String rst="";
		if(li.toString()=="[]"){
			r="band";
		}else{
			r="member";
		}
		
		boolean result;
		if(r=="member"){
			rst = sql.selectOne("member.selectPass", id);
		}else{
			rst = sql.selectOne("band.selectPass", id);
		}
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
			int rst ;
			List li = sql.selectList("myInfo.infoMember", id);
			String result="";
			if(li.toString()=="[]"){
				result="band";
			}else{
				result="member";
			}
			if(result=="member"){
				rst = sql.update("myInfo.updateMember", map);
			}else{
				rst = sql.update("myInfo.updateBand", map);
			}
		sql.close();
		return rst;
	}
	
}