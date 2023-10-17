package test;

import java.io.File;
import java.util.List;

import com.satcomgroup.framework.util.FileUtil;

public class MergeScript {

  public static final String K_PATH = "E:\\KNN\\la-passion-app\\01-app-back-end\\merge-script";
  public static final String K_CRLF = "\r\n";

  public MergeScript() {
  }

  public void run(String _path) {
    File dir = new File(_path);

    String outFp = _path + "/toDeploy.sql";
    if (FileUtil.fileExists(outFp)) {
      FileUtil.deleteFile(outFp);
    }
    for (File fp : dir.listFiles()) {
      if (fp.isFile()) {
        FileUtil.appendFile(outFp, "/*  " + fp.getName() + "  */" + K_CRLF);
        List<String> lines = FileUtil.readFile(fp.getAbsolutePath());
        for (String line : lines)
          FileUtil.appendFile(outFp, line);
      }
    }
  }

  public static void main(final String[] _args) {
    MergeScript o = new MergeScript();
    o.run(K_PATH);
    System.exit(0);
  }
}
