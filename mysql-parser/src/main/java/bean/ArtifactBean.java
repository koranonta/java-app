package bean;

import util.GenConstants.K_ARTIFACT_TYPES;

public class ArtifactBean {
  private String m_fileName;
  private String m_sourceCode;
  private K_ARTIFACT_TYPES m_type;

  public ArtifactBean() {
  }

  public ArtifactBean(String _fileName, String _sourceCode) {
    setFileName(_fileName);
    setSourceCode(_sourceCode);
  }

  public ArtifactBean(K_ARTIFACT_TYPES _kind, String _fileName, String _sourceCode) {
    setKind(_kind);
    setFileName(_fileName);
    setSourceCode(_sourceCode);
  }

  public K_ARTIFACT_TYPES getType() {
    return m_type;
  }

  public void setKind(K_ARTIFACT_TYPES _type) {
    m_type = _type;
  }

  public String getFileName() {
    return m_fileName;
  }

  public void setFileName(String _fileName) {
    m_fileName = _fileName;
  }

  public String getSourceCode() {
    return m_sourceCode;
  }

  public void setSourceCode(String _sourceCode) {
    m_sourceCode = _sourceCode;
  }
}
