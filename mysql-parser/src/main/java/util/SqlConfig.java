package util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import util.SqlConstants.Tokens;

public class SqlConfig {
  /** Declare a singleton instance variable. */
  private static SqlConfig service;

  /** Subset of SQL tokens. */
  private Map<String, Tokens> m_tokenMap = new HashMap<String, Tokens>();

  /** Subset of SQL data type. */
  private Map<String, Tokens> m_dataTypeMap = new HashMap<String, Tokens>();

  /** SQL comparison symbols. */
  private Map<Tokens, Tokens> m_compareSymbolMap = new HashMap<Tokens, Tokens>();

  /** SQL functions. */
  private Map<String, Tokens> m_sqlFunctionsMap = new HashMap<String, Tokens>();

  /** Application properties (appConfig.properties). */
  private Properties m_properties = new Properties();

  private SqlConfig() {
    try {
      // initProperties();
      initDataType();
      initTokenMap();
      initCompareSymbolMap();
      initSqlFunctionsMap();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public String getProperty(final String _propKey) {
    return m_properties.getProperty(_propKey);
  }

  /**
   * Access method to get the singleton instance of the class.
   * 
   * @return
   * @return ProductEventsService
   */
  public static SqlConfig getInstance() {
    if (SqlConfig.service == null) {
      synchronized (SqlConfig.class) {

        SqlConfig.service = new SqlConfig();

      }
    }
    return SqlConfig.service;
  }

  private void initSqlFunctionsMap() {
  }

  private void initCompareSymbolMap() {
  }

  private void initDataType() {
    m_dataTypeMap.put("BIGINT", Tokens.BIGINT1);
    m_dataTypeMap.put("BINARY", Tokens.BINARY1);
    m_dataTypeMap.put("BLOB", Tokens.BLOB1);
    m_dataTypeMap.put("CHAR", Tokens.CHAR1);
    m_dataTypeMap.put("DATE", Tokens.DATE1);
    m_dataTypeMap.put("DATETIME", Tokens.DATETIME1);
    m_dataTypeMap.put("DECIMAL", Tokens.DECIMAL1);
    m_dataTypeMap.put("DOUBLE", Tokens.DOUBLE1);
    m_dataTypeMap.put("ENUM", Tokens.ENUM1);
    m_dataTypeMap.put("FLOAT", Tokens.FLOAT1);
    m_dataTypeMap.put("INT", Tokens.INT1);
    m_dataTypeMap.put("LONGBLOB", Tokens.LONGBLOB1);
    m_dataTypeMap.put("LONGTEXT", Tokens.LONGTEXT1);
    m_dataTypeMap.put("MEDIUMBLOB", Tokens.MEDIUMBLOB1);
    m_dataTypeMap.put("MEDIUMINT", Tokens.MEDIUMINT1);
    m_dataTypeMap.put("MEDIUMTEXT", Tokens.MEDIUMINT1);
    m_dataTypeMap.put("MONEY", Tokens.MONEY1);
    m_dataTypeMap.put("SMALLINT", Tokens.SMALLINT1);
    m_dataTypeMap.put("TEXT", Tokens.TEXT1);
    m_dataTypeMap.put("TIME", Tokens.TIME1);
    m_dataTypeMap.put("TIMESTAMP", Tokens.TIMESTAMP1);
    m_dataTypeMap.put("TINYBLOB", Tokens.TINYBLOB1);
    m_dataTypeMap.put("TINYINT", Tokens.TINYINT1);
    m_dataTypeMap.put("TINYTEXT", Tokens.TINYTEXT1);
    m_dataTypeMap.put("VARBINARY", Tokens.VARBINARY1);
    m_dataTypeMap.put("VARCHAR", Tokens.VARCHAR1);
    m_dataTypeMap.put("YEAR", Tokens.YEAR1);
  }

  private void initTokenMap() {
    m_tokenMap.put("ACTION", Tokens.ACTION1);
    m_tokenMap.put("ADD", Tokens.ADD1);
    m_tokenMap.put("ASC", Tokens.ASC1);
    m_tokenMap.put("ALTER", Tokens.ALTER1);
    m_tokenMap.put("AUTO_INCREMENT", Tokens.AUTO_INCREMENT1);
    m_tokenMap.put("CASCADE", Tokens.CASCADE1);
    m_tokenMap.put("DATABASE", Tokens.DATABASE1);
    m_tokenMap.put("CHANGE", Tokens.CHANGE1);
    m_tokenMap.put("CHARSET", Tokens.CHARSET1);
    m_tokenMap.put("CHECK", Tokens.CHECK1);
    m_tokenMap.put("COLLATE", Tokens.COLLATE1);
    m_tokenMap.put("CLUSTERED", Tokens.CLUSTERED1);
    m_tokenMap.put("COLUMN", Tokens.COLUMN1);
    m_tokenMap.put("COMMENT", Tokens.COMMENT_WORD1);
    m_tokenMap.put("COMMIT", Tokens.COMMIT1);
    m_tokenMap.put("CONSTRAINT", Tokens.CONSTRAINT1);
    m_tokenMap.put("CURRENT_TIMESTAMP", Tokens.CURRENT_TIMESTAMP1);
    m_tokenMap.put("CREATE", Tokens.CREATE1);
    m_tokenMap.put("DEFAULT", Tokens.DEFAULT1);
    m_tokenMap.put("DELETE", Tokens.DELETE1);
    m_tokenMap.put("DROP", Tokens.DROP1);
    m_tokenMap.put("ENGINE", Tokens.ENGINE1);
    m_tokenMap.put("ENUM", Tokens.ENUM1);
    m_tokenMap.put("EXISTS", Tokens.EXISTS1);
    m_tokenMap.put("FOREIGN", Tokens.FOREIGN1);
    m_tokenMap.put("GO", Tokens.GO1);
    m_tokenMap.put("IF", Tokens.IF1);
    m_tokenMap.put("IN", Tokens.IN1);
    m_tokenMap.put("INDEX", Tokens.INDEX1);
    m_tokenMap.put("INSERT", Tokens.INSERT1);
    m_tokenMap.put("INTO", Tokens.INTO1);
    m_tokenMap.put("INNODB", Tokens.InnoDB1);
    m_tokenMap.put("KEY", Tokens.KEY1);
    m_tokenMap.put("LATIN1", Tokens.latin1);
    m_tokenMap.put("MODIFY", Tokens.MODIFY1);
    m_tokenMap.put("LOCK", Tokens.LOCK1);
    m_tokenMap.put("MYISAM", Tokens.MyISAM1);
    m_tokenMap.put("NO", Tokens.NO1);
    m_tokenMap.put("NOT", Tokens.NOT1);
    m_tokenMap.put("NOW", Tokens.NOW1);
    m_tokenMap.put("NULL", Tokens.NULL1);
    m_tokenMap.put("OFF", Tokens.OFF1);
    m_tokenMap.put("ON", Tokens.ON1);
    m_tokenMap.put("PRIMARY", Tokens.PRIMARY1);
    m_tokenMap.put("REFERENCES", Tokens.REFERENCES1);
    m_tokenMap.put("SET", Tokens.SET1);
    m_tokenMap.put("START", Tokens.START1);
    m_tokenMap.put("TABLE", Tokens.TABLE1);
    m_tokenMap.put("TABLES", Tokens.TABLES1);
    m_tokenMap.put("TRANSACTION", Tokens.TRANSACTION1);
    m_tokenMap.put("UNIQUE", Tokens.UNIQUE1);
    m_tokenMap.put("UNLOCK", Tokens.UNLOCK1);
    m_tokenMap.put("UNSIGNED", Tokens.UNSIGNED1);
    m_tokenMap.put("USE", Tokens.USE1);
    m_tokenMap.put("UPDATE", Tokens.UPDATE1);
    m_tokenMap.put("UTF8", Tokens.utf81);
    m_tokenMap.put("UTF8_UNICODE_CI", Tokens.utf8_unicode_ci1);
    m_tokenMap.put("WRITE", Tokens.WRITE1);
    m_tokenMap.put("VALUES", Tokens.VALUES1);
    m_tokenMap.put("WITH", Tokens.WITH1);
  }

  public Map<String, Tokens> getTokenMap() {
    return m_tokenMap;
  }

  public Map<String, Tokens> getDataTypeMap() {
    return m_dataTypeMap;
  }

  public Map<Tokens, Tokens> getCompareSymbolMap() {
    return m_compareSymbolMap;
  }

  public Map<String, Tokens> getSqlFunctionsMap() {
    return m_sqlFunctionsMap;
  }

  public String[] getReserveWords() {
    List<String> reservedWords = new ArrayList<String>();
    for (String str : getTokenMap().keySet()) {
      reservedWords.add(str.toLowerCase());
    }
    reservedWords.addAll(getTokenMap().keySet());
    return (String[]) reservedWords.toArray(new String[reservedWords.size()]);
  }

  /**
   * Set the tokenMap.
   * 
   * @param _tokenMap The tokenMap to set.
   */
  public void setTokenMap(final Map<String, Tokens> _tokenMap) {
    m_tokenMap = _tokenMap;
  }

  public boolean isSqlFunction(String _str) {
    return getSqlFunctionsMap().containsKey(_str);
  }
}
