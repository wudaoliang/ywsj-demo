package service;

import domain.po.Node;

import java.util.List;

public interface MindMapService {

    List<Node> getMindMapData();

    void updateMindMapData(List<Node> nodes);
}
