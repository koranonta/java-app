package generator;

import java.util.Date;
import java.util.List;

import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.FieldBean;
import bean.TableBean;
import util.GenConstants;
import util.GenConstants.K_ARTIFACT_TYPES;
import util.Util;

public class GenSp extends GenBase {

  private String m_author;
  private String m_template;

  public GenSp(String _configFn) throws Exception {
    super(_configFn);
    m_author = getConfig().getProp("author");
    m_template = getConfig().getProp("sql.template.path");
  }

  private String getAuthor() {
    return m_author;
  }

  private String getCommentBlock(String _spName) {
    String comment = loadFile(m_template + GenConstants.K_SQL_COMMENT_BLOCK).replace(GenConstants.K_SP_NAME, _spName)
        .replace(GenConstants.K_DATE, m_datFmt.format(new Date()));
    comment = comment.replace(GenConstants.K_AUTHOR, getAuthor());
    return comment;
  }

  private String getParameterType(FieldBean _fb) {
    if (_fb.getType().equalsIgnoreCase("varchar"))
      return _fb.getType() + "(" + _fb.getLength() + ")";
    return _fb.getType();
  }

  private String genAdd(TableBean _table) {
    clearBuffer();
    String spName = GenConstants.K_SP_ADD + Util.getSingleName(_table.getName());
    append(loadFile(m_template + GenConstants.K_MYSQL_PROLOG).replace(GenConstants.K_SP_NAME, spName));
    appendLn(GenConstants.K_CREATE_PROC + spName + " (");
    boolean first = true;
    int maxFieldLength = getMaxFieldsLength(_table.getFields());
    String insertFields = "";
    String valueFields = "";
    FieldBean primaryField = null;
    for (FieldBean fb : _table.getFields()) {
      if (fb.isPrimaryKey()) {
        primaryField = fb;
      }
      if (!fb.isPrimaryKey() && !isSpecialField(fb.getName())) {
        if (first) {
          first = false;
          appendLn(StringUtil.SP(2) + "p" + StringUtil.filler(fb.getName(), maxFieldLength) + getParameterType(fb));
          insertFields += fb.getName();
          valueFields += "p" + fb.getName();
        } else {
          appendLn(StringUtil.SP(1) + ",p" + StringUtil.filler(fb.getName(), maxFieldLength) + getParameterType(fb));
          insertFields += ", " + fb.getName();
          valueFields += ", p" + fb.getName();
        }
      }
    }
    for (String spFields : GenConstants.K_ADD_SPECIAL_FIELDS) {
      insertFields += ", " + spFields;
      valueFields += ", " + getValue(spFields);
    }
    appendLn(
        StringUtil.SP(1) + "," + StringUtil.filler(GenConstants.K_P_LOGIN_ID, maxFieldLength + 1) + GenConstants.K_INT);
    appendLn(StringUtil.SP(1) + ",OUT o" + StringUtil.filler(primaryField.getName(), (maxFieldLength - 4))
        + getParameterType(primaryField));

    appendLn(")");
    append(getCommentBlock(spName));
    appendLn(GenConstants.K_BEGIN);
    appendLn(GenConstants.K_SET_LOGIN_ID);

    String insertStmt = loadFile(m_template + GenConstants.K_MYSQL_INSERT)
        .replace(GenConstants.K_INSERT_FIELDS, insertFields).replace(GenConstants.K_VALUE_FIELDS, valueFields)
        .replace(GenConstants.K_TABLE_NAME, _table.getName());
    append(insertStmt);
    appendLn(StringUtil.SP(2) + "SET o" + primaryField.getName() + " = LAST_INSERT_ID();");
    appendLn(loadFile(m_template + GenConstants.K_MYSQL_EPILOG));
    return spName + GenConstants.K_DOT_SQL;
  }

