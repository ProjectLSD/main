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

	public String upLoad(HashMap map, MultipartFile file) {
		try {
			SqlSession sql = fac.openSession();
			String result = null;
			String fileuuid = UUID.randomUUID().toString().substring(0, 15);
			String fileName = file.getOriginalFilename();
			String dir = application.getRealPath("/");
			String type = fileName.substring(fileName.lastIndexOf("."));
			File mv = new File(dir, fileuuid+type);
			file.transferTo(mv);
			map.put("fileuuid", fileuuid+type);
			map.put("filename", fileName);
			map.put("filesize", file.getSize());
			System.out.println(map.toString());
			int rst = sql.insert("bandNotice.insertNotice", map);
			sql.close();
			if (rst >= 1) {
				result = "true";
			} else {
				result = "false";
			}
			return result;

		} catch (Exception e) {
			System.out.println(e);
			return "false";
		}
	}

	public List readSomePage(int p) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap<>();
		// 5개씩 끊어온다고 가정.
	
		map.put("end", p);
		List list = sql.selectList("bandNotice.getPart", map);
		sql.close();
		return list;
	}


	public HashMap selectNum(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = sql.selectOne("bandNotice.selectNum", num);
		sql.close();
		return map;
	}
}
