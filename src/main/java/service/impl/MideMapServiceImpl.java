package service.impl;

import dao.NodeDao;
import domain.po.Node;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import service.MindMapService;

import java.lang.reflect.AnnotatedArrayType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class MideMapServiceImpl implements MindMapService {

    private final Logger logger = Logger.getLogger(MideMapServiceImpl.class);

    @Autowired
    private NodeDao nodeDao;

    @Override
    public List<Node> getMindMapData() {
        try {
            Map<String, Node> nodeMap = nodeDao.list().stream().collect(Collectors.toMap(Node::getId, node -> node));
            if(nodeMap.isEmpty()) {
                return new ArrayList<>();
            }
            List<Node> nodes = new ArrayList<>();
            Node node = nodeMap.get("root");
            if(node == null) {
                throw new RuntimeException("该思维导图不存在根节点！！！");
            }
            while(node != null) {
                nodes.add(node);
                node = nodeMap.get(node.getNextNodeId());
            }
            return nodes;
        } catch (RuntimeException e) {
            logger.error("MindMapService getMindMapData error", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateMindMapData(List<Node> nodes) {
        try {
            List<Node> addList = nodes.stream().filter(Node::isIsadded).collect(Collectors.toList());
            List<Node> modifyList = nodes.stream().filter(Node::isIsmodified).collect(Collectors.toList());
            List<Node> deleteList = nodes.stream().filter(Node::isIsdeleted).collect(Collectors.toList());
            if(!addList.isEmpty()) {
                nodeDao.batchAdd(addList);
            }
            if(!modifyList.isEmpty()) {
                nodeDao.batchUpdate(modifyList);
            }
            if(!deleteList.isEmpty()) {
                nodeDao.batchDelete(deleteList.stream().map(Node::getId).collect(Collectors.toList()));
            }
        } catch (RuntimeException e) {
            logger.error("MindMapService updateMindMapData error", e);
            throw new RuntimeException(e);
        }
    }
}
