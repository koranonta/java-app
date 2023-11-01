package test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Properties;

import org.apache.shardingsphere.sql.parser.api.CacheOption;
import org.apache.shardingsphere.sql.parser.api.SQLParserEngine;
import org.apache.shardingsphere.sql.parser.api.SQLVisitorEngine;
import org.apache.shardingsphere.sql.parser.core.ParseASTNode;

import com.satcomgroup.framework.util.FileUtil;
import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.TableBean;
import generator.GenHtml;
import generator.GenPhp;
import generator.GenPostman;
import generator.GenSp;
import parser.SqlParser;
import scanner.SqlScanner;
import util.ConfigHandler;
import util.GenConstants;
import util.GenConstants.K_ARTIFACT_TYPES;

public class GenPhpApp {
  private static final String K_PHP_SYNTAX_CHECK = "php -ln ";

  public GenPhpApp() throws Exception {
  }

  private void clearDirs(String _rootDir, String _sqlDir, String _phpClassDir, String _phpApiDir) throws Exception {
    if (!StringUtil.isEmpty(_rootDir)) {
      if (FileUtil.dirExists(_rootDir))
        FileUtil.deleteDir(_rootDir);
      FileUtil.createDir(_rootDir);
      if (!FileUtil.dirExists(_sqlDir))
        FileUtil.createDir(_sqlDir);
      if (!FileUtil.dirExists(_phpClassDir))
        FileUtil.createDir(_phpClassDir);
      if (!FileUtil.dirExists(_phpApiDir))
        FileUtil.createDir(_phpApiDir);
    }
  }

  public void checkPhpCode(String _fileName) throws Exception {
    final Process p = Runtime.getRuntime().exec(K_PHP_SYNTAX_CHECK + _fileName);
    new Thread(new Runnable() {
      public void run() {
        BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line = null;

        try {
          while ((line = input.readLine()) != null)
            System.out.println(line);
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }).start();
    p.waitFor();
  }

  public void checkSqlCode(String _sqlSourceCode) throws Exception {
    CacheOption cacheOption = new CacheOption(128, 1024L);
    SQLParserEngine parserEngine = new SQLParserEngine("MySQL", cacheOption);
    ParseASTNode parseASTNode = parserEngine.parse(_sqlSourceCode, false);
    SQLVisitorEngine sqlVisitorEngine = new SQLVisitorEngine(_sqlSourceCode, "STATEMENT", false, new Properties());
    sqlVisitorEngine.visit(parseASTNode);
    // SQLStatement sqlStatement = sqlVisitorEngine.visit(parseASTNode);
  }

  public void run(final String _configFn) throws Exception {
    System.out.println("File name : " + _configFn);
    try {
      GenSp genSp = new GenSp(_configFn);
      GenPhp genPhp = new GenPhp(_configFn);
      GenPostman genPostman = new GenPostman(_configFn);
      GenHtml genHtml = new GenHtml(_configFn);
      ConfigHandler config = genSp.getConfig();
      String inpFn = config.getProp(GenConstants.K_INPUT_FILE);
      InputStream is = new FileInputStream(new File(inpFn));
      SqlScanner scanner = new SqlScanner(is);
      scanner.setSourceFileName(inpFn);
      SqlParser parser = new SqlParser(scanner, false);
      parser.parse();
      if (parser.getDbBean().getTableList().size() > 0) {
        String rootDir = config.getProp(GenConstants.K_ROOT_DIR);
        String sqlDir = rootDir + File.separator + config.getProp(GenConstants.K_SQL_DIR);
        String phpClassDir = rootDir + File.separator + config.getProp(GenConstants.K_PHP_CLASSES_DIR);
        String phpApiDir = rootDir + File.separator + config.getProp(GenConstants.K_PHP_API_DIR);
        clearDirs(rootDir, sqlDir, phpClassDir, phpApiDir);
        for (TableBean tb : parser.getDbBean().getTableList()) {
          List<ArtifactBean> sqlArtifacts = genSp.run(tb);
          List<ArtifactBean> phpArtifacts = genPhp.run(tb);
          genPostman.run(tb);
          genHtml.run(tb);

          if (sqlArtifacts.size() > 0) {
            for (ArtifactBean elem : sqlArtifacts) {
              FileUtil.writeFile(sqlDir + File.separator + elem.getFileName(), elem.getSourceCode());
              // checkSqlCode(elem.getSourceCode());
            }
          }
          if (phpArtifacts.size() > 0) {
            for (ArtifactBean elem : phpArtifacts) {
              if (elem.getType() == K_ARTIFACT_TYPES.PHP_API) {
                FileUtil.writeFile(phpApiDir + File.separator + elem.getFileName(), elem.getSourceCode());
                checkPhpCode(phpApiDir + File.separator + elem.getFileName());
              } else {
                FileUtil.writeFile(phpClassDir + File.separator + elem.getFileName(), elem.getSourceCode());
                checkPhpCode(phpClassDir + File.separator + elem.getFileName());
              }
            }
          }
        }
        // Copy utility files
        String phpTemplatePath = config.getProp(GenConstants.K_PHP_TEMPLATE_PATH);
        FileUtil.copy(phpTemplatePath + File.separator + GenConstants.K_PHP_REST_BASE,
            phpClassDir + File.separator + GenConstants.K_PHP_REST_BASE);
        FileUtil.copy(phpTemplatePath + File.separator + GenConstants.K_PHP_API_UTIL,
            phpApiDir + File.separator + GenConstants.K_PHP_API_UTIL);
        FileUtil.copy(phpTemplatePath + File.separator + GenConstants.K_DOT_HTACCESS,
            phpApiDir + File.separator + GenConstants.K_DOT_HTACCESS);
      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void main(final String[] _args) throws Exception {
    String configFn = "E:\\KNN\\sql-parser\\config\\gen-properties.properties";
    GenPhpApp ts = new GenPhpApp();
    ts.run(configFn);
    System.out.println("Done");
    System.exit(0);
  }
}
