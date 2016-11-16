package root.model;

import java.util.HashMap;
import java.util.List;

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
	public boolean getAllMember(String id, String pass){
		SqlSession sql = fac.openSession();
		HashMap hm = new HashMap<>();
		hm.put("id", id);
		hm.put("pass", pass);
		Member m = (Member)sql.selectOne("member.selectMember",hm);
		Band b = (Band)sql.selectOne("band.selectBand",hm);
		boolean flag=false;
		System.out.println(m);
		System.out.println(b);
		if(m!=null || b!=null ){
			flag = true;
		}
		/*
		for(int i=0; i<li.size(); i++){
			Member m = li.get(i);
			if(m.getId().equals(id) && m.getPass().equals(pass)){
				flag=true;
			}
		}
		*/
		sql.close();
		return flag;
	}
	
}
