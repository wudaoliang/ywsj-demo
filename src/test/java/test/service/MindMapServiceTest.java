package test.service;

import com.alibaba.fastjson.JSON;
import domain.po.Node;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.MindMapService;
import test.AbstractTester;

import java.util.List;

public class MindMapServiceTest extends AbstractTester {

    @Autowired
    private MindMapService mindMapService;

    @Test
    public void testGetMindMapData() {
        List<Node> nodeList = mindMapService.getMindMapData();
        System.out.println(JSON.toJSONString(nodeList));
    }

    @Test
    public void testUpdateMindMapData() {
        List<Node> nodeList = mindMapService.getMindMapData();
        mindMapService.updateMindMapData(nodeList);
    }
}
