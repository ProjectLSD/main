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
		if (file.isEmpty()){
			return false;
		}
		try {
			String cont = file.getContentType();
			String uid = UUID.randomUUID().toString().substring(0, 20);
			String fileName = file.getOriginalFilename();
			String dir = application.getRealPath("/");
			File music = new File(dir, uid);
			File cover = new File(dir);
			image.transferTo(cover);
			file.transferTo(music);
			HashMap map = new HashMap();
				map.put("fileuuid", uid);
				map.put("filesize", file.getSize());
				map.put("album", album);
				map.put("owner", owner);
				map.put("genre", genre);
				map.put("image", image);
			SqlSession sql = fac.openSession();
			sql.insert("insertFile", map);
			sql.close();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
