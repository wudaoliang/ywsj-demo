package dao;

import domain.po.TestPO;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author an
 * @date 2019/3/6 0006.
 */
public interface TestDao {

    List<TestPO> list(BigDecimal YWY);
}
