package dao.impl;

import dao.NodeDao;
import domain.po.Node;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NodeDaoImpl extends AbstractDao<Node> implements NodeDao {

    @Override
    public List<Node> list() {
        try {
            String sql = "SELECT ID, PARENT_ID, ISROOT, TOPIC, ISREADONLY, PRE_NODE_ID, NEXT_NODE_ID FROM T_NODE";
            return namedParameterJdbcTemplate.query(sql, new HashMap<>(), this);
        } catch (DataAccessException e) {
            logger.error("NodeDao list error", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void batchUpdate(List<Node> nodes) {
        try {
            String sql = "UPDATE T_NODE SET PARENT_ID = :PARENT_ID, ISROOT = :ISROOT, TOPIC = :TOPIC, " +
                    " PRE_NODE_ID = :PRE_NODE_ID, NEXT_NODE_ID = :NEXT_NODE_ID WHERE ID = :ID";
            Map<String, Object>[] paramsArr = new HashMap[nodes.size()];
            int index = 0;
            for(Node node : nodes) {
                Map<String, Object> params = new HashMap<>(6);
                params.put("PARENT_ID", node.getParentid());
                params.put("ISROOT", node.isIsroot());
                params.put("TOPIC", node.getTopic());
                params.put("PRE_NODE_ID", node.getPreNodeId());
                params.put("NEXT_NODE_ID", node.getNextNodeId());
                params.put("ID", node.getId());
                paramsArr[index++] = params;
            }
            namedParameterJdbcTemplate.batchUpdate(sql, paramsArr);
        } catch (DataAccessException e) {
            logger.error("NodeDao batchUpdate error", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void batchAdd(List<Node> nodes) {
        try {
            String sql = "INSERT INTO T_NODE(ID, PARENT_ID, ISROOT, TOPIC, ISREADONLY, PRE_NODE_ID, NEXT_NODE_ID) " +
                    " VALUES(:ID, :PARENT_ID, :ISROOT, :TOPIC, :ISREADONLY, :PRE_NODE_ID, :NEXT_NODE_ID)";
            Map<String, Object>[] paramsArr = new HashMap[nodes.size()];
            int index = 0;
            for(Node node : nodes) {
                Map<String, Object> params = new HashMap<>(7);
                params.put("ID", node.getId());
                params.put("PARENT_ID", node.getParentid());
                params.put("ISROOT", node.isIsroot());
                params.put("TOPIC", node.getTopic());
                params.put("ISREADONLY", node.isIsreadonly());
                params.put("PRE_NODE_ID", node.getPreNodeId());
                params.put("NEXT_NODE_ID", node.getNextNodeId());
                paramsArr[index++] = params;
            }
            namedParameterJdbcTemplate.batchUpdate(sql, paramsArr);

        } catch (DataAccessException e) {
            logger.error("NodeDao batchAdd error", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public void batchDelete(List<String> ids) {
        try {
            String sql = "DELETE FROM T_NODE WHERE ID = :ID";
            Map<String, Object>[] paramsArr = new HashMap[ids.size()];
            int index = 0;
            for(String id : ids) {
                Map<String, Object> params = new HashMap<>(1);
                params.put("ID", id);
                paramsArr[index++] = params;
            }
            namedParameterJdbcTemplate.batchUpdate(sql, paramsArr);
        } catch (DataAccessException e) {
            logger.error("NodeDao batchDelete error", e);
            throw new RuntimeException(e);
        }
    }

    @Override
    public Node mapRow(ResultSet resultSet, int i) throws SQLException {
        Node node = new Node();
        node.setId(resultSet.getString("ID"));
        node.setIsroot(resultSet.getBoolean("ISROOT"));
        node.setParentid(resultSet.getString("PARENT_ID"));
        node.setTopic(resultSet.getString("TOPIC"));
        node.setIsreadonly(resultSet.getBoolean("ISREADONLY"));
        node.setPreNodeId(resultSet.getString("PRE_NODE_ID"));
        node.setNextNodeId(resultSet.getString("NEXT_NODE_ID"));
        return node;
    }
}
