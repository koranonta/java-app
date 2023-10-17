/*******************************************************************************
 * Nom de la classe.......: $RCSfile:  $
 * Date de modification...: $Date:  $
 * Auteur.................: $Author: $
 * Revision...............: $Revision:  $
 * Version................: $Name:  $
 * Classement.............: $Source:  $
 * -----------------------------------------------------------------------------
 * $Log: $
 *
 *******************************************************************************/

package parser;

import com.satcomgroup.util.basic.StringUtil;

import bean.DatabaseBean;
import bean.FieldBean;
import bean.KeyBean;
import bean.TableBean;
import scanner.SqlScanner;
import util.SqlConfig;
import util.SqlConstants.K_KEY_TYPES;
import util.SqlConstants.Tokens;

/**
 * @author tua
 *
 */
public class SqlParser extends AbstractParser {

  private SqlConfig m_config = SqlConfig.getInstance();

  private DatabaseBean m_dbBean = new DatabaseBean("DEFAULTDB");
  private String m_curTabName;

  public SqlParser(final SqlScanner _scanner) {
    super(_scanner);
  }

  public SqlParser(final SqlScanner _scanner, final boolean _trace) {
    super(_scanner, _trace);
  }

  protected void expect(final Tokens _tok) {
    if (_tok != getToken()) {
      reportError("Invalid token - expecting: " + _tok + "  got: " + getToken());
    } else {
      nextToken();
    }
  }

  @Override
  protected SqlScanner getScanner() {
    return (SqlScanner) super.getScanner();
  }

  protected Tokens getToken() {
    return ((SqlScanner) super.getScanner()).getToken();
  }

  protected String getWord() {
    return ((SqlScanner) super.getScanner()).getWord();
  }

  protected void nextToken() {
    ((SqlScanner) super.getScanner()).nextToken();
  }

  public void parse() {
    getScanner().nextCh();
    nextToken();
    if (isTrace()) {
      // System.out.println(getWord());
    }
    while (Tokens.EOF1 != getToken()) {
      stmt();
    }
  }

  public DatabaseBean getDbBean() {
    return m_dbBean;
  }

  public String getCurTabName() {
    return m_curTabName;
  }

  public void setCurTabName(String _curTabName) {
    m_curTabName = _curTabName;
  }

  public void stmt() {
    // System.out.println(getWord());
    inProc("In stmt");
    switch (getToken()) {
    case USE1:
      nextToken();
      getDbBean().setDbName(getWord());
      expect(Tokens.NAME1);
      if (Tokens.SEMI1 == getToken()) {
        nextToken();
      }
      break;
    case SET1:
      handleSet();
      break;
    case START1:
      expect(Tokens.START1);
      expect(Tokens.TRANSACTION1);
      break;
    case CREATE1:
      createCommand();
      break;
    case ALTER1:
      alterCommand();
      break;
    case DROP1:
      dropCommand();
      break;
    case INSERT1:
      insertCommand();
      break;
    case LOCK1:
    case UNLOCK1:
      handleLockUnlock();
      break;
    case COMMIT1:
    case GO1:
    case SEMI1:
      expect(getToken());
      break;
    default:
      reportError("Unknown command [ " + getWord() + " ]");
    }
    outProc("Out stmt");
  }

  private void handleLockUnlock() {
    nextToken();
    expect(Tokens.TABLES1);
    if (Tokens.NAME1 == getToken()) {
      expect(Tokens.NAME1);
      expect(Tokens.WRITE1);
    }
    expect(Tokens.SEMI1);
  }

  public void handleSet() {
    expect(Tokens.SET1);
    expect(Tokens.NAME1);
    if (Tokens.EQ1 == getToken()) {
      expect(Tokens.EQ1);
      if (Tokens.STR_CONSTANT1 == getToken() || Tokens.NUMBER1 == getToken() || Tokens.NAME1 == getToken()) {
        nextToken();
      }
    } else if (Tokens.ON1 == getToken() || Tokens.OFF1 == getToken()) {
      nextToken();
    } else {
      reportError("Expecting 'ON' or 'OFF' but got : " + getToken());
    }
  }