  private String genUpdate(TableBean _table) {
    clearBuffer();
    String spName = GenConstants.K_SP_UPDATE + Util.getSingleName(_table.getName());
    append(loadFile(m_template + GenConstants.K_MYSQL_PROLOG).replace(GenConstants.K_SP_NAME, spName));
    appendLn(GenConstants.K_CREATE_PROC + spName + " (");
    boolean first = true;
    int maxFieldLength = getMaxFieldsLength(_table.getFields());
    String updateValues = "";
    String pKey = "";
    for (FieldBean fb : _table.getFields()) {
      if (!isSpecialField(fb.getName())) {
        if (fb.isPrimaryKey()) {
          pKey = fb.getName();
        }
        if (first) {
          first = false;
          appendLn(StringUtil.SP(2) + "p" + StringUtil.filler(fb.getName(), maxFieldLength) + getParameterType(fb));
          updateValues = StringUtil.SP(5) + "SET " + StringUtil.filler(fb.getName(), maxFieldLength) + " = p"
              + fb.getName();
        } else {
          appendLn(StringUtil.SP(1) + ",p" + StringUtil.filler(fb.getName(), maxFieldLength) + getParameterType(fb));
          updateValues += GenConstants.K_CRLF + StringUtil.SP(8) + "," + StringUtil.filler(fb.getName(), maxFieldLength)
              + " = p" + fb.getName();
        }
      }
    }
    for (String spField : GenConstants.K_UPDATE_SPECIAL_FIELDS) {
      updateValues += GenConstants.K_CRLF + StringUtil.SP(8) + "," + StringUtil.filler(spField, maxFieldLength) + " = "
          + getValue(spField);
    }
    appendLn(
        StringUtil.SP(1) + "," + StringUtil.filler(GenConstants.K_P_LOGIN_ID, maxFieldLength + 1) + GenConstants.K_INT);
    appendLn(")");
    append(getCommentBlock(spName));
    appendLn(GenConstants.K_BEGIN);
    appendLn(GenConstants.K_SET_LOGIN_ID);

    String updateStmt = loadFile(m_template + GenConstants.K_MYSQL_UPDATE).replace(GenConstants.K_TABLE_NAME,
        _table.getName());
    updateStmt = updateStmt.replace(GenConstants.K_UPDATE_VALUES, updateValues);
    updateStmt = updateStmt.replace(GenConstants.K_PRIMARY_KEY, pKey);
    updateStmt = updateStmt.replace(GenConstants.K_KEY_VALUE, "p" + pKey);

    append(updateStmt);

    appendLn(loadFile(m_template + GenConstants.K_MYSQL_EPILOG));
    return spName + GenConstants.K_DOT_SQL;
  }

  protected String genDelete01(TableBean _table) {
    clearBuffer();
    System.out.println(_table.getName());
    String spName = GenConstants.K_SP_DELETE + Util.getSingleName(_table.getName());
    append(loadFile(m_template + GenConstants.K_MYSQL_PROLOG).replace(GenConstants.K_SP_NAME, spName));
    appendLn(GenConstants.K_CREATE_PROC + spName + " (");
    FieldBean pKey = getPKey(_table);
    appendLn(StringUtil.SP(2) + "p" + pKey.getName() + " " + pKey.getFieldType());
    appendLn(")");
    append(getCommentBlock(spName));
    appendLn(GenConstants.K_BEGIN);
    String deleteStmt = StringUtil.SP(2)
        + GenConstants.K_DELETE_QUERY.replace(GenConstants.K_TABLE_NAME, _table.getName());
    deleteStmt = deleteStmt.replace(GenConstants.K_PRIMARY_KEY, pKey.getName());
    deleteStmt = deleteStmt.replace(GenConstants.K_KEY_VALUE, "p" + pKey.getName() + ";");
    appendLn(deleteStmt);
    appendLn(loadFile(m_template + GenConstants.K_MYSQL_EPILOG));
    return spName + GenConstants.K_DOT_SQL;
  }

  private String genDelete(TableBean _table) {
    clearBuffer();
    System.out.println(_table.getName());
    String spName = GenConstants.K_SP_DELETE + Util.getSingleName(_table.getName());
    append(loadFile(m_template + GenConstants.K_MYSQL_PROLOG).replace(GenConstants.K_SP_NAME, spName));
    appendLn(GenConstants.K_CREATE_PROC + spName + " (");
    FieldBean pKey = getPKey(_table);
    String pKeyName = "p" + pKey.getName();
    appendLn(StringUtil.SP(2) + pKeyName + " " + pKey.getFieldType());
    appendLn(StringUtil.SP(1) + StringUtil.filler(",pLoginId", pKeyName.length() + 1) + " INT");
    appendLn(")");
    append(getCommentBlock(spName));
    appendLn(GenConstants.K_BEGIN);
    String deleteStmt = loadFile(m_template + GenConstants.K_MYSQL_DELETE);
    deleteStmt = deleteStmt.replace(GenConstants.K_TABLE_NAME, _table.getName());
    deleteStmt = deleteStmt.replace(GenConstants.K_PRIMARY_KEY, pKey.getName());
    deleteStmt = deleteStmt.replace(GenConstants.K_KEY_VALUE, "p" + pKey.getName());
    append(deleteStmt);
    appendLn(loadFile(m_template + GenConstants.K_MYSQL_EPILOG));
    return spName + GenConstants.K_DOT_SQL;
  }

