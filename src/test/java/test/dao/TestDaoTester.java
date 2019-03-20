package test.dao;

import com.alibaba.fastjson.JSON;
import dao.TestDao;
import domain.po.TestPO;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.AbstractTester;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author an
 * @date 2019/3/7 0007.
 */
public class TestDaoTester extends AbstractTester {

    @Autowired
    private TestDao testDao;

    @Test
    public void testList() {
        List<TestPO> testPOs = testDao.list(new BigDecimal(6));
        System.out.println(JSON.toJSONString(testPOs.get(0)));
    }
}
