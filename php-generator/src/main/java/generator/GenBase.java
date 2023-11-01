package generator;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.satcomgroup.framework.util.FileUtil;
import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.FieldBean;
import bean.TableBean;
import util.ConfigHandler;
import util.GenConstants;
import util.GenConstants.K_ARTIFACT_TYPES;

public class GenBase {
  private ConfigHandler m_config;
  protected StringBuffer m_buf = new StringBuffer();
  protected SimpleDateFormat m_datFmt = new SimpleDateFormat("yyyy-MM-dd");

  protected List<ArtifactBean> m_artifactList = new ArrayList<ArtifactBean>();

  public GenBase(String _configFn) throws Exception {
    m_config = new ConfigHandler(_configFn);
  }

  public ConfigHandler getConfig() {
    return m_config;
  }

  protected String loadFile(String _fileName) {
    StringBuffer buf = new StringBuffer();
    List<String> lines = FileUtil.readFile(_fileName);
    for (String line : lines) {
      buf.append(line + "\r\n");
    }
    return buf.toString();
  }

  protected void append(String _str) {
    m_buf.append(_str);
  }

  protected void append(int _numSpace, String _str) {
    m_buf.append(StringUtil.SP(_numSpace) + _str);
  }

  protected void appendLn(String _str) {
    m_buf.append(_str + GenConstants.K_CRLF);
  }

  protected void appendLn(int _numSpace, String _str) {
    m_buf.append(StringUtil.SP(_numSpace) + _str + GenConstants.K_CRLF);
  }

  protected int getMaxFieldsLength(List<FieldBean> _fieldList) {
    int maxLen = -1;
    for (FieldBean fb : _fieldList) {
      if (maxLen < fb.getName().length()) {
        maxLen = fb.getName().length() + 5;
      }
    }
    return maxLen;
  }

  protected String getValue(String _fieldName) {
    int pos = _fieldName.toLowerCase().indexOf(GenConstants.K_DATE_FIELD);
    if (pos > -1)
      return GenConstants.K_GET_DATE;
    pos = _fieldName.toLowerCase().indexOf(GenConstants.K_BY_FIELD);
    if (pos > -1)
      return GenConstants.K_P_LOGIN_ID;
    return "";
  }

  protected FieldBean getPKey(TableBean _table) {
    FieldBean pKey = null;
    for (FieldBean fb : _table.getFields()) {
      if (fb.isPrimaryKey()) {
        pKey = fb;
      }
    }
    return pKey;
  }

  protected void clearBuffer() {
    m_buf.setLength(0);
  }

  protected String quote(String _str) {
    return "'" + _str + "'";
  }

  protected String dbQuote(String _str) {
    return "\"" + _str + "\"";
  }

  protected boolean isSpecialField(String _fieldName) {
    boolean res = false;
    int index = 0;
    while (res == false && index < GenConstants.K_SPECIAL_FIELDS.length) {
      res = _fieldName.contentEquals(GenConstants.K_SPECIAL_FIELDS[index]);
      index++;
    }
    return res;
  }

  protected void backBuffer(int _pos) {
    m_buf.setLength(m_buf.length() - _pos);
  }

  protected void addArtifact(K_ARTIFACT_TYPES _type, String _fileName, String _sourceCode) {
    m_artifactList.add(new ArtifactBean(_type, _fileName, _sourceCode));
  }

  public List<ArtifactBean> getArtifacts() {
    return m_artifactList;
  }

  protected void clearArtifacts() {
    m_artifactList.clear();
  }
}