  private String genSelectAll(TableBean _table) {
    clearBuffer();
    String spName = GenConstants.K_SP_GET + _table.getName();
    append(loadFile(m_template + GenConstants.K_MYSQL_PROLOG).replace(GenConstants.K_SP_NAME, spName));
    FieldBean pKey = getPKey(_table);
    appendLn(GenConstants.K_CREATE_PROC + spName + " (");
    appendLn(StringUtil.SP(2) + "p" + pKey.getName() + " " + pKey.getFieldType());
    appendLn(")");
    append(getCommentBlock(spName));
    appendLn(GenConstants.K_BEGIN);
    boolean first = true;
    int maxFieldLength = getMaxFieldsLength(_table.getFields());
    for (FieldBean fb : _table.getFields()) {
      if (!isSpecialField(fb.getName())) {
        if (first) {
          first = false;
          appendLn(StringUtil.SP(2) + GenConstants.K_SELECT + StringUtil.filler(fb.getName(), maxFieldLength)
              + GenConstants.K_AS + fb.getName().toLowerCase());
        } else {
          appendLn(StringUtil.SP(8) + "," + StringUtil.filler(fb.getName(), maxFieldLength) + GenConstants.K_AS
              + fb.getName().toLowerCase());
        }
      }
    }
    String paramKey = "p" + pKey.getName();
    appendLn(StringUtil.SP(2) + GenConstants.K_FROM + _table.getName());
    appendLn(StringUtil.SP(2) + GenConstants.K_WHERE_DATE_DELETED_IS_NULL);
    String cond = "AND (" + pKey.getName() + " = " + paramKey + " OR IF( " + paramKey + " <= 0, 1, 0) = 1);";
    appendLn(StringUtil.SP(5) + cond);
    appendLn(loadFile(m_template + GenConstants.K_MYSQL_EPILOG));
    return spName + GenConstants.K_DOT_SQL;
  }

  // AND (ProductId = pProductId OR IF(pProductId <= 0 , 1, 0) = 1);

  protected String genSelectById(TableBean _table) {
    clearBuffer();

    String spName = GenConstants.K_SP_GET + Util.getSingleName(_table.getName()) + GenConstants.K_BY_ID;
    append(loadFile(m_template + GenConstants.K_MYSQL_PROLOG).replace(GenConstants.K_SP_NAME, spName));
    appendLn(GenConstants.K_CREATE_PROC + spName + " (");

    FieldBean pKey = getPKey(_table);
    appendLn(StringUtil.SP(2) + "p" + pKey.getName() + " " + pKey.getFieldType());
    appendLn(")");
    append(getCommentBlock(spName));
    appendLn(GenConstants.K_BEGIN);
    boolean first = true;
    int maxFieldLength = getMaxFieldsLength(_table.getFields());
    for (FieldBean fb : _table.getFields()) {
      if (!isSpecialField(fb.getName())) {
        if (first) {
          first = false;
          appendLn(StringUtil.SP(2) + GenConstants.K_SELECT + StringUtil.filler(fb.getName(), maxFieldLength)
              + GenConstants.K_AS + fb.getName().toLowerCase());
        } else {
          appendLn(StringUtil.SP(8) + "," + StringUtil.filler(fb.getName(), maxFieldLength) + GenConstants.K_AS
              + fb.getName().toLowerCase());
        }
      }
    }
    appendLn(StringUtil.SP(2) + GenConstants.K_FROM + _table.getName());
    String whereClause = GenConstants.K_WHERE_PKEY.replace(GenConstants.K_PRIMARY_KEY, pKey.getName())
        .replace(GenConstants.K_KEY_VALUE, "p" + pKey.getName());
    appendLn(StringUtil.SP(3) + whereClause);
    appendLn(StringUtil.SP(2) + GenConstants.K_AND_DATE_DELETED_IS_NULL + ";");
    appendLn(loadFile(m_template + GenConstants.K_MYSQL_EPILOG));
    return spName + GenConstants.K_DOT_SQL;
  }

  public List<ArtifactBean> run(TableBean _table) {
    String fn = genAdd(_table);
    addArtifact(K_ARTIFACT_TYPES.SQL, fn, m_buf.toString());
    // System.out.println(m_buf.toString());
    fn = genUpdate(_table);
    addArtifact(K_ARTIFACT_TYPES.SQL, fn, m_buf.toString());
    // System.out.println(m_buf.toString());
    fn = genDelete(_table);
    addArtifact(K_ARTIFACT_TYPES.SQL, fn, m_buf.toString());
    // System.out.println(m_buf.toString());
    fn = genSelectAll(_table);
    addArtifact(K_ARTIFACT_TYPES.SQL, fn, m_buf.toString());
    // System.out.println(m_buf.toString());
    // fn = genSelectById(_table);
    // addArtifact(K_ARTIFACT_TYPES.SQL, fn, m_buf.toString());
    // System.out.println(m_buf.toString());
    return getArtifacts();
  }
}
