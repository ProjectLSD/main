package file.model;

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
public class fileService {

	@Autowired
	SqlSessionFactory fac;

	@Autowired
	ServletContext application;

	public boolean insertFile(String genre, String album, MultipartFile file, String owner) {
		if (file.isEmpty()){
			return false;
		}
		try {
			SqlSession sql = fac.openSession();
			System.out.println("1");
			String cont = file.getContentType();
			System.out.println("2");
			String uid = UUID.randomUUID().toString().substring(0, 20);
			System.out.println("3");
			String fileName = file.getOriginalFilename();
			System.out.println("4");
			String dir = application.getRealPath("/");
			System.out.println("5");
			File music = new File(dir, uid);
			System.out.println("6");
			System.out.println("7");
			System.out.println("8");
			file.transferTo(music);
			System.out.println("9");
			HashMap map = new HashMap();
				map.put("fileuuid", uid);
				map.put("filesize", file.getSize());
				map.put("album", album);
				map.put("owner", owner);
				map.put("genre", genre);
				System.out.println("10");
			sql.insert("insertMap", map);
			System.out.println("11");
			sql.close();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