  public void dropCommand() {
    inProc("In dropCommand");
    expect(Tokens.DROP1);
    if (Tokens.DATABASE1 == getToken() || Tokens.TABLE1 == getToken())
      nextToken();
    if (Tokens.IF1 == getToken()) {
      expect(Tokens.IF1);
      if (Tokens.NOT1 == getToken()) {
        expect(Tokens.NOT1);
      }
      expect(Tokens.EXISTS1);
    }
    // System.out.println("Drop table : " + getWord());
    expect(Tokens.NAME1);
    if (Tokens.SEMI1 == getToken()) {
      expect(Tokens.SEMI1);
    }
    outProc("Out dropCommand");
  }

  public void createCommand() {
    inProc("In createCommand");
    expect(Tokens.CREATE1);
    if (Tokens.DATABASE1 == getToken()) {
      parseDatabase();
    }
    if (Tokens.TABLE1 == getToken()) {
      parseTable();
    }
    outProc("Out createCommand");
  }

  public void alterCommand() {
    inProc("In alterCommand");
    expect(Tokens.ALTER1);
    expect(Tokens.TABLE1);
    // System.out.println("Alter table : " + getWord());
    setCurTabName(getWord());
    expect(Tokens.NAME1);
    while (Tokens.ADD1 == getToken() || Tokens.CHANGE1 == getToken()) {
      nextToken();
      if (Tokens.CONSTRAINT1 == getToken()) {
        addConstraint();
      } else if (Tokens.COLUMN1 == getToken()) {
        expect(Tokens.COLUMN1);
        parseField();
      } else {
        parseKey();
      }

//      } else if (Tokens.PRIMARY1 == getToken() || Tokens.FOREIGN1 == getToken() || Tokens.KEY1 == getToken()
//          || Tokens.UNIQUE1 == getToken()) {
//        parseKey();
//      } else {
//        reportError("Unexpected token : " + getToken());
//      }
    }

    if (Tokens.MODIFY1 == getToken()) {
      expect(Tokens.MODIFY1);
      parseField();
    }
    outProc("Out alterCommand");
  }

  public void addConstraint() {
    inProc("In addConstraint");
    expect(Tokens.CONSTRAINT1);
    // System.out.print(" constraint name : " + getWord());
    expect(Tokens.NAME1);
    if (Tokens.FOREIGN1 == getToken()) {
      nextToken();
      expect(Tokens.KEY1);
      expect(Tokens.LPAR1);
      String refField = getWord();
      // System.out.print(" foreign key name : " + getWord());
      expect(Tokens.NAME1);
      expect(Tokens.RPAR1);

      System.out.println(getCurTabName());
      KeyBean keyBean = null;
      TableBean tabBean = getDbBean().getTable(getCurTabName());
      if (null != tabBean)
        keyBean = tabBean.getKeyBean(refField);
      expect(Tokens.REFERENCES1); // KNN
      if (null != keyBean) {
        keyBean.setRefTable(getWord());
      }
      // System.out.print(" references table : " + getWord());
      expect(Tokens.NAME1);
      expect(Tokens.LPAR1);
      // System.out.print(" field name : " + getWord());
      if (null != keyBean) {
        keyBean.setRefField(getWord());
      }
      expect(Tokens.NAME1);
      expect(Tokens.RPAR1);
      while (Tokens.ON1 == getToken()) {
        expect(Tokens.ON1);
        if (Tokens.DELETE1 == getToken() || Tokens.UPDATE1 == getToken()) {
          nextToken();
        }
        if (Tokens.SET1 == getToken()) {
          expect(Tokens.SET1);
          if (Tokens.NULL1 == getToken() || Tokens.STR_CONSTANT1 == getToken()) {
            nextToken();
          }
        }
        if (Tokens.CASCADE1 == getToken())
          expect(Tokens.CASCADE1);
        if (Tokens.NO1 == getToken()) {
          expect(Tokens.NO1);
          expect(Tokens.ACTION1);
        }
      }
      // System.out.println();
      if (Tokens.COMMA1 == getToken())
        expect(Tokens.COMMA1);
      if (Tokens.SEMI1 == getToken())
        expect(Tokens.SEMI1);

    }
    outProc("Out addConstraint");
  }

