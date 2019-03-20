package dao;

import domain.po.Node;

import java.util.List;

public interface NodeDao {

    List<Node> list();

    void batchAdd(List<Node> nodes);

    void batchUpdate(List<Node> nodes);

    void batchDelete(List<String> ids);
}
