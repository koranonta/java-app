package util;

public class GenConstants {
  public static final String K_CRLF = "\r\n";
  public static final String K_SP_NAME = "@@SP_NAME@@";
  public static final String K_AUTHOR = "@@AUTHOR@@";
  public static final String K_DATE = "@@DATE@@";
  public static final String K_INSERT_FIELDS = "@@INSERT_FIELDS@@";
  public static final String K_VALUE_FIELDS = "@@VALUE_FIELDS@@";
  public static final String K_TABLE_NAME = "@@TABLE_NAME@@";
  public static final String K_PRIMARY_KEY = "@@PRIMARY_KEY@@";
  public static final String K_KEY_VALUE = "@@KEY_VALUE@@";
  public static final String K_UPDATE_VALUES = "@@UPDATE_VALUES@@";
  public static final String K_WHERE_PKEY = "WHERE @@PRIMARY_KEY@@ = @@KEY_VALUE@@";
  public static final String K_DELETE_QUERY = "DELETE FROM @@TABLE_NAME@@ " + K_WHERE_PKEY;

  public static final String K_SELECT = "SELECT ";
  public static final String K_FROM = "  FROM ";
  public static final String K_DATE_DELETED_IS_NULL = "DateDeleted IS NULL";
  public static final String K_AND_DATE_DELETED_IS_NULL = "   AND " + K_DATE_DELETED_IS_NULL;
  public static final String K_WHERE_DATE_DELETED_IS_NULL = " WHERE " + K_DATE_DELETED_IS_NULL;
  public static final String K_AS = " as ";
  public static final String K_BY_ID = "ById";

  public static final String K_CREATE_PROC = "CREATE PROCEDURE ";
  public static final String K_BEGIN = "BEGIN";
  public static final String K_END = "END";
  public static final String K_SQL_COMMENT_BLOCK = "SqlCommentBlock.sql";
  public static final String K_MYSQL_INSERT = "MySqlInsert.sql";
  public static final String K_MYSQL_UPDATE = "MySqlUpdate.sql";
  public static final String K_MYSQL_DELETE = "MySqlDelete.sql";
  public static final String K_MYSQL_PROLOG = "MySqlProlog.sql";
  public static final String K_MYSQL_EPILOG = "MySqlEpilog.sql";
  public static final String K_SP_ADD = "spAdd";
  public static final String K_SP_UPDATE = "spUpdate";
  public static final String K_SP_DELETE = "spDelete";
  public static final String K_SP_GET = "spGet";
  public static final String K_CALL = "CALL ";
  public static final String K_SET_LOGIN_ID = "  SET pLoginId = IFNULL(pLoginId, -1);";
  public static final String K_P_LOGIN_ID = "pLoginId";
  public static final String K_INT = "INT";
  public static final String K_DATE_FIELD = "date";
  public static final String K_BY_FIELD = "by";
  public static final String K_GET_DATE = "Now()";
  public static final String K_DELIMITER = "DELIMITER";
  public static final String K_USE = "USE";

  public static final String K_SPECIAL_FIELDS[] = { "DateCreated", "DateModified", "DateDeleted", "CreatedBy",
      "ModifiedBy", "DeletedBy" };
  public static final String K_ADD_SPECIAL_FIELDS[] = { "DateCreated", "DateModified", "CreatedBy", "ModifiedBy" };
  public static final String K_UPDATE_SPECIAL_FIELDS[] = { "DateModified", "ModifiedBy" };