  public void parseDatabase() {
    inProc("In parseDatabase");
    expect(Tokens.DATABASE1);
    if (Tokens.IF1 == getToken()) {
      nextToken();
      if (Tokens.NOT1 == getToken()) {
        nextToken();
      }
      expect(Tokens.EXISTS1);
    }
    getDbBean().setDbName(getWord());
    expect(Tokens.NAME1);
    if (Tokens.SEMI1 == getToken()) {
      nextToken();
    }
    outProc("Out addDatabase");

  }

  public void parseTable() {
    inProc("In parseTable");
    expect(Tokens.TABLE1);
    if (Tokens.IF1 == getToken()) {
      nextToken();
      if (Tokens.NOT1 == getToken()) {
        nextToken();
      }
      expect(Tokens.EXISTS1);
    }
    // System.out.println("\r\nCreate table : " + getWord());
    TableBean tabBean = new TableBean(getWord());
    setCurTabName(getWord());
    getDbBean().addTable(tabBean);
    expect(Tokens.NAME1);
    expect(Tokens.LPAR1);
    while (Tokens.NAME1 == getToken()) {
      tabBean.addField(parseField());
    }

    // if (Tokens.CONSTRAINT1 == getToken()) {
    // while (Tokens.CONSTRAINT1 == getToken()) {
    // expect(Tokens.CONSTRAINT1);
    // expect(Tokens.NAME1);
    // parseKey();
    // }
    // }

    // if (Tokens.PRIMARY1 == getToken() || Tokens.FOREIGN1 == getToken() ||
    // Tokens.KEY1 == getToken()
    // || Tokens.CONSTRAINT1 == getToken()) {
    // parseKey();
    // }

    while (Tokens.PRIMARY1 == getToken() || Tokens.FOREIGN1 == getToken() || Tokens.KEY1 == getToken()
        || Tokens.INDEX1 == getToken()) {
      parseKey();
    }

    while (Tokens.CONSTRAINT1 == getToken()) {
      addConstraint();
    }

    expect(Tokens.RPAR1);
    if (Tokens.ENGINE1 == getToken()) {
      handleTableProperties();
    }

    if (Tokens.CHARSET1 == getToken()) {
      expect(Tokens.CHARSET1);
      expect(Tokens.EQ1);
      expect(Tokens.NAME1);
    }

    if (Tokens.DEFAULT1 == getToken()) {
      expect(Tokens.DEFAULT1);
      if (Tokens.CHARSET1 == getToken()) {
        expect(Tokens.CHARSET1);
        expect(Tokens.EQ1);
        if (Tokens.latin1 == getToken() || Tokens.utf81 == getToken()) {
          nextToken();
        }
      }
    }

    if (Tokens.COLLATE1 == getToken()) {
      expect(Tokens.COLLATE1);
      if (Tokens.EQ1 == getToken())
        expect(Tokens.EQ1);
      if (Tokens.utf8_unicode_ci1 == getToken()) {
        expect(Tokens.utf8_unicode_ci1);
      }
      if (Tokens.NOT1 == getToken())
        expect(Tokens.NOT1);
      if (Tokens.NULL1 == getToken())
        expect(Tokens.NULL1);
    }
    if (Tokens.COMMENT_WORD1 == getToken()) {
      expect(Tokens.COMMENT_WORD1);
      if (Tokens.EQ1 == getToken())
        expect(Tokens.EQ1);
      expect(Tokens.STR_CONSTANT1);
    }
    if (Tokens.AUTO_INCREMENT1 == getToken()) {
      expect(Tokens.AUTO_INCREMENT1);
      expect(Tokens.EQ1);
      expect(Tokens.NUMBER1);
    }

    if (Tokens.ON1 == getToken()) {
      expect(Tokens.ON1);
      expect(Tokens.PRIMARY1);

    }
    if (Tokens.SEMI1 == getToken()) {
      expect(Tokens.SEMI1);
    }

    outProc("Out parseTable");
  }

