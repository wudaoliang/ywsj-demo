package domain.po;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author an
 * @date 2019/3/8 0008.
 */
public class SystemUser {

    private BigDecimal id;

    private BigDecimal createUserId;

    private BigDecimal defaultOrganizationId;

    private String loginName;

    private String password;

    private BigDecimal sysOriginalId;

    private String name;

    private BigDecimal isBlocked;

    private BigDecimal sysIsEffective;

    private BigDecimal sysLifeCycle;

    private BigDecimal sysMark;

    private BigDecimal updateUserId;

    private Date updateTime;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public BigDecimal getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(BigDecimal createUserId) {
        this.createUserId = createUserId;
    }

    public BigDecimal getDefaultOrganizationId() {
        return defaultOrganizationId;
    }

    public void setDefaultOrganizationId(BigDecimal defaultOrganizationId) {
        this.defaultOrganizationId = defaultOrganizationId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public BigDecimal getSysOriginalId() {
        return sysOriginalId;
    }

    public void setSysOriginalId(BigDecimal sysOriginalId) {
        this.sysOriginalId = sysOriginalId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getIsBlocked() {
        return isBlocked;
    }

    public void setIsBlocked(BigDecimal isBlocked) {
        this.isBlocked = isBlocked;
    }

    public BigDecimal getSysIsEffective() {
        return sysIsEffective;
    }

    public void setSysIsEffective(BigDecimal sysIsEffective) {
        this.sysIsEffective = sysIsEffective;
    }

    public BigDecimal getSysLifeCycle() {
        return sysLifeCycle;
    }

    public void setSysLifeCycle(BigDecimal sysLifeCycle) {
        this.sysLifeCycle = sysLifeCycle;
    }

    public BigDecimal getSysMark() {
        return sysMark;
    }

    public void setSysMark(BigDecimal sysMark) {
        this.sysMark = sysMark;
    }

    public BigDecimal getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(BigDecimal updateUserId) {
        this.updateUserId = updateUserId;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
