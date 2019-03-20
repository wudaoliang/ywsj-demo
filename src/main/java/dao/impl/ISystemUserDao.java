package dao.impl;


import dao.SystemUserDao;
import domain.po.SystemUser;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * @author an
 * @date 2019/3/8 0008.
 */
@Repository
public class ISystemUserDao extends AbstractDao<SystemUser> implements SystemUserDao {

    @Override
    public SystemUser get(BigDecimal id) {
        Map<String, Object> params = new HashMap<>(1);
        try {
            String sql = "SELECT ID, CREATE_DATE, CREATE_USER_ID, DEFAULT_ORGANIZATION_ID,  LOGIN_NAME" +
                    ", PASSWORD, SYS_ORIGINAL_ID, NAME, IS_BLOCKED, SYS_IS_EFFECTIVE, SYS_LIFECYCLE" +
                    ", SYS_MARK, UPDATE_USER_ID, UPDATE_TIME" +
                    "  FROM T_SYS_USER WHERE ID = :ID";
            params.put("ID", id);
            return namedParameterJdbcTemplate.query(sql, params, super::mapRow).get(0);
        } catch (DataAccessException e) {
            logger.error("ISystemUserDao is error!!!");
            throw new RuntimeException(e.getMessage());
        }
    }
}
