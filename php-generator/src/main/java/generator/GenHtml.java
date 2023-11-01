package generator;

import java.io.File;
import java.util.List;

import com.satcomgroup.framework.util.FileUtil;
import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.FieldBean;
import bean.TableBean;
import util.GenConstants;
import util.GenUtil;

public class GenHtml extends GenBase {
  private String m_template;
  private static final String K_LABEL = "<label for=\"@@NAME@@\" class=\"form-label\">@@LABEL@@</label>";
  private static final String K_INPUT = "<input type=\"text\" class=\"form-control\" id=\"@@NAME@@\" name=\"@@NAME@@\" placeholder=\"\" value=\"\">";

  public GenHtml(String _configFn) throws Exception {
    super(_configFn);
    m_template = getConfig().getProp("html.template.path");
  }

  private void genField(String _fieldName) {
    appendLn(StringUtil.SP(12) + "<div class=\"col-sm-12\">");
    appendLn(StringUtil.SP(14) + K_LABEL.replace(GenConstants.K_NAME, GenUtil.toCamlCase(_fieldName))
        .replace(GenConstants.K_LABEL, GenUtil.splitOnUpperCase(_fieldName)));
    appendLn(StringUtil.SP(14) + K_INPUT.replace(GenConstants.K_NAME, GenUtil.toCamlCase(_fieldName)));
    appendLn(StringUtil.SP(12) + "</div>");

  }

  private void genScript(TableBean _table) throws Exception {
    clearBuffer();
    String html = loadFile(m_template + GenConstants.K_HTML_TEMPLATE);
    for (FieldBean fb : _table.getFields()) {
      if (!isSpecialField(fb.getName())) {
        if (!fb.isPrimaryKey()) {
          genField(fb.getName());
        }
      }
    }
    html = html.replace(GenConstants.K_HTML_FIELDS, m_buf.toString()).replace(GenConstants.K_TITLE, _table.getName());
    String path = getConfig().getProp(GenConstants.K_ROOT_DIR) + File.separator
        + getConfig().getProp(GenConstants.K_HTML_DIR);
    if (!FileUtil.dirExists(path))
      FileUtil.createDir(path);
    String outFn = path + File.separator + _table.getName() + GenConstants.K_DOT_HTML;
    FileUtil.appendFile(outFn, html);
  }

  public List<ArtifactBean> run(TableBean _table) throws Exception {
    genScript(_table);

    return getArtifacts();
  }
}
