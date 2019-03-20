package dao.impl;

import dao.TestDao;
import domain.po.TestPO;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author an
 * @date 2019/3/6 0006.
 */
@Repository
public class ITestDao extends AbstractDao<TestPO> implements TestDao {

    @Override
    public List<TestPO> list(BigDecimal YWY) {
        try {
            String sql = "SELECT YWY, SJB, YZ, BZDZ, PJBZDZID, DXZJ FROM T_TEST_4 WHERE YWY = :YWY AND ROWNUM <= 1";
            Map<String, Object> params = new HashMap<>(1);
            params.put("YWY", YWY);
            return namedParameterJdbcTemplate.query(sql, params, super::mapRow);
        } catch (Exception e) {
            logger.error("ITestDao.get method is error!!!");
            throw new RuntimeException(e.getMessage());
        }
    }
}
