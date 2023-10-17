package generator;

import java.util.ArrayList;
import java.util.List;

import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.FieldBean;
import bean.TableBean;
import util.GenConstants;
import util.GenConstants.K_ARTIFACT_TYPES;
import util.Util;

public class GenPhp extends GenBase {
  private String m_template;

  public GenPhp(String _configFn) throws Exception {
    super(_configFn);
    m_template = getConfig().getProp("php.template.path");
  }

  private void closePhpFunc() {
    appendLn(2, "}");
    appendLn("");
  }

  private void genGetAll(String _spName) {
    appendLn(2, GenConstants.K_FUNCTION + GenConstants.K_PHP_GET_ALL);
    appendLn(2, "{");
    append(4, GenConstants.K_QUERY);
    appendLn(GenConstants.K_CALL + _spName + "(-1)\";");
    appendLn(4, GenConstants.K_RETURN + GenConstants.K_RUN_QUERY + GenConstants.K_SEMI);
    closePhpFunc();
  }

  private void genGetById(String _spName, String _pKeyParam) {
    appendLn(2, GenConstants.K_FUNCTION + GenConstants.K_PHP_GET_BY_ID.replace(GenConstants.K_ID, "$" + _pKeyParam));
    appendLn(2, "{");
    append(4, GenConstants.K_QUERY);
    appendLn(GenConstants.K_CALL + _spName + "( ${" + _pKeyParam + "} )\";");
    appendLn(4, GenConstants.K_RETURN + GenConstants.K_RUN_QUERY + GenConstants.K_SEMI);
    closePhpFunc();
  }

  private void genDelete(String _singleTabName, String _pKeyParam) {
    appendLn(2, GenConstants.K_FUNCTION + GenConstants.K_PHP_DELETE + "( $" + _pKeyParam + ", $loginid )");
    appendLn(2, "{");
    appendLn(4, GenConstants.K_TRY);
    append(6, GenConstants.K_QUERY);
    String bindRefWithLogin = ":" + _pKeyParam + ", :loginid";
    String bindRef = ":" + _pKeyParam;
    appendLn(GenConstants.K_CALL + GenConstants.K_SP_DELETE + Util.getSingleName(_singleTabName) + "( "
        + bindRefWithLogin + " )\";");
    appendLn(6, GenConstants.K_PREPARE_QUERY);
    appendLn(6, GenConstants.K_BIND_PARAM.replace(GenConstants.K_BIND_REF, bindRef).replace(GenConstants.K_BIND_VAL,
        "$" + _pKeyParam));
    appendLn(6, GenConstants.K_BIND_LOGIN);
    appendLn(6, GenConstants.K_EXECUTE_RESULT);
    appendLn(6, GenConstants.K_RETURN_0);
    appendLn(4, GenConstants.K_CATCH);
    appendLn(6, GenConstants.K_ECHO_MESSAGE);
    appendLn(4, "}");
    appendLn(4, GenConstants.K_RETURN_0);
    closePhpFunc();
  }

  private List<String> getBindList(TableBean _table, String _param, Boolean _forUpdate) {
    List<String> bindList = new ArrayList<String>();
    String bindRef;
    String bindVal;
    for (FieldBean fb : _table.getFields()) {
      if (_forUpdate) {
        if (fb.isPrimaryKey()) {
          bindRef = ":" + fb.getName().toLowerCase();
          bindVal = _param + "['" + fb.getName().toLowerCase() + "']";
          append(bindRef + ", ");
          bindList.add(GenConstants.K_BIND_PARAM.replace(GenConstants.K_BIND_REF, bindRef)
              .replace(GenConstants.K_BIND_VAL, bindVal));
        }
      }
      if (!fb.isPrimaryKey() && !isSpecialField(fb.getName())) {
        bindRef = ":" + fb.getName().toLowerCase();
        bindVal = _param + "['" + fb.getName().toLowerCase() + "']";
        append(bindRef + ", ");
        bindList.add(GenConstants.K_BIND_PARAM.replace(GenConstants.K_BIND_REF, bindRef)
            .replace(GenConstants.K_BIND_VAL, bindVal));
      }
    }
    bindVal = _param + "['" + GenConstants.K_LOGIN_ID + "']";
    bindList.add(GenConstants.K_BIND_PARAM.replace(GenConstants.K_BIND_REF, ":" + GenConstants.K_LOGIN_ID)
        .replace(GenConstants.K_BIND_VAL, bindVal));
    return bindList;
  }

  private void genAdd(TableBean _table, String _singleTabName, String _param) {
    appendLn(2, GenConstants.K_FUNCTION + GenConstants.K_PHP_ADD + "( " + _param + " )");
    appendLn(2, "{");
    appendLn(4, GenConstants.K_TRY);
    append(6, GenConstants.K_QUERY);
    append(GenConstants.K_CALL + GenConstants.K_SP_ADD + _singleTabName + "( ");
    List<String> bindList = getBindList(_table, _param, false);
    append(":loginid, @newId");
    appendLn(" )\";");
    appendLn(6, GenConstants.K_PREPARE_QUERY);
    for (String bind : bindList) {
      appendLn(6, bind);
    }
    append(loadFile(m_template + GenConstants.K_PHP_EXEC_QUERY_WITH_OUTPUT));
    appendLn(4, GenConstants.K_CATCH);
    appendLn(6, GenConstants.K_ECHO_MESSAGE);
    appendLn(6, GenConstants.K_RETURN_EMPTY_ARRAY);
    appendLn(4, "}");
    appendLn(2, "}");
  }

