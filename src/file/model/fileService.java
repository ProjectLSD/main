package file.model;

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

@Component
public class fileService {

	@Autowired
	SqlSessionFactory fac;

	@Autowired
	ServletContext application;

	public boolean insertFile(String genre, String album, MultipartFile file, String owner) {
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
			map.put("album", album);
			map.put("owner", owner);
			map.put("genre", genre);
			map.put("filename", fileName);
			sql.insert("insertMap", map);
			sql.close();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public List readSomeContain(String w) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("file.searchSome", "%" + w + "%");
		// List�� ������ ���������
		sql.close();
		return list;

	}
	
	public List readSomePage(int p) {
		int block = 5;
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap<>();
		// 5���� ����´ٰ� ����.
		map.put("start", (p - 1) * block + 1);
		map.put("end", p * block);
		List list = sql.selectList("file.getPart", map);
		sql.close();
		return list;
	}
	
	public int calcLast() {
		SqlSession sql = fac.openSession();
//		List list = sql.selectList("files.getCount");
		int count = sql.selectOne("file.getCount");
		sql.close();
		return count%5==0 ? count/5 : count/5+1;
	}
	
	public int getTotalCount() {
		SqlSession sql = fac.openSession();
		int count = sql.selectOne("file.getCount");
		sql.close();
		return count;
	}
	
	public HashMap readDownTarget(int filenum) {
		SqlSession sql = fac.openSession();
		// FileData tg = sql.selectOne("files.readOnePojo");
		int r = sql.update("file.updateCount", filenum);
		if (r == 0)
			return null;

		HashMap tg = sql.selectOne("file.readOneMap", filenum); // ������ null

		sql.close();
		return tg;
	}
	
	
	
}