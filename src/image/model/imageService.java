package image.model;

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
public class imageService {

	@Autowired
	SqlSessionFactory fac;
	@Autowired    
	ServletContext application;

	public boolean insertImg(MultipartFile file, String owner) {
		if (file.isEmpty()) {
			return false;
		}
		try {
			SqlSession sql = fac.openSession();
			String cont = file.getContentType();
			String uid = UUID.randomUUID().toString().substring(0, 20);
			String fileName = file.getOriginalFilename();
			String dir = application.getRealPath("/");
			File music = new File(dir, uid);
			file.transferTo(music);
			HashMap map = new HashMap();
			map.put("fileuuid", uid);
			map.put("filesize", file.getSize());
			map.put("owner", owner);
			map.put("filename", fileName);
			System.out.println(uid + "/" + file.getSize() + "/" + owner + "/" + fileName);
			sql.insert("image.insertMap", map);
			sql.close();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