  private void genUpdate(TableBean _table, String _singleTabName, String _pKeyParam, String _param) {
    appendLn(2, GenConstants.K_FUNCTION + GenConstants.K_PHP_UPDATE + "( " + _param + " )");
    appendLn(2, "{");
    appendLn(4, GenConstants.K_TRY);
    append(6, GenConstants.K_QUERY);
    append(GenConstants.K_CALL + GenConstants.K_SP_UPDATE + _singleTabName + "( ");
    List<String> bindList = getBindList(_table, _param, true);
    append(":loginid");
    appendLn(" )\";");
    appendLn(6, GenConstants.K_PREPARE_QUERY);
    for (String bind : bindList) {
      appendLn(6, bind);
    }
    appendLn(6, GenConstants.K_IF_STMT_EXECUTE);
    appendLn(8, GenConstants.K_RETURN + GenConstants.K_THIS_GET_BY_ID + _param + "['" + _pKeyParam + "']);");
    appendLn(6, GenConstants.K_END_IF);
    appendLn(6, GenConstants.K_RETURN_EMPTY_ARRAY);
    appendLn(4, GenConstants.K_CATCH);
    appendLn(6, GenConstants.K_ECHO_MESSAGE);
    appendLn(6, GenConstants.K_RETURN_EMPTY_ARRAY);
    appendLn(4, "}");
    closePhpFunc();
  }

  private void genApi(TableBean _table) {
    String tableName = _table.getName();
    clearBuffer();
    String var = "$" + Util.getSingleName(_table.getName()).toLowerCase();
    int maxFieldLength = getMaxFieldsLength(_table.getFields());
    boolean first = true;
    String pKey = "";
    String fieldName = "";

    appendLn(StringUtil.SP(2) + "//$img = $_FILES['imgInput'];");
    appendLn(StringUtil.SP(2) + "//$imgName = isset($img) ? $img['name'] : $_POST['image'];");
    appendLn("");

    appendLn(StringUtil.SP(2) + var + " = array(");
    for (FieldBean fb : _table.getFields()) {
      if (!isSpecialField(fb.getName())) {
        fieldName = fb.getName().toLowerCase();
        if (fb.isPrimaryKey()) {
          pKey = fb.getName().toLowerCase();
        } else {
          if (first) {
            first = false;
            append(StringUtil.SP(4));
          } else {
            append(StringUtil.SP(3) + ",");
          }
          appendLn(StringUtil.filler(quote(fieldName), maxFieldLength) + "=> $_POST['" + fieldName + "']");
        }
      }
    }
    // appendLn(StringUtil.SP(3) + "," + StringUtil.filler(quote("loginid"),
    // maxFieldLength) + "=> -1");
    appendLn(StringUtil.SP(3) + "," + StringUtil.filler(quote("loginid"), maxFieldLength) + "=> $_POST['loginid']");
    appendLn(StringUtil.SP(2) + ");");
    appendLn("");

    appendLn(StringUtil.SP(2) + "$id = $_POST['" + pKey + "'];");
    appendLn(StringUtil.SP(2) + "if (isset($id)):");
    appendLn(StringUtil.SP(4) + var + "['" + pKey + "'] = $id;");
    appendLn(StringUtil.SP(4) + "$res    = $" + tableName.toLowerCase() + "->update(" + var + ");");
    appendLn(StringUtil.SP(4) + "$okMsg  = '" + Util.getSingleName(_table.getName()) + " id [ ' . $id . ' ] updated';");
    appendLn(StringUtil.SP(4) + "$errMsg = 'Unable to update " + Util.getSingleName(_table.getName())
        + " id [ ' . $id . ' ]';");
    appendLn(StringUtil.SP(2) + "else:");
    appendLn(StringUtil.SP(4) + "$res    = $" + tableName.toLowerCase() + "->add(" + var + ");");
    appendLn(StringUtil.SP(4) + "$okMsg  = 'New " + Util.getSingleName(_table.getName()).toLowerCase() + " added';");
    appendLn(
        StringUtil.SP(4) + "$errMsg = 'Unable to add " + Util.getSingleName(_table.getName()).toLowerCase() + "';");
    appendLn(StringUtil.SP(2) + "endif;");
    appendLn("");

    appendLn(StringUtil.SP(2) + "if ($res):");
    appendLn(StringUtil.SP(4) + "$response = array( 'res' => $okMsg, '"
        + Util.getSingleName(_table.getName()).toLowerCase() + "' => $res );");
    appendLn(StringUtil.SP(4) + "Response::success($response);");
    appendLn(StringUtil.SP(2) + "else:");
    appendLn(StringUtil.SP(4) + "Response::error($errMsg);");
    appendLn(StringUtil.SP(2) + "endif;");

    appendLn("");
    appendLn(StringUtil.SP(2) + "//  Save image");
    appendLn(StringUtil.SP(2) + "//if (isset($img['name']) && $img['error'] == 0):");
    appendLn(StringUtil.SP(2) + "//  $imgHandler->saveImage($img);");
    appendLn(StringUtil.SP(2) + "//endif;");

    String postCode = m_buf.toString();

    clearBuffer();
    String apiCode = loadFile(m_template + GenConstants.K_PHP_API_TEMPLATE);
    String objClass = tableName;
    String objName = tableName.toLowerCase();
    String instantiateClass = objName + " = new " + objClass + "();";
    apiCode = apiCode
        .replace(GenConstants.K_CLASS_FILE_NAME, tableName.toLowerCase() + GenConstants.K_DOT_CLASSES_DOT_PHP)
        .replace(GenConstants.K_INSTANTIATE_CLASS, instantiateClass);
    apiCode = apiCode.replaceAll(GenConstants.K_OBJECT_NAME, objName);
    apiCode = apiCode.replace(GenConstants.K_OBJECT_PARAM, Util.getSingleName(objName));
    apiCode = apiCode.replace(GenConstants.K_POST_CODE, postCode);
    appendLn(apiCode);
  }

