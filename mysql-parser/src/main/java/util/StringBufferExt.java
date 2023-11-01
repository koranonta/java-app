package util;

import com.satcomgroup.util.basic.StringUtil;

public class StringBufferExt {
  private StringBuffer m_buf = new StringBuffer();

  public StringBufferExt() {
  }

  public void append(String _str) {
    m_buf.append(_str);
  }

  public void append(int _numSpace, String _str) {
    m_buf.append(StringUtil.SP(_numSpace) + _str);
  }

  public void appendLn(String _str) {
    m_buf.append(_str + GenConstants.K_CRLF);
  }

  public void appendLn(int _numSpace, String _str) {
    m_buf.append(StringUtil.SP(_numSpace) + _str + GenConstants.K_CRLF);
  }

  public String toString() {
    return m_buf.toString();
  }
}
