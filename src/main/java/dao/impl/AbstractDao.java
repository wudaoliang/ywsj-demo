package dao.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author an
 * @date 2019/3/6 0006.
 */
public abstract class AbstractDao<T> implements RowMapper<T> {

    final Logger logger = Logger.getLogger(getClass());

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Override
    public T mapRow(ResultSet resultSet, int i) throws SQLException {
        ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
        int count = resultSetMetaData.getColumnCount();
        Map<String, Object> columnMap = new HashMap<>(count);
        int index = 1;
        while(count-- > 0) {
            String name = resultSetMetaData.getColumnName(index);
            columnMap.put("SET" + name.replace("_", ""), resultSet.getObject(name));
            index++;
        }

        String genericSuperclassStr = getClass().getGenericSuperclass().getTypeName();
        String genericStr = genericSuperclassStr.substring(genericSuperclassStr.indexOf("<") + 1, genericSuperclassStr.indexOf(">"));

        try {
            Class tclass = Class.forName(genericStr);
            Method[] methods = tclass.getMethods();
            Object instance = tclass.newInstance();
            for(Method method : methods) {
                String methodName = method.getName().toUpperCase();
                if(columnMap.containsKey(methodName)) {
                    method.invoke(instance, columnMap.get(methodName));
                }
            }
            return (T) instance;
        } catch (Exception e) {
            logger.error(e.getMessage());
            throw new RuntimeException(e.getCause());
        }
    }
}
