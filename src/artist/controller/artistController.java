package artist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import artist.model.artistService;

@Controller
public class artistController {

	@Autowired
	artistService artSrv;
}
