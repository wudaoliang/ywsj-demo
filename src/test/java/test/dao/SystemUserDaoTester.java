package test.dao;


import com.alibaba.fastjson.JSON;
import dao.SystemUserDao;
import domain.po.SystemUser;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import test.AbstractTester;

import java.math.BigDecimal;

/**
 * @author an
 * @date 2019/3/8 0008.
 */
public class SystemUserDaoTester extends AbstractTester {

    @Autowired
    private SystemUserDao systemUserDao;


    @Test
    public void testGet() {
        SystemUser systemUser = systemUserDao.get(new BigDecimal(177255));
        System.out.println(JSON.toJSONString(systemUser));
    }
}
