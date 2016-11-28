package bandNotice.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import board.model.Board;

@Component
public class bandNoticeService {

	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	public String upLoad(HashMap map,MultipartFile file){
		SqlSession sql = fac.openSession();
		String result=null;
		String fileuuid = UUID.randomUUID().toString().substring(0, 20);
		String fileName = file.getOriginalFilename();
		String dir = application.getRealPath("/");
		File mv = new File(dir, fileuuid);
		map.put("fileuuid", fileuuid);
		map.put("filename", fileName);
		map.put("filesize", file.getSize());
		System.out.println(map.toString());
		int rst = sql.insert("bandNotice.insertNotice",map);
		sql.close();
		if(rst>=1){
			result="true";
		}else{
			result="false";
		}
		return result;
	}
	public List readSomePage(int p) {
		int block = 5;
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap<>();
		// 5개씩 끊어온다고 가정.
		map.put("start", (p - 1) * block + 1);
		map.put("end", p * block);
		List list = sql.selectList("bandNotice.getPart", map);
		sql.close();
		return list;
	}
	
	public int calcLast() {
		SqlSession sql = fac.openSession();
//		List list = sql.selectList("files.getCount");
		int count = sql.selectOne("bandNotice.getCount");
		sql.close();
		return count%5==0 ? count/5 : count/5+1;
	}
	
	public int getTotalCount() {
		SqlSession sql = fac.openSession();
		int count = sql.selectOne("bandNotice.getCount");
		sql.close();
		return count;
	}
	
	public HashMap selectNum(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = sql.selectOne("bandNotice.selectNum", num);
		sql.close();
		return map;
	}
}
