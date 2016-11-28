package bandNotice.model;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

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
		
		int rst = sql.insert("bandNotice.insertNotice",map);
		sql.close();
		if(rst>=1){
			result="true";
		}else{
			result="false";
		}
		return result;
	}
}
