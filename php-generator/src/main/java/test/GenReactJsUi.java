package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

import com.satcomgroup.framework.util.FileUtil;
import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.TableBean;
import generator.GenReactInputScreen;
import parser.SqlParser;
import scanner.SqlScanner;
import util.ConfigHandler;
import util.GenConstants;

public class GenReactJsUi {

  public GenReactJsUi() throws Exception {
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

  public void run(final String _configFn) {
    System.out.println("File name : " + _configFn);
    try {
      GenReactInputScreen genReact = new GenReactInputScreen(_configFn);
      ConfigHandler config = genReact.getConfig();
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
        List<ArtifactBean> reactArtifacts = null;
        for (TableBean tb : parser.getDbBean().getTableList()) {
          reactArtifacts = genReact.run(tb);
        }

        if (reactArtifacts.size() > 0) {
          for (ArtifactBean elem : reactArtifacts) {
            System.out.println(elem.getFileName());
            System.out.println(elem.getSourceCode());
            // FileUtil.writeFile(sqlDir + File.separator + elem.getFileName(),
            // elem.getSourceCode());
          }
        }

      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void main(final String[] _args) throws Exception {
    String configFn = "E:\\KNN\\sql-parser\\config\\gen.properties";
    GenReactJsUi ts = new GenReactJsUi();
    ts.run(configFn);
    System.out.println("Done");
    System.exit(0);
  }
}
