package band.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BandService {
	@Autowired
	SqlSessionFactory fac;
	public boolean selectId(String id){
		boolean flag = false;
		SqlSession sql = fac.openSession();
		List<Band> li = sql.selectList("band.selectId",id);
		if(li.size()==1){
			flag = false;  
		}else{
			flag = true;
		}
		sql.close();
		System.out.println(flag);
		return flag;
	}
	
	public int Input(Band b){
		SqlSession sql = fac.openSession();
		int r = 0;
		boolean flag = true;
		List<Band> li = sql.selectList("band.getAll");
		System.out.println(li.size());
		for(int i=0; i<li.size(); i++){
			Band bb  = li.get(i);
			if(bb.getId().equals(b.getId())){
				flag = false;
				break;
			}
		}
		if(flag==true){

			r += sql.insert("band.inputBand",b);
		}
		return r;
	}
	
}
