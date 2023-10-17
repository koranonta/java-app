package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import bean.DatabaseBean;
import parser.SqlParser;
import scanner.SqlScanner;

public class UnitTest {

	public UnitTest() {

	}

	public void runUnitTest(final String _fileName) {
		System.out.println("File name : " + _fileName);
		try {
			InputStream is = new FileInputStream(new File(_fileName));
			SqlScanner scanner = new SqlScanner(is);
			scanner.setSourceFileName(_fileName);
			SqlParser parser = new SqlParser(scanner, false);
			parser.parse();
			DatabaseBean dbBean = parser.getDbBean();

			System.out.println(dbBean.toString());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static void main(final String[] _args) {
		UnitTest ts = new UnitTest();
		// "D:/tmp/TestTable06.sql"
		String fn = "D:/workspaceJSF/mysql-parser/src/main/resources/DriveMeTables.sql";
		// fn = "D:/tmp/TestTable01.sql";
		ts.runUnitTest(fn);
		// ts.runUnitTest("D:/workspacePHP/thairoyal/resources/SabaTables.sql");
		System.exit(0);
	}
}
