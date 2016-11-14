package member.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
		
	public boolean getAllMember(String id, String pass){
		SqlSession sql = fac.openSession();
		List<Member> li = sql.selectList("member.getAll");
		boolean flag=false;
		for(int i=0; i<li.size(); i++){
			Member m = li.get(i);
			if(m.getId().equals(id) && m.getPass().equals(pass)){
				flag=true;
			}
		}
		sql.close();
		return flag;
	}
	public boolean selectId(String id){
		boolean flag = false;
		SqlSession sql = fac.openSession();
		List<Member> li = sql.selectList("member.selectId",id);
		if(li.size()==1){
			flag = false;
		}else{
			flag = true;
		}
		sql.close();
		System.out.println(flag);
		return flag;
	}
	
	
}