  public void handleTableProperties() {
    expect(Tokens.ENGINE1);
    expect(Tokens.EQ1);
    if (Tokens.MyISAM1 == getToken() || Tokens.InnoDB1 == getToken()) {
      nextToken();
    }

    if (Tokens.AUTO_INCREMENT1 == getToken()) {
      expect(Tokens.AUTO_INCREMENT1);
      if (Tokens.EQ1 == getToken()) {
        expect(Tokens.EQ1);
        expect(Tokens.NUMBER1);
      }
    }
    if (Tokens.DEFAULT1 == getToken()) {
      expect(Tokens.DEFAULT1);
    }
    if (Tokens.CHARSET1 == getToken()) {
      expect(Tokens.CHARSET1);
      expect(Tokens.EQ1);
      if (getWord().startsWith("utf"))
        nextToken();
      else if (Tokens.latin1 == getToken())
        expect(Tokens.latin1);
      else if (Tokens.NAME1 == getToken())
        expect(Tokens.NAME1);
    }
    if (Tokens.COLLATE1 == getToken()) {
      expect(Tokens.COLLATE1);
      expect(Tokens.EQ1);
      if (getWord().startsWith("utf"))
        nextToken();
    }
    /*
     * if (Tokens.AUTO_INCREMENT1 == getToken()) { expect(Tokens.AUTO_INCREMENT1);
     * if (Tokens.EQ1 == getToken()) { expect(Tokens.EQ1); expect(Tokens.NUMBER1); }
     * }
     */
  }

  public void parseKey() {
    inProc("In parseKey");
    if (Tokens.PRIMARY1 == getToken()) {
      // System.out.print("Primary key : ");
      expect(Tokens.PRIMARY1);
      handleKey(K_KEY_TYPES.PRIMARY1);
    }

    if (Tokens.UNIQUE1 == getToken())
      expect(Tokens.UNIQUE1);

    if (Tokens.INDEX1 == getToken()) {
      expect(Tokens.INDEX1);
      if (Tokens.NAME1 == getToken()) {
        expect(Tokens.NAME1);
      }
      expect(Tokens.LPAR1);
      expect(Tokens.NAME1);
      while (Tokens.COMMA1 == getToken()) {
        expect(Tokens.COMMA1);
        expect(Tokens.NAME1);
      }
      expect(Tokens.RPAR1);

      if (Tokens.COMMA1 == getToken())
        expect(Tokens.COMMA1);
    }

    if (Tokens.CONSTRAINT1 == getToken()) {
      expect(Tokens.CONSTRAINT1);
      expect(Tokens.NAME1);
      if (Tokens.PRIMARY1 == getToken()) {
        // System.out.print("Primary key : ");
        expect(Tokens.PRIMARY1);
        handleKey(K_KEY_TYPES.PRIMARY1);
      }
    }

    while (Tokens.FOREIGN1 == getToken()) {
      // System.out.println(getWord());
      expect(Tokens.FOREIGN1);
      KeyBean keyBean = handleKey(K_KEY_TYPES.FOREIGN1);
      if (Tokens.REFERENCES1 == getToken()) {
        expect(Tokens.REFERENCES1);
        // System.out.print("Ref table name : " + getWord());
        if (null != keyBean) {
          keyBean.setRefTable(getWord());
        }
        expect(Tokens.NAME1);
        expect(Tokens.LPAR1);
        // System.out.println(" Ref field name : " + getWord());
        if (null != keyBean) {
          keyBean.setRefField(getWord());
        }
        expect(Tokens.NAME1);
        expect(Tokens.RPAR1);
        if (Tokens.COMMA1 == getToken())
          expect(Tokens.COMMA1);
      }
    }
    while (Tokens.UNIQUE1 == getToken()) {
      expect(Tokens.UNIQUE1);
      handleKey(K_KEY_TYPES.INDEX1);
    }

    while (Tokens.KEY1 == getToken()) {
      handleKey(K_KEY_TYPES.INDEX1);
    }

    if (Tokens.SEMI1 == getToken()) {
      expect(Tokens.SEMI1);
    }
    outProc("Out parseKey");
  }

