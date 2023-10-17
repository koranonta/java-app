package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import parser.SqlParser;
import scanner.SqlScanner;

public class ParseBookDb {
  // public static final String K_PATH = "C:\\KNN\\healinghere\\gravity-mysql\\";
  public static final String K_PATH = "C:\\KNN\\Php\\databases\\";

  public ParseBookDb() {
  }

  public void run(final String _fileName) {
    System.out.println("File name : " + _fileName);
    try {
      InputStream is = new FileInputStream(new File(_fileName));
      SqlScanner scanner = new SqlScanner(is);
      scanner.setSourceFileName(_fileName);
      SqlParser parser = new SqlParser(scanner, false);
      parser.parse();

      System.out.println(parser.getDbBean());

    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void main(final String[] _args) {
    // String filePath = K_PATH + "01_mysql_create.sql";
    // String filePath = K_PATH + "01_mysql_create.sql";
    // String filePath = K_PATH + "pet-store.sql";
    String filePath = K_PATH + "01_mysql_create.sql";
    filePath = K_PATH + "shopping-ddl.sql";

    // filePath = K_PATH + "carrental.sql";
    // filePath = K_PATH + "tms.sql";

    // filePath = K_PATH + "healinghere_tables.sql";

    // filePath = K_PATH + "a-test.sql";

    // filePath = K_PATH + "01-output.sql";

    // filePath = K_PATH + "out-northwind_core.sql";

    // filePath = K_PATH + "out-mysqlsampledatabase.sql";
    // filePath = K_PATH + "posmanagement.sql";

    // filePath = K_PATH + "bbjewels.sql";

    // filePath = K_PATH + "out-book_store.sql";
    // filePath = K_PATH + "book_store.sql";

    // filePath = K_PATH + "erp3.sql";

    ParseBookDb ts = new ParseBookDb();
    // ts.runSetTest(K_PATH, K_CREATE_SCRIPTS);
    ts.run(filePath);
    // ts.runDirectoryTest(dirPath);
    System.exit(0);
  }
}
