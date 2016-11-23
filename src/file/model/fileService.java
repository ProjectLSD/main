package file.model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

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

	public boolean insertFile(String genre, String album, MultipartFile file, String owner, MultipartFile image) {
		if (file.isEmpty()) {
			return false;
		}
		try {
			SqlSession sql = fac.openSession();
			String cont = file.getContentType();
			String fileuuid = UUID.randomUUID().toString().substring(0, 20);
			String imguuid = fileuuid + 1;
			String fileName = file.getOriginalFilename();
			String imgName = image.getOriginalFilename();
			String dir = application.getRealPath("/");
			File music = new File(dir, fileuuid);
			File pic = new File(dir, imguuid);
			file.transferTo(music);
			image.transferTo(pic);
			HashMap map = new HashMap();
			map.put("fileuuid", fileuuid);
			map.put("filesize", file.getSize());
			map.put("album", album);
			map.put("owner", owner);
			map.put("genre", genre);
			map.put("filename", fileName);
			map.put("imguuid", imguuid);
			map.put("imgsize", image.getSize());
			map.put("imgname", imgName);
			sql.insert("file.insertMap", map);
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
		// List가 무조건 만들어지고
		sql.close();
		return list;

	}

	public List readSomePage(int p) {
		int block = 5;
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap<>();
		// 5개씩 끊어온다고 가정.
		map.put("start", (p - 1) * block + 1);
		map.put("end", p * block);
		List list = sql.selectList("file.getPart", map);
		sql.close();
		return list;
	}

	public int calcLast() {
		SqlSession sql = fac.openSession();
		// List list = sql.selectList("files.getCount");
		int count = sql.selectOne("file.getCount");
		sql.close();
		return count % 5 == 0 ? count / 5 : count / 5 + 1;
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

		HashMap tg = sql.selectOne("file.readOneMap", filenum); // 없으면 null

		sql.close();
		return tg;
	}

	public List<HashMap> readApproval() {
		SqlSession sql = fac.openSession();
		List<HashMap> tg = sql.selectList("file.Approval");
		sql.close();

		return tg;

	}

	public List<HashMap> readApproval1(int filenum) {
		SqlSession sql = fac.openSession();
		List<HashMap> tg = sql.selectList("file.Approval1", filenum);
		if (tg == null) {
			sql.close();
		}
		sql.close();
		return tg;
	}

	public List<HashMap> readAlbum(String owner, String album) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("owner", owner);
		map.put("album", album);
		List<HashMap> tg = sql.selectList("file.album", map);
		sql.close();
		return tg;

	}

	public boolean findMusic(int filenum, HttpSession hs) {
		SqlSession sql = fac.openSession();
		HashMap hm = sql.selectOne("file.readOneMap", filenum);
		System.out.println("db music :" + hm);
		boolean flag;
		if (hm != null) {
			List<HashMap> li = new ArrayList<>();
			if (hs.getAttribute("PlayList") != null) {
				System.out.println("PlayList 있음");
				li = (List<HashMap>) hs.getAttribute("PlayList");
			}
			li.add(hm);
			hs.setAttribute("PlayList", li);
			System.out.println("playlist 넘김.");
			flag = true;
		} else {
			flag = false;
		}
		sql.close();
		return flag;
	}
}