  public KeyBean handleKey(K_KEY_TYPES _keyType) {
    inProc("In handleKey");
    expect(Tokens.KEY1);
    if (Tokens.CLUSTERED1 == getToken()) {
      expect(Tokens.CLUSTERED1);
    }
    if (Tokens.NAME1 == getToken()) {
      // System.out.print("Key name : " + getWord() + " key list : ");
      expect(Tokens.NAME1);
    }
    expect(Tokens.LPAR1);
    // System.out.print(getWord());
    KeyBean keyBean = null;
    TableBean tabBean = getDbBean().getTable(getCurTabName());
    if (null != tabBean) {
      keyBean = new KeyBean(getWord(), _keyType);
      tabBean.addKey(keyBean);
    }
    expect(Tokens.NAME1);
    if (Tokens.ASC1 == getToken()) {
      expect(Tokens.ASC1);
    }
    if (Tokens.LPAR1 == getToken()) {
      expect(Tokens.LPAR1);
      expect(Tokens.NUMBER1);
      expect(Tokens.RPAR1);
    }

    while (Tokens.COMMA1 == getToken()) {
      expect(Tokens.COMMA1);
      // System.out.print(" " + getWord());
      expect(Tokens.NAME1);
      if (Tokens.ASC1 == getToken()) {
        expect(Tokens.ASC1);
      }
      if (Tokens.LPAR1 == getToken()) {
        expect(Tokens.LPAR1);
        expect(Tokens.NUMBER1);
        expect(Tokens.RPAR1);
      }

    }

    if (Tokens.LPAR1 == getToken()) {
      expect(Tokens.LPAR1);
      if (Tokens.ENUM1 == getToken())
        expect(Tokens.ENUM1);
      if (Tokens.NUMBER1 == getToken())
        expect(Tokens.NUMBER1);
      expect(Tokens.RPAR1);
    }
    expect(Tokens.RPAR1);

    if (Tokens.WITH1 == getToken()) {
      expect(Tokens.WITH1);
      expect(Tokens.LPAR1);
      expect(Tokens.NAME1);
      expect(Tokens.EQ1);
      if (Tokens.ON1 == getToken() || Tokens.OFF1 == getToken()) {
        nextToken();
      }
      while (Tokens.COMMA1 == getToken()) {
        expect(Tokens.COMMA1);
        expect(Tokens.NAME1);
        expect(Tokens.EQ1);
        if (Tokens.ON1 == getToken() || Tokens.OFF1 == getToken()) {
          nextToken();
        }
      }
      expect(Tokens.RPAR1);
      if (Tokens.ON1 == getToken()) {
        expect(Tokens.ON1);
      }

      if (Tokens.PRIMARY1 == getToken()) {
        expect(Tokens.PRIMARY1);
      }
    }

    if (Tokens.COMMA1 == getToken()) {
      expect(Tokens.COMMA1);
    }
    // System.out.println();
    outProc("Out handleKey");
    return keyBean;
  }

