package test.dao;

import com.alibaba.fastjson.JSON;
import com.sun.xml.internal.ws.util.StringUtils;
import dao.NodeDao;
import domain.po.Node;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.AbstractTester;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class NodeDaoTester extends AbstractTester {

    @Autowired
    private NodeDao nodeDao;

    @Test
    public void testBatchAdd() {
        try(BufferedReader reader = new BufferedReader(new InputStreamReader(getClass().getResourceAsStream("/data.txt")))) {
            StringBuilder sb = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                sb.append(line.trim());
            }
            nodeDao.batchAdd(JSON.parseArray(sb.toString(), Node.class));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
