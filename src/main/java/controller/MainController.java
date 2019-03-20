package controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wdl
 * @date 2019/3/6.
 */
@Controller
@RequestMapping("/main")
public class MainController {

    private final Logger logger = Logger.getLogger(MainController.class);

    @RequestMapping("/index")
    public void index() {

    }
}
