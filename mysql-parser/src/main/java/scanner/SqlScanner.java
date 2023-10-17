/*******************************************************************************
 * Class name.......: $RCSfile:  $
 * Change date...: $Date:  $
 * Author.................: $Author:  $
 * Revision...............: $Revision:  $
 * Version................: $Name:  $
 * Source path.............: $Source:  $
 * -----------------------------------------------------------------------------
 * $Log: $
 *
 *******************************************************************************/
package scanner;

import java.io.InputStream;

import com.satcomgroup.util.basic.StringUtil;

import util.BaseParserConstants;
import util.SqlConfig;
import util.SqlConstants;
import util.SqlConstants.Tokens;

public class SqlScanner extends AbstractScanner {
  /** The token attribute. */
  private Tokens m_tok;

  /** The token string. */
  private String m_word;

  /** The token string. */
  private String m_comment;

  /** The parser configuration. */
  private SqlConfig m_config = SqlConfig.getInstance();

  /**
   * Constructor
   * 
   * @param _is : InputStream - the input stream.
   */
  public SqlScanner(final InputStream _is) {
    super(_is);
  }

  /**
   * Get the next token and skip the comments.
   */
  @Override
  public void nextToken() {
    getNextToken();
    while (Tokens.COMMENT1 == getToken()) {
      getNextToken();
    }
  }

  /**
   * @param _word
   * @return
   */
  private String removeBrackets(String _word) {
    String temp = _word.replace("[", "");
    temp = temp.replace("]", "");
    return temp;
  }

  /**
   * Advance to the next token. Must implement nextToken(), getToken()
   * getTokenStr().
   */
  public String getComment() {
    return m_comment;
  }

