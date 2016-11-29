package Chart.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import net.htmlparser.jericho.Source;

@Component
public class ChartDataService {
	public List readBugs() {
		ArrayList<HashMap> bugs = new ArrayList<>();
		try {
			String bugsStie = "http://music.bugs.co.kr/chart/track/day/total";
			Source bugSource = new Source(new URL(bugsStie));
			bugSource.getAllTags();
			bugSource.fullSequentialParse();
			String sourBugs = bugSource.toString();
			String[] bugsTitle = sourBugs.split("name=\"check\" disc_id=\"1\" title=\"");
			String[] title = null;
			String[] bugsArtist = sourBugs.split("\" artist_disp_nm=\"");
			String[] artist = null;
			String[] bugsAlbum = sourBugs.split("\"http://image.bugsm.co.kr/album/images/");
			String[] album = null;
			for (int i = 1; i < 101; i++) {
				HashMap map = new HashMap();
				title = bugsTitle[i].split("\"");
				artist = bugsArtist[i].split("\"");
				album = bugsAlbum[i].split("\"");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
				bugs.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bugs;
	}
	
	public List readMnet() {
		ArrayList<HashMap> mnet = new ArrayList<>();
		try {
			String urlPath = "http://www.mnet.com/chart/top100/";
			String pageContents = "";
			StringBuilder contents = new StringBuilder();
			URL url = new URL(urlPath);
			URLConnection con = (URLConnection) url.openConnection();
			InputStreamReader reader = new InputStreamReader(con.getInputStream(), "utf-8");
			BufferedReader buff = new BufferedReader(reader);
			while ((pageContents = buff.readLine()) != null) {
				contents.append(pageContents);
				contents.append("\r\n");
			}
			buff.close();
			String mnetSite = contents.toString();
			String[] mSplit = mnetSite.split("<td class=\"MMLItemCheck\"");
			for (int i = 1; i < 51; i++) {
				HashMap map = new HashMap();
				// 이거 for문 i 넣어주면됨(1부터 시작하는 i)
				String[] stitle = mSplit[i].split("title=\"");
				String[] title = stitle[1].split("-");
				String[] simg = mSplit[i].split("><img src=");
				String[] img = simg[1].split("alt");
				String[] atitle = mSplit[i].split("/artist");
				String[] atitle2 = atitle[1].split("title=\"");
				String[] artist = atitle2[1].split("-");
				map.put("title", title[0]);
				map.put("artist", artist[0]);
				map.put("img", img[0]);
				mnet.add(map);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mnet;
	}
}
