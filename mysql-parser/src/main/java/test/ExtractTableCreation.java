package test;

import java.io.File;
import java.util.List;

import com.satcomgroup.framework.util.FileUtil;

public class ExtractTableCreation {
  // public static final String K_PATH = "C:\\KNN\\healinghere\\gravity-mysql\\";
  public static final String K_PATH = "C:\\KNN\\Php\\databases\\";

  public ExtractTableCreation() {
  }

  public void extract(String _fileName) {
    File fp = new File(_fileName);
    String outFp = K_PATH + "out-" + fp.getName();
    if (FileUtil.fileExists(outFp)) {
      FileUtil.deleteFile(outFp);
    }
    List<String> lines = FileUtil.readFile(_fileName);
    boolean startCopy = false;
    for (String line : lines) {
      if (line.startsWith("CREATE TABLE") || line.startsWith("ALTER TABLE")) {
        System.out.println(line);
        startCopy = true;
      } else if (line.startsWith(") ENGINE")) {
        FileUtil.appendFile(outFp, line);
        FileUtil.appendFile(outFp, "\r\n");
        // System.out.println(line);
        startCopy = false;
      }
      if (startCopy) {
        FileUtil.appendFile(outFp, line);
        // System.out.println(line);
      }
    }
  }

  public static void main(final String[] _args) {
    // String filePath = K_PATH + "01_mysql_create.sql";
    // String filePath = K_PATH + "01_mysql_create.sql";
    // String filePath = K_PATH + "pet-store.sql";
    String filePath = K_PATH + "01_mysql_create.sql";
    // filePath = K_PATH + "shopping-ddl.sql";

    // filePath = K_PATH + "carrental.sql";
    // filePath = K_PATH + "tms.sql";

    filePath = K_PATH + "healinghere_tables.sql";
    filePath = K_PATH + "mysqlsampledatabase.sql";
    filePath = K_PATH + "book_store.sql";

    // filePath = K_PATH + "a-test.sql";

    ExtractTableCreation ts = new ExtractTableCreation();
    // ts.runSetTest(K_PATH, K_CREATE_SCRIPTS);
    // ts.run(filePath);
    ts.extract(filePath);
    // ts.runDirectoryTest(dirPath);
    System.exit(0);
  }
}
