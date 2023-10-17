package bean;

import java.util.ArrayList;
import java.util.List;

import com.satcomgroup.util.basic.StringUtil;

import util.SqlConstants.K_KEY_TYPES;
import util.Util;

public class TableBean {
  private String m_name;
  /** The table field list. */
  private List<FieldBean> m_fields = new ArrayList<FieldBean>();
  /** The table key list. */
  private List<KeyBean> m_keys = new ArrayList<KeyBean>();
  private static final int K_SPACE = 3;

  public TableBean() {
  }

  public TableBean(String _name) {
    setName(_name);
  }

  public void setName(String _name) {
    m_name = _name;
  }

  public String getName() {
    return m_name;
  }

  public List<FieldBean> getFields() {
    return m_fields;
  }

  public void addField(FieldBean _field) {
    m_fields.add(_field);
  }

  public List<KeyBean> getKeys() {
    return m_keys;
  }

  public void addKey(KeyBean _key) {
    m_keys.add(_key);
    if (K_KEY_TYPES.PRIMARY1 == _key.getKeyType()) {
      FieldBean fb = getFieldBean(_key.getFieldName());
      if (null != fb) {
        fb.setPrimaryKey(true);
      }
    }

  }

  public boolean isPrimaryKey(String _fieldName) {
    for (KeyBean keyBean : getKeys()) {
      if (keyBean.getFieldName().equalsIgnoreCase(_fieldName)) {
        return true;
      }
    }
    return false;
  }

  public String getPrimaryKeyName() {
    for (KeyBean keyBean : getKeys()) {
      if (keyBean.isPrimaryKey()) {
        return keyBean.getFieldName();
      }
    }
    return null;
  }

  public FieldBean getFieldBean(String _fieldName) {
    for (FieldBean fb : getFields()) {
      if (fb.getName().equalsIgnoreCase(_fieldName)) {
        return fb;
      }
    }
    return null;
  }

  public KeyBean getKeyBean(String _fieldName) {
    for (KeyBean kb : getKeys()) {
      if (kb.getFieldName().equalsIgnoreCase(_fieldName)) {
        return kb;
      }
    }
    return null;
  }

  public int getMaxFieldLength() {
    int maxLen = 0;
    if (!getFields().isEmpty()) {
      for (FieldBean field : getFields()) {
        if (field.getName().length() > maxLen) {
          maxLen = field.getName().length();
        }
      }
    }
    return maxLen == 0 ? 0 : maxLen + K_SPACE;
  }

  public String getSingleEntityName() {
    return Util.getSingleName(getName());
  }

  @Override
  public String toString() {
    StringBuffer buf = new StringBuffer();
    buf.append(getName() + "\r\n");
    if (!getFields().isEmpty()) {
      int maxLen = getMaxFieldLength();
      for (FieldBean field : getFields()) {
        buf.append("  " + StringUtil.filler(field.getName(), maxLen) + field.getFieldType() + "\r\n");
      }
      buf.append("\r\n");
    }
    if (!getKeys().isEmpty()) {
      for (KeyBean key : getKeys()) {
        buf.append("  " + key + "\r\n");
      }
      buf.append("\r\n");
    }
    return buf.toString();
  }
}
