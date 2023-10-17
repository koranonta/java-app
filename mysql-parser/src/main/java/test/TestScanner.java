package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import io.FileUtil;
import scanner.SqlScanner;
import util.SqlConstants.Tokens;

public class TestScanner {

  public static final String K_PATH = "D:/workspace/GlobalNet/src/com/satcomgroup/globalnet/db/mssql/";

  public static final String[] K_CREATE_SCRIPTS = { "create_base_records.sql", "create_documents_procedure.sql",
      "create_encryption.sql", "create_keys_procedure.sql", "create_login_views.sql", "create_news_procedure.sql",
      "create_product_group_procedure.sql", "create_product_option_procedure.sql", "create_product_procedure.sql",
      "create_purchase_procedure.sql", "create_service_procedure.sql", "create_supplier_procedure.sql",
      "drop_database.sql", "new_service.sql" };

  public TestScanner() {

  }

  public List<String> getAllFilesInDir(String _dirName) {
    List<String> result = new ArrayList<String>();
    if (FileUtil.dirExists(_dirName)) {
      List<File> fileList = new ArrayList<File>();
      File dir = new File(_dirName);
      FileUtil.visitAllFiles(dir, fileList);
      for (File fp : fileList) {
        if (fp.getName().toLowerCase().endsWith(".sql")) {
          result.add(fp.getAbsolutePath());
        }
      }
    }
    return result;
  }

  public void runDirectoryTest(String _dirName) {
    for (String fileName : getAllFilesInDir(_dirName)) {
      System.out.println(fileName);
      runUnitTest(fileName);
    }

  }

  public void runSetTest(String _path, String[] _sets) {
    for (String fileName : _sets) {
      System.out.println(fileName);
      runUnitTest(_path + fileName);
    }
  }

  public void runUnitTest(String _fileName) {
    System.out.println("File name : " + _fileName);
    try {
      InputStream is = new FileInputStream(new File(_fileName));
      SqlScanner scanner = new SqlScanner(is);
      scanner.nextCh();
      scanner.nextToken();
      int undefinedCnt = 0;
      while (Tokens.EOF1 != scanner.getToken()) {
        if (Tokens.NAME1 == scanner.getToken() || Tokens.STR_CONSTANT1 == scanner.getToken()) {
          System.out.println(scanner.getToken() + " " + scanner.getWord());
        } else if (Tokens.UNDEFINED1 == scanner.getToken()) {
          undefinedCnt++;
          if (undefinedCnt > 3) {
            System.out.println("Too many undefined.\n");
            System.out.println("Line : " + scanner.getLine() + "  col : " + scanner.getCol() + "\n");
            System.out.println("Line content : " + scanner.getCurrentLine());
            break;
          }
        } else {
          System.out.println(scanner.getToken());
        }
        scanner.nextToken();
      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void main(String[] _args) {
    // String dirPath =
    // "D:/workspace/GlobalNet/src/com/satcomgroup/globalnet/db/mssql/supplier";

    Path currentRelativePath = Paths.get("");
    String filePath = currentRelativePath.toAbsolutePath().toString() + "/TestTable01.sql";
    TestScanner ts = new TestScanner();
    ts.runUnitTest(filePath);
    // ts.runSetTest(K_PATH, K_CREATE_SCRIPTS);
    // ts.runDirectoryTest(dirPath);
    System.exit(0);
  }
}
