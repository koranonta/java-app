package generator;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.satcomgroup.util.basic.StringUtil;

import bean.ArtifactBean;
import bean.FieldBean;
import bean.TableBean;
import util.GenConstants.K_ARTIFACT_TYPES;
import util.Util;

public class GenReactInputScreen extends GenBase {

  private Map<String, String> m_map = new LinkedHashMap<String, String>();
  private static final int K_MAX_FIELD_TYPE_LENGTH = 10;

  public GenReactInputScreen(String _configFn) throws Exception {
    super(_configFn);
    m_map.put("varchar", "text");
    m_map.put("int", "number");
    m_map.put("float", "number");
    m_map.put("datetime", "date");
    m_map.put("date", "date");
  }

  private String getFieldType(FieldBean _fb) {
    String fieldType = _fb.getType().toLowerCase();
    if (m_map.containsKey(fieldType))
      return m_map.get(fieldType);
    return "text";
  }

  private void genField(FieldBean _fb, int _maxFieldLength) {
    String[] list = _fb.getName().split("(?=\\p{Upper})");
    String labelName = list[0];
    if (list.length > 1) {
      for (int index = 1; index < list.length; index++) {
        labelName += " " + list[index];
      }
    }

    append("label: " + StringUtil.filler(dbQuote(labelName), _maxFieldLength));
    append(", name: " + StringUtil.filler(dbQuote(_fb.getName().toLowerCase()), _maxFieldLength));
    append(", type: " + StringUtil.filler(dbQuote(getFieldType(_fb)), K_MAX_FIELD_TYPE_LENGTH));
    appendLn(" }");
  }

  private String genScreenDef(TableBean _table) {
    clearBuffer();
    int maxFieldLength = getMaxFieldsLength(_table.getFields());
    appendLn("const " + Util.getSingleName(_table.getName()) + "Fields = [");
    boolean first = true;
    for (FieldBean fb : _table.getFields()) {
      if (!fb.isPrimaryKey() && !isSpecialField(fb.getName())) {
        if (first) {
          first = false;
          append("  { ");
          genField(fb, maxFieldLength);
        } else {
          append(" ,{ ");
          genField(fb, maxFieldLength);
        }
      }
    }
    appendLn("]");
    return Util.getSingleName(_table.getName()) + "Screen.js";
  }

  public List<ArtifactBean> run(TableBean _table) {
    String fn = genScreenDef(_table);
    addArtifact(K_ARTIFACT_TYPES.REACT_UI, fn, m_buf.toString());
    // System.out.println(m_buf.toString());
    return getArtifacts();
  }
}
