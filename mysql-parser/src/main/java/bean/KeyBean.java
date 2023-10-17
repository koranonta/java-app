package bean;

import util.SqlConstants.K_KEY_TYPES;

public class KeyBean {
	private K_KEY_TYPES m_keyType;
	private String m_fieldName;
	private String m_refTable;
	private String m_refField;

	public KeyBean() {
	}

	public KeyBean(String _fieldName, K_KEY_TYPES _keyType) {
		setFieldName(_fieldName);
		setKeyType(_keyType);
	}

	public K_KEY_TYPES getKeyType() {
		return m_keyType;
	}

	public void setKeyType(K_KEY_TYPES _keyType) {
		m_keyType = _keyType;
	}

	public boolean isPrimaryKey() {
		return m_keyType.equals(K_KEY_TYPES.PRIMARY1);
	}

	public String getFieldName() {
		return m_fieldName;
	}

	public void setFieldName(String _fieldName) {
		m_fieldName = _fieldName;
	}

	public String getRefTable() {
		return m_refTable;
	}

	public void setRefTable(String _refTable) {
		m_refTable = _refTable;
	}

	public String getRefField() {
		return m_refField;
	}

	public void setRefField(String _refField) {
		m_refField = _refField;
	}

	@Override
	public String toString() {
		if (getKeyType().equals(K_KEY_TYPES.FOREIGN1)) {
			return getFieldName() + " ref table : " + getRefTable() + " ( " + getRefField() + " )";
		} else if (getKeyType().equals(K_KEY_TYPES.PRIMARY1)) {
			return "Primary Key : " + getFieldName();
		} else if (getKeyType().equals(K_KEY_TYPES.INDEX1)) {
			return "Index : " + getFieldName();
		}
		return null;
	}
}
