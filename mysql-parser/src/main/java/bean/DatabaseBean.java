package bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DatabaseBean {
  private String m_dbName;
  private Map<String, TableBean> m_tableMap = new LinkedHashMap<String, TableBean>();

  public DatabaseBean(String _dbName) {
    setDbName(_dbName);
  }

  public String getDbName() {
    return m_dbName;
  }

  public void setDbName(String _dbName) {
    m_dbName = _dbName;
  }

  public List<TableBean> getTableList() {
    List<TableBean> tabList = new ArrayList<TableBean>();
    for (Iterator<String> it = m_tableMap.keySet().iterator(); it.hasNext();) {
      tabList.add(m_tableMap.get(it.next()));
    }
    return tabList;
  }

  public void addTable(TableBean _tableBean) {
    if (!m_tableMap.containsKey(_tableBean.getName())) {
      m_tableMap.put(_tableBean.getName(), _tableBean);
    }
  }

  public TableBean getTable(String _tableName) {
    return m_tableMap.get(_tableName);
  }

  public String toString() {
    StringBuffer buf = new StringBuffer();
    buf.append("Database name : " + getDbName() + "\r\n");
    buf.append("-----------------------------------------------\r\n");
    if (!getTableList().isEmpty()) {
      buf.append("Tables\r\n");
      buf.append("-----------------------------------------------\r\n");
      for (TableBean tabBean : getTableList()) {
        buf.append(tabBean + "\r\n");
      }
    }
    return buf.toString();
  }
}