  public FieldBean parseField() {
    inProc("In parseField " + getWord());
    FieldBean fieldBean = new FieldBean(getWord());
    // System.out.println("Field : " + getWord());
    expect(Tokens.NAME1);
    String type = getWord();
    fieldBean.setType(type);
    // System.out.println(" Type : " + type);
    type = type.replace("[", "");
    type = type.replace("]", "");
    if (!m_config.getDataTypeMap().containsKey(type.toUpperCase())) {
      reportError("Undefined field type : " + type);
    } else {
      if (Tokens.ENUM1 == getToken()) {
        expect(Tokens.ENUM1);
        expect(Tokens.LPAR1);
        // System.out.print(" values :");
        // System.out.print(" " + getWord());

        if (Tokens.STR_CONSTANT1 == getToken() || Tokens.NUMBER1 == getToken()) {
          nextToken();
        }
        while (Tokens.COMMA1 == getToken()) {
          expect(Tokens.COMMA1);
          if (Tokens.STR_CONSTANT1 == getToken() || Tokens.NUMBER1 == getToken()) {
            // System.out.print(" " + getWord());
            nextToken();
          } else {
            reportError("Expecting string or numeric constant but got : " + getToken());
          }
        }
        expect(Tokens.RPAR1);
      } else {
        nextToken();
        if (Tokens.LPAR1 == getToken()) {
          nextToken();
          // System.out.print(" Length : " + getWord());

          fieldBean.setLength(StringUtil.toInt(getWord()));
          expect(Tokens.NUMBER1);
          if (Tokens.COMMA1 == getToken()) {
            expect(Tokens.COMMA1);
            // System.out.print(" DecLength : " + getWord());
            fieldBean.setDecimal(StringUtil.toInt(getWord()));
            expect(Tokens.NUMBER1);
          }
          expect(Tokens.RPAR1);
        }
      }

      if (Tokens.COLLATE1 == getToken()) {
        nextToken();
        if (getWord().startsWith("utf"))
          nextToken();
      }

      if (Tokens.PRIMARY1 == getToken()) {
        expect(Tokens.PRIMARY1);
        expect(Tokens.KEY1);
      }

      if (Tokens.CHECK1 == getToken()) {
        handleCheck(fieldBean);
      }

      if (Tokens.UNSIGNED1 == getToken()) {
        expect(Tokens.UNSIGNED1);
      }

      if (Tokens.UNIQUE1 == getToken()) {
        expect(Tokens.UNIQUE1);
      }

      if (Tokens.NOT1 == getToken())
        expect(Tokens.NOT1);

      if (Tokens.NULL1 == getToken()) {
        expect(Tokens.NULL1);
      }

      if (Tokens.DEFAULT1 == getToken()) {
        handleDefault(fieldBean);
      }

      if (Tokens.MINUS1 == getToken())
        expect(Tokens.MINUS1);

      if (Tokens.NUMBER1 == getToken()) {
        expect(Tokens.NUMBER1);
      }

      if (Tokens.AUTO_INCREMENT1 == getToken()) {
        fieldBean.setAutoIncrement(true);
        expect(Tokens.AUTO_INCREMENT1);
        if (Tokens.COMMA1 == getToken()) {
          expect(Tokens.COMMA1);
          if (Tokens.AUTO_INCREMENT1 == getToken()) {
            expect(Tokens.AUTO_INCREMENT1);
            expect(Tokens.EQ1);
            expect(Tokens.NUMBER1);
          }
        }
      }

      if (Tokens.NOT1 == getToken())
        expect(Tokens.NOT1);

      if (Tokens.NULL1 == getToken()) {
        expect(Tokens.NULL1);
      }

      // if (Tokens.DEFAULT1 == getToken()) {
      // handleDefault(fieldBean);
      // }

      if (Tokens.ON1 == getToken()) {
        expect(Tokens.ON1);
        if (Tokens.UPDATE1 == getToken()) {
          expect(Tokens.UPDATE1);
          if (Tokens.CURRENT_TIMESTAMP1 == getToken()) {
            handleCurrentTimeStamp();
          }
        }
      }

      if (Tokens.COMMENT_WORD1 == getToken()) {
        expect(Tokens.COMMENT_WORD1);
        if (Tokens.EQ1 == getToken())
          expect(Tokens.EQ1);
        expect(Tokens.STR_CONSTANT1);
      }

      if (Tokens.COMMA1 == getToken()) {
        expect(Tokens.COMMA1);
      }

      if (Tokens.SEMI1 == getToken()) {
        expect(Tokens.SEMI1);
      }
    }

    outProc("Out parseField");
    return fieldBean;
  }

