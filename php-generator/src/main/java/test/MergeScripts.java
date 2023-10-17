package test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.satcomgroup.framework.util.FileUtil;

import generator.GenBase;
import util.GenConstants;

public class MergeScripts extends GenBase {

  public MergeScripts(String _configFn) throws Exception {
    super(_configFn);
  }

  private void clearDirs(String _mergeDir) throws Exception {
    if (FileUtil.dirExists(_mergeDir)) {
      FileUtil.deleteDir(_mergeDir);
    }
    FileUtil.createDir(_mergeDir);
  }

  protected void appendFile(String _fileName, String _content) {
    try {
      PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(_fileName, true)));
      out.println(_content);
      out.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public void run() throws Exception {
    String rootDir = getConfig().getProp(GenConstants.K_ROOT_DIR);
    String sqlDir = rootDir + File.separator + getConfig().getProp(GenConstants.K_SQL_DIR);
    String mergeDir = rootDir + File.separator + getConfig().getProp(GenConstants.K_MERGE_DIR);
    String databaseName = getConfig().getProp(GenConstants.K_DATABASE_NAME);
    String outFn = mergeDir + File.separator + getConfig().getProp(GenConstants.K_DEPLOY_FILE_NAME);
    clearDirs(mergeDir);
    appendFile(outFn, GenConstants.K_USE + " " + databaseName + ";");
    appendFile(outFn, GenConstants.K_DELIMITER + " $$");

    File dir = new File(sqlDir);
    for (File fp : dir.listFiles()) {
      if (fp.isFile()) {
        List<String> lines = FileUtil.readFile(fp.getAbsolutePath());
        if (lines.size() > 0) {
          appendFile(outFn, "-- " + fp.getName());
          for (String line : lines) {
            if (!line.startsWith(GenConstants.K_DELIMITER))
              appendFile(outFn, line);
          }
        }
      }
    }

    appendFile(outFn, GenConstants.K_DELIMITER + " ;");
  }

  public static void main(String[] _args) throws Exception {
    String configFn = "E:\\KNN\\sql-parser\\config\\gen-properties.properties";
    MergeScripts o = new MergeScripts(configFn);
    o.run();
    System.out.println("Done.");
    System.exit(0);
  }

}
