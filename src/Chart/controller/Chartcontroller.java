package Chart.controller;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.htmlparser.jericho.Source;

@Controller
public class Chartcontroller {  
	
	@RequestMapping("/chart/bs")  
	public ModelAndView charts(){
		ModelAndView mav = new ModelAndView();
		try {
		String bugsStie = "http://music.bugs.co.kr/chart/track/day/total";

		// bugs
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

		ArrayList<HashMap> bugs = new ArrayList<>();

		for (int i = 1; i < 101; i++) {
			HashMap map = new HashMap();
			title = bugsTitle[i].split("\"");
			artist = bugsArtist[i].split("\"");
			album = bugsAlbum[i].split("\"");
			map.put("title", title[0]);
			map.put("artist", artist[0]);
			map.put("album", "http://image.bugsm.co.kr/album/images/" + album[0]);
			bugs.add(map);
			System.out.println(map);
		}
         
          mav.addObject("bugs", bugs);
          mav.setViewName("tm:chart/Bschart");
          
         
          } catch (Exception e) {
          	e.printStackTrace();
          }
		  return mav;
		  
	}
}
          

	
		




