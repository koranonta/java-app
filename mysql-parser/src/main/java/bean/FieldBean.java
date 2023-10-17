package bean;

public class FieldBean implements Cloneable {
	private String m_name;
	private String m_type;
	private int m_length = -1;
	private int m_decimal = -1;
	private String m_attribute;
	private String m_defautValue;
	private String m_checkValue;
	private boolean m_autoIncrement = false;
	private boolean m_primaryKey = false;

	public FieldBean() {
	}

	public FieldBean(String _name) {
		setName(_name);
	}

	public String getName() {
		return m_name;
	}

	public void setName(String _name) {
		m_name = _name;
	}

	public String getType() {
		return m_type;
	}

	public void setType(String _type) {
		m_type = _type;
	}

	@Override
	public String toString() {
		return getName() + " " + (getType() == null ? "" : getType());
	}

	public int getLength() {
		return m_length;
	}

	public void setLength(int _length) {
		m_length = _length;
	}

	public int getDecimal() {
		return m_decimal;
	}

	public void setDecimal(int _decimal) {
		m_decimal = _decimal;
	}

	public String getAttribute() {
		return m_attribute;
	}

	public void setAttribute(String _attribute) {
		m_attribute = _attribute;
	}

	public String getDefautValue() {
		return m_defautValue;
	}

	public void setDefautValue(String _defautValue) {
		m_defautValue = _defautValue;
	}

	public boolean isAutoIncrement() {
		return m_autoIncrement;
	}

	public void setAutoIncrement(boolean _autoIncrement) {
		m_autoIncrement = _autoIncrement;
	}

	public boolean isPrimaryKey() {
		return m_primaryKey;
	}

	public void setPrimaryKey(boolean _primaryKey) {
		m_primaryKey = _primaryKey;
	}

	public String getCheckValue() {
		return m_checkValue;
	}

	public void setCheckValue(String _checkValue) {
		m_checkValue = _checkValue;
	}

	public String getFieldType() {
		String type = getType();
		if (getLength() != -1) {
			type += "(" + getLength();
			if (getDecimal() != -1) {
				type += ", " + getDecimal();
			}
			type += ")";
		}
		return type;
	}

	public String getAttributes() {
		String res = "";
		if (isPrimaryKey()) {
			res += " Primary key";
		}
		if (isAutoIncrement()) {
			res += " Auto Increment";
		}
		return res;
	}

	/**
	 * Clone the model object.
	 *
	 * @return the cloned model object.
	 */
	@Override
	public FieldBean clone() {
		FieldBean datas = new FieldBean();
		try {
			datas = (FieldBean) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace(System.err);
		}
		return datas;
	}
}