  // PHP
  public static final String K_FUNCTION = "function ";
  public static final String K_RETURN = "return ";
  public static final String K_ARROW = "->";
  public static final String K_PHP_CLASS_TEMPLATE = "php-class.php";
  public static final String K_ID = "@@ID@@";
  public static final String K_QUERY = "$query = \"";
  public static final String K_RUN_QUERY = "$this->runQuery($query)";
  public static final String K_PREPARE_QUERY = "$stmt = $this->pdo->prepare($query);";
  public static final String K_BIND_PARAM = "$stmt->bindParam('@@BINDREF@@', @@BINDVAL@@);";
  public static final String K_BIND_REF = "@@BINDREF@@";
  public static final String K_BIND_VAL = "@@BINDVAL@@";
  public static final String K_PHP_GET_ALL = "getAll()";
  public static final String K_PHP_GET_BY_ID = "getById( @@ID@@ )";
  public static final String K_PHP_ADD = "add";
  public static final String K_PHP_UPDATE = "update";
  public static final String K_PHP_DELETE = "delete";
  public static final String K_SEMI = ";";
  public static final String K_CLASS_NAME = "@@CLASSNAME@@";
  public static final String K_EXECUTE_RESULT = "if ($stmt->execute()) return 1;";
  public static final String K_RETURN_0 = "return 0;";
  public static final String K_PHP_EXEC_QUERY_WITH_OUTPUT = "execute-query-with-output.php";
  public static final String K_PHP_EXEC_UPDATE_QUERY = "execute-update-query.php";
  public static final String K_PHP_EXEC_QUERY = "execute-query.php";
  public static final String K_LOGIN_ID = "loginid";
  public static final String K_DOT_SQL = ".sql";
  public static final String K_OBJECT_PARAM = "@@OBJECT_PARAM@@";
  public static final String K_TRY = "try {";
  public static final String K_CATCH = "} catch (Exception $e) {";
  public static final String K_ECHO_MESSAGE = "echo $e->getMessage();";
  public static final String K_RETURN_EMPTY_ARRAY = "return array();";
  public static final String K_IF_STMT_EXECUTE = "if ($stmt->execute()):";
  public static final String K_END_IF = "endif;";
  public static final String K_THIS_GET_BY_ID = "$this->getById(";
  public static final String K_BIND_LOGIN = "$stmt->bindParam(':loginid', $loginid);";

  // PHP API
  public static final String K_PHP_API_TEMPLATE = "php-api.php";
  public static final String K_CLASS_FILE_NAME = "@@CLASS_FILE_NAME@@";
  public static final String K_CLASS_FILE_NAME_PREFIX = ".classes.php";
  public static final String K_INSTANTIATE_CLASS = "@@INSTANTIATE_CLASS@@";
  public static final String K_OBJECT_NAME = "@@OBJECT_NAME@@";
  public static final String K_DOT_CLASSES_DOT_PHP = ".classes.php";
  public static final String K_DOT_PHP = ".php";
  public static final String K_POST_CODE = "@@POST_CODE@@";

  // DB access
  public static final String K_PHP_DB_CLASS = "db.classes.php";
  public static final String K_DB_HOST_PATTERN = "@@DB_HOST@@";
  public static final String K_DB_USER_PATTERN = "@@DB_USER@@";
  public static final String K_DB_PASSWORD_PATTERN = "@@DB_PASSWORD";
  public static final String K_DB_NAME_PATTERN = "@@DB_NAME@@";
  public static final String K_DB_HOST = "db.host";
  public static final String K_DB_USER = "db.user";
  public static final String K_DB_PASSWORD = "db.password";
  public static final String K_DB_NAME = "db.name";

  public static final String K_PHP_REST_BASE = "response.classes.php";
  public static final String K_PHP_API_UTIL = "apiutil.php";

  public static final String K_PHP_INDEX_API = "index.php";
  public static final String K_PROJECT_NAME_PATTERN = "@@PROJECT_NAME@@";
  public static final String K_PROJECT_NAME = "project.name";
  public static final String K_DOT_HTACCESS = ".htaccess";

  // Artifact types
  public static enum K_ARTIFACT_TYPES {
    SQL, PHP_CLASS, PHP_API, PHP_DB, PHP_RES_BASE, PHP_UI, REACT_UI
  };

  // Configuration
  public static final String K_ROOT_DIR = "root.dir";
  public static final String K_PHP_API_DIR = "php.api.dir";
  public static final String K_PHP_CLASSES_DIR = "php.classes.dir";
  public static final String K_SQL_DIR = "sql.dir";
  public static final String K_GEN_AUTHOR = "author";
  public static final String K_PHP_TEMPLATE_PATH = "php.template.path";
  public static final String K_SQL_TEMPLATE_PATH = "sql.template.path";
  public static final String K_INPUT_FILE = "input.file";
  public static final String K_MERGE_DIR = "merge.dir";
  public static final String K_DATABASE_NAME = "database.name";
  public static final String K_DEPLOY_FILE_NAME = "deploy.file.name";

  // HTML
  public static final String K_TR = "<tr>";
  public static final String K_END_TR = "</tr>";
  public static final String K_TH = "<th>";
  public static final String K_END_TH = "</th>";
  public static final String K_TD = "<td>";
  public static final String K_END_TD = "</td>";
  public static final String K_FLOAT = "FLOAT";

}
