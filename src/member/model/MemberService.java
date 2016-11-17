package member.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
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
	
	public int Input(Member m){
		SqlSession sql = fac.openSession();
		int r = 0;
		boolean flag = true;
		List<Member> li = sql.selectList("member.getAll");
		System.out.println(li.size());
		for(int i=0; i<li.size(); i++){
			Member mm  = li.get(i);
			if(mm.getId().equals(m.getId())){
				flag = false;
				break;
			}
		}
		if(flag==true){

			r += sql.insert("member.inputMember",m);
		}
		return r;
	}
	//인증번호 생성
	public String creatRamdomNum(){
		String randomNum = "";
		for(int i=0; i < 8 ; i++){
			int random = (int)(Math.random()*9);
			randomNum += random;
		}
		return randomNum;
	}
	
}