  private void handleDefault(FieldBean _fieldBean) {
    expect(Tokens.DEFAULT1);
    if (Tokens.CURRENT_TIMESTAMP1 == getToken() || Tokens.STR_CONSTANT1 == getToken() || Tokens.NULL1 == getToken()
        || Tokens.NUMBER1 == getToken()) {
      _fieldBean.setDefautValue(getWord());
      if (Tokens.CURRENT_TIMESTAMP1 == getToken()) {
        handleCurrentTimeStamp();
      } else
        nextToken();
    } else if (Tokens.NOW1 == getToken()) {
      expect(Tokens.NOW1);
      expect(Tokens.LPAR1);
      expect(Tokens.RPAR1);
    }
  }

  private void handleCheck(FieldBean _fieldBean) {
    String checkStr = getWord();
    expect(Tokens.CHECK1);
    checkStr += " ( ";
    expect(Tokens.LPAR1);
    checkStr += getWord();
    expect(Tokens.NAME1);
    checkStr += " IN ";
    expect(Tokens.IN1);
    expect(Tokens.LPAR1);
    checkStr += " ( " + getWord();

    expect(Tokens.STR_CONSTANT1);
    while (Tokens.COMMA1 == getToken()) {
      checkStr += ", ";
      expect(Tokens.COMMA1);
      checkStr += getWord();
      expect(Tokens.STR_CONSTANT1);
    }
    checkStr += "))";
    _fieldBean.setCheckValue(checkStr);
    expect(Tokens.RPAR1);
    expect(Tokens.RPAR1);
  }

  public void handleCurrentTimeStamp() {
    expect(Tokens.CURRENT_TIMESTAMP1);
    if (Tokens.LPAR1 == getToken()) {
      expect(Tokens.LPAR1);
      expect(Tokens.RPAR1);
    }
  }

  public void insertCommand() {
    expect(Tokens.INSERT1);
    expect(Tokens.INTO1);
    expect(Tokens.NAME1);
    if (Tokens.LPAR1 == getToken()) {
      expect(Tokens.LPAR1);
      expect(Tokens.NAME1);
      while (Tokens.COMMA1 == getToken()) {
        expect(Tokens.COMMA1);
        expect(Tokens.NAME1);
      }
      expect(Tokens.RPAR1);
    }
    expect(Tokens.VALUES1);

    insertValue();
    while (Tokens.COMMA1 == getToken()) {
      expect(Tokens.COMMA1);
      if (Tokens.LPAR1 == getToken())
        insertValue();
    }
  }

  public void insertValue() {
    expect(Tokens.LPAR1);
    if (Tokens.NUMBER1 == getToken() || Tokens.STR_CONSTANT1 == getToken() || Tokens.NULL1 == getToken()) {
      nextToken();
      while (Tokens.COMMA1 == getToken()) {
        expect(Tokens.COMMA1);
        if (Tokens.NUMBER1 == getToken() || Tokens.STR_CONSTANT1 == getToken() || Tokens.NULL1 == getToken()) {
          nextToken();
        }
      }
    }
    expect(Tokens.RPAR1);
  }

}
