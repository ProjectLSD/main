package root.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import band.model.Band;
import member.model.Member;

@Component
public class RootService {

	@Autowired
	SqlSessionFactory fac;
	
	public boolean getAllMember(String id, String pass, String check, HttpSession session){
		SqlSession sql = fac.openSession();
		HashMap hm = new HashMap<>();
		hm.put("id", id);
		hm.put("pass", pass);
		Band b = null;
		Member m = null;
		if(check.equals("band")){
			b = (Band)sql.selectOne("band.selectBand",hm);	
			System.out.println(b);
			session.setAttribute("check", "band");
		}else{
			m = (Member)sql.selectOne("member.selectMember",hm);
			System.out.println(m);
			session.setAttribute("check", "member");
		}
		boolean flag=false;
		
		if(m!=null || b!=null ){
			flag = true;
		}
		sql.close();
		return flag;
	}
	
}
