package com.intr.utils;

import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class TypeHandler extends BaseTypeHandler<String> {
	@Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter);
    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
        Clob clob = rs.getClob(columnName);
        return convertClobToString(clob);
    }

    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        Clob clob = rs.getClob(columnIndex);
        return convertClobToString(clob);
    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        Clob clob = cs.getClob(columnIndex);
        return convertClobToString(clob);
    }

    private String convertClobToString(Clob clob) throws SQLException {
        if (clob == null) {
            return null;
        }
        return clob.getSubString(1, (int) clob.length());
    }
}
