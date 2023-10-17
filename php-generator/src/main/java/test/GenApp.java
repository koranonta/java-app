package test;

public class GenApp {
  private String m_configFn;

  public GenApp(String _configFn) throws Exception {
    m_configFn = _configFn;
  }

  public void run() throws Exception {
    GenPhpApp ts = new GenPhpApp();
    ts.run(m_configFn);
    MergeScripts merge = new MergeScripts(m_configFn);
    merge.run();
    System.out.println("Done");
  }

  public static void main(String[] _args) throws Exception {
    String configFn = "C:/KNN/app-projects/stock-management/sql/code-generation.properties";
    GenApp genApp = new GenApp(configFn);
    genApp.run();
    System.exit(0);
  }
}