  private void genDbAccessClass() {
    clearBuffer();
    String dbAccessClass = loadFile(m_template + GenConstants.K_PHP_DB_CLASS);
    dbAccessClass = dbAccessClass.replace(GenConstants.K_DB_HOST_PATTERN, getConfig().getProp(GenConstants.K_DB_HOST))
        .replace(GenConstants.K_DB_USER_PATTERN, getConfig().getProp(GenConstants.K_DB_USER))
        .replace(GenConstants.K_DB_PASSWORD_PATTERN, getConfig().getProp(GenConstants.K_DB_PASSWORD))
        .replace(GenConstants.K_DB_NAME_PATTERN, getConfig().getProp(GenConstants.K_DB_NAME));
    append(dbAccessClass);
  }

  private void genIndexApiClass() {
    clearBuffer();
    String apiIndexClass = loadFile(m_template + GenConstants.K_PHP_INDEX_API);
    apiIndexClass = apiIndexClass.replace(GenConstants.K_PROJECT_NAME_PATTERN,
        getConfig().getProp(GenConstants.K_PROJECT_NAME));
    append(apiIndexClass);
  }

  private void genListUi(TableBean _table) {
    String objName = _table.getName().toLowerCase();
    List<String> tabHeader = new ArrayList<String>();
    List<String> tabBody = new ArrayList<String>();
    for (FieldBean fb : _table.getFields()) {
      if (!fb.isPrimaryKey() && !isSpecialField(fb.getName())) {
        tabHeader.add(GenConstants.K_TH + fb.getName() + GenConstants.K_END_TH);
        // if (fb.getType().equalsIgnoreCase(GenConstants.K_INT) ||
        // fb.getType().equalsIgnoreCase(GenConstants.K_FLOAT)) {
        // tabBody.add(GenConstants.K_TR);
        // }
        // else {
        tabBody.add(
            GenConstants.K_TR + "<?= $" + objName + "->" + fb.getName().toLowerCase() + "?>" + GenConstants.K_END_TR);
        // }
      }
    }
  }

  public List<ArtifactBean> run(TableBean _table) {
    clearBuffer();
    String fn = _table.getName().toLowerCase() + GenConstants.K_CLASS_FILE_NAME_PREFIX;
    appendLn(
        loadFile(m_template + GenConstants.K_PHP_CLASS_TEMPLATE).replace(GenConstants.K_CLASS_NAME, _table.getName()));
    String spName = GenConstants.K_SP_GET + _table.getName();
    String param = "$" + Util.getSingleName(_table.getName().toLowerCase());
    String singleTabName = Util.getSingleName(_table.getName());
    FieldBean pKey = getPKey(_table);
    String pKeyParam = pKey.getName().toLowerCase();
    genGetAll(spName);
    genGetById(spName, pKeyParam);
    genAdd(_table, singleTabName, param);
    genUpdate(_table, singleTabName, pKeyParam, param);
    genDelete(singleTabName, pKeyParam);
    appendLn("}");
    addArtifact(K_ARTIFACT_TYPES.PHP_CLASS, fn, m_buf.toString());
    fn = _table.getName().toLowerCase() + GenConstants.K_DOT_PHP;
    genApi(_table);
    addArtifact(K_ARTIFACT_TYPES.PHP_API, fn, m_buf.toString());
    genDbAccessClass();
    addArtifact(K_ARTIFACT_TYPES.PHP_DB, GenConstants.K_PHP_DB_CLASS, m_buf.toString());
    genIndexApiClass();
    addArtifact(K_ARTIFACT_TYPES.PHP_API, GenConstants.K_PHP_INDEX_API, m_buf.toString());
    genListUi(_table);
    return getArtifacts();
  }
}