  /**
   * Advance to the next token. Must implement nextToken(), getToken()
   * getTokenStr().
   */
  public void getNextToken() {
    m_tok = Tokens.UNDEFINED1;
    while (getCh() <= BaseParserConstants.K_SPACE) {
      nextCh();
    }
    if (StringUtil.isAlpha(getCh()) || StringUtil.isIn(getCh(), SqlConstants.K_SPECIAL_CHARACTERS)) {
      m_word = "";
      if (getCh() != '"' /* && getCh() != '`' && getCh() != '[' */) {
        m_word += getCh();
      }
      nextCh();
      while (StringUtil.isAlphaNum(getCh()) || StringUtil.isIn(getCh(), SqlConstants.K_SPECIAL_CHARACTERS)
          || getCh() == '-') {
        if (getCh() != '"' /* && getCh() != '`' && getCh() != ']' */) {
          m_word += getCh();
        }
        nextCh();
      }
      if (m_config.getDataTypeMap().containsKey(removeBrackets(m_word.toUpperCase()))) {
        m_tok = m_config.getDataTypeMap().get(removeBrackets(m_word.toUpperCase()));
      } else {
        m_tok = m_config.getTokenMap().get(removeBrackets(m_word.toUpperCase()));
        if (null == m_tok) {
          m_tok = Tokens.NAME1;
        }
      }
    } else if (StringUtil.isNumeric(getCh())) {
      m_word = "";
      m_word += getCh();
      nextCh();
      while (StringUtil.isNumeric(getCh())) {
        m_word += getCh();
        nextCh();
      }
      m_tok = Tokens.NUMBER1;
      if ('.' == getCh()) {
        m_word += getCh();
        nextCh();
        while (StringUtil.isNumeric(getCh())) {
          m_word += getCh();
          nextCh();
        }
      }
    } else {
      switch (getCh()) {
      case '-':
        m_tok = Tokens.MINUS1;
        nextCh();
        if ('-' == getCh()) {
          nextCh();
          while ('\n' != getCh()) {
            nextCh();
          }
          nextCh();
          m_tok = Tokens.COMMENT1;
        }
        break;
      case '/':
        nextCh();
        if ('*' == getCh()) {
          m_comment = "";
          nextCh();
          boolean endComment = false;
          while (!endComment) {
            if ('*' == getCh()) {
              nextCh();
              if ('/' == getCh()) {
                endComment = true;
              } else {
                m_comment += getCh();
                nextCh();
                if ('/' == getCh()) {
                  endComment = true;
                }
              }
            } else {
              m_comment += getCh();
              nextCh();
            }
          }
          nextCh();
          m_tok = Tokens.COMMENT1;
        } else {
          m_tok = Tokens.SLASH1;
        }
        break;
      case '=':
        m_tok = Tokens.EQ1;
        nextCh();
        break;
      case '?':
        m_tok = Tokens.QUESTION_MARK1;
        nextCh();
        break;
      case '+':
        m_tok = Tokens.PLUS1;
        nextCh();
        break;

      case '>':
        m_tok = Tokens.GT1;
        nextCh();
        if ('=' == getCh()) {
          nextCh();
          m_tok = Tokens.GE1;
        }
        break;
      case '<':
        m_tok = Tokens.LT1;
        nextCh();
        if ('=' == getCh()) {
          nextCh();
          m_tok = Tokens.LE1;
        } else if ('>' == getCh()) {
          nextCh();
          m_tok = Tokens.NE1;
        }
        break;
      case '(':
        m_tok = Tokens.LPAR1;
        nextCh();
        break;
      case ')':
        m_tok = Tokens.RPAR1;
        nextCh();
        break;
      case ',':
        m_tok = Tokens.COMMA1;
        nextCh();
        break;
      case ';':
        m_tok = Tokens.SEMI1;
        nextCh();
        break;
      case ' ':
        m_tok = Tokens.SPACE1;
        nextCh();
        break;

      case '\r':
      case '\n':
        m_tok = Tokens.CRLF1;
        nextCh();
        break;

      case '\'':
        m_tok = Tokens.STR_CONSTANT1;
        m_word = "" + getCh();
        nextCh();
        while ('\'' != getCh()) {
          m_word += getCh();
          nextCh();
          if (getCh() == '\\') {
            m_word += getCh();
            nextCh();
            if (getCh() == '\'') {
              m_word += getCh();
              nextCh();
            }
          }
        }
        // Get the last '.
        m_word += getCh();
        nextCh();
        break;

      case '`':
        m_tok = Tokens.NAME1;
        m_word = "";
        nextCh();
        while ('`' != getCh()) {
          m_word += getCh();
          nextCh();
        }
        nextCh();
        break;

      case '*':
        m_tok = Tokens.STAR1;
        nextCh();
        break;
      case '#':
        m_tok = Tokens.SHARP1;
        nextCh();
        break;
      case '@':
        m_tok = Tokens.AT1;
        nextCh();
        break;
      case '.':
        m_tok = Tokens.DOT1;
        nextCh();
        break;

      // case '[':
      // m_word = "";
      // nextCh();
      // while (']' != getCh()) {
      // m_word += getCh();
      // nextCh();
      // }
      // // Get the last '.
      // nextCh();
      // if (m_config.getDataTypeMap().containsKey(m_word.toUpperCase())) {
      // m_tok = m_config.getDataTypeMap().get(m_word.toUpperCase());
      // } else {
      // m_tok = m_config.getTokenMap().get(m_word.toUpperCase());
      // if (null == m_tok) {
      // m_tok = Tokens.NAME1;
      // }
      // }
      //
      // break;
      // case ']':
      // m_tok = Tokens.RBRAC1;
      // nextCh();
      // break;

      case BaseParserConstants.K_EOF:
        m_tok = Tokens.EOF1;
        break;
      }
    }
  }

  /**
   * Get the next token.
   * 
   * @return Token.
   */
  public Tokens getToken() {
    return m_tok;
  }

  /**
   * Get the token in String format.
   * 
   * @return String.
   */
  @Override
  public String getWord() {
    return m_word;
  }
}
