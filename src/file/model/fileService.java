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

	public boolean insertFile(String genre, String album, MultipartFile image, MultipartFile file, String owner) {
		System.out.println("s1");
		if (file.isEmpty()){
			System.out.println("s2");
			return false;
		}
		try {
			System.out.println("s3");
			String cont = file.getContentType();
			System.out.println("s4");
			String uid = UUID.randomUUID().toString().substring(0, 20);
			System.out.println("s5");
			String fileName = file.getOriginalFilename();
			System.out.println("s6");
			String dir = application.getRealPath("/");
			System.out.println("s7");
			File music = new File(dir, uid);
			System.out.println("s8");
			File cover = new File(dir);
			System.out.println("s9");
			image.transferTo(cover);
			System.out.println("s10");
			file.transferTo(music);
			System.out.println("s11");
			HashMap map = new HashMap();
				map.put("fileuuid", uid);
				map.put("filesize", file.getSize());
				map.put("album", album);
				map.put("owner", owner);
				map.put("genre", genre);
				map.put("image", image);
				System.out.println("s12");	
			SqlSession sql = fac.openSession();
			System.out.println("s13");
			sql.insert("insertFile", map);
			sql.close();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
