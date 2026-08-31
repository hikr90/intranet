package com.intr.utils;

import java.sql.Clob;
import java.util.HashMap;
import com.google.common.base.CaseFormat;

public class CamelHashMap extends HashMap<Object, Object> {
	//
	private static final long serialVersionUID = 1L;
	//
	@Override
	public Object put(Object key, Object value) {
		if (value instanceof Clob) {
			try {
				Clob clob = (Clob) value;
				int size = (int) clob.length();
				value = (size > 0) ? clob.getSubString(1, size) : "";
			} catch (Exception e) {
				value = "";
			}
		}
		//
		return super.put(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, (String) key), value);
	}
}
