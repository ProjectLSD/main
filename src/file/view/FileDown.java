package file.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDown extends AbstractView {
	@Autowired
	ServletContext context;  
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HashMap t = (HashMap) model.get("target");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + t.get("FILENAME") + "\"");

		OutputStream out = response.getOutputStream();
		FileInputStream in = new FileInputStream(
				new File(context.getRealPath("/" ),  (String)t.get("FILEUUID") ));
		
		FileCopyUtils.copy(in, out);
		
	}

}










