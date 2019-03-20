package dao;

import domain.po.SystemUser;

import java.math.BigDecimal;

/**
 * @author an
 * @date 2019/3/8 0008.
 */
public interface SystemUserDao {

    SystemUser get(BigDecimal id);
}
