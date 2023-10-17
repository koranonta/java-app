package util;

import java.io.FileInputStream;
import java.util.Properties;

public class ConfigHandler {
	private Properties m_prop;

	public ConfigHandler(String _configFile) throws Exception {
		loadConfig(_configFile);
	}

	protected void loadConfig(String _configFile) throws Exception {
		m_prop = new Properties();
		FileInputStream fis = new FileInputStream(_configFile);
		m_prop.load(fis);
	}

	public String getProp(String _propName) {
		return m_prop.getProperty(_propName);
	}

	public String getDbConfig() {
		return getProp("db.config.path");
	}

	public String getCaseHeaderTemplate() {
		return getProp("case.header.template");
	}

	public String getInputPath() {
		return getProp("input.path");
	}

	public String getOutputPath() {
		return getProp("output.path");
	}

	public String getInputSheetName() {
		return getProp("inp.sheet.name");
	}
}
