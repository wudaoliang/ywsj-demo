package controller;

import com.alibaba.fastjson.JSON;
import domain.po.Node;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.MindMapService;

import java.util.List;

@Controller
@RequestMapping("/mindMap")
public class MindMapController {

    private final Logger logger = Logger.getLogger(MindMapController.class);

    @Autowired
    private MindMapService mindMapService;

    @RequestMapping("/getMindMapPage")
    public void getMindPage() {

    }

    @RequestMapping(value = "/getMindMapData", produces = "text/html;charset=UTF-8")
    public @ResponseBody String getMindMapData() {
        try {
            List<Node> nodes = mindMapService.getMindMapData();
            return JSON.toJSONString(nodes);
        } catch (Exception e) {
            logger.error("MindMapController getMindMapData error", e);
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping("/saveMindMapData")
    public @ResponseBody String saveMindMapData(@RequestBody String param) {
        try {
            System.out.println(param);
            List<Node> nodes = JSON.parseArray(param, Node.class);
            mindMapService.updateMindMapData(nodes);
            return "1";
        } catch (Exception e) {
            logger.error("MindMapController saveMindMapData error", e);
            e.printStackTrace();
            return "0";
        }
    }
}
