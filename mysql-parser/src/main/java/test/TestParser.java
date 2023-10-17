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
import parser.SqlParser;
import scanner.SqlScanner;

public class TestParser {

	public static final String K_PATH = "D:/workspace/GlobalNet/src/com/satcomgroup/globalnet/db/mssql/";

	public static final String[] K_CREATE_SCRIPTS = { "create_base_records.sql", "create_documents_procedure.sql",
			"create_encryption.sql", "create_keys_procedure.sql", "create_login_views.sql", "create_news_procedure.sql",
			"create_product_group_procedure.sql", "create_product_option_procedure.sql", "create_product_procedure.sql",
			"create_purchase_procedure.sql", "create_service_procedure.sql", "create_supplier_procedure.sql",
			"drop_database.sql", "new_service.sql" };

	public TestParser() {

	}

	public List<String> getAllFilesInDir(final String _dirName) {
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

	public void runDirectoryTest(final String _dirName) {
		for (String fileName : getAllFilesInDir(_dirName)) {
			System.out.println(fileName);
			runUnitTest(fileName);
		}
	}

	public void runSetTest(final String _path, final String[] _sets) {
		for (String fileName : _sets) {
			System.out.println(fileName);
			runUnitTest(_path + fileName);
		}
	}

	public void runUnitTest(final String _fileName) {
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
		Path currentRelativePath = Paths.get("");
		// String filePath = currentRelativePath.toAbsolutePath().toString() +
		// "/TestTable02.sql";

		String filePath = "E:/KNN/sql-parser/lapassion-app.sql";
		TestParser ts = new TestParser();
		// ts.runSetTest(K_PATH, K_CREATE_SCRIPTS);
		ts.runUnitTest(filePath);
		// ts.runDirectoryTest(dirPath);
		System.exit(0);
	}
}
