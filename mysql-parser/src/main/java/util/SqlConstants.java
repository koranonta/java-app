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
package util;

public class SqlConstants extends BaseParserConstants {
  protected SqlConstants() {
    super();
  }

  public enum Tokens {
    ACTION1, ADD1, ALTER1, ASC1, AUTO_INCREMENT1, AT1, BACKQUOTE1, BINARY1, BIGINT1, BLOB1, CASCADE1, CHAR1, CHARSET1,
    CHANGE1, CHECK1, CLUSTERED1, COLLATE1, COLUMN1, COMMIT1, COMMA1, COMMENT_WORD1, COMMENT1, CONSTRAINT1, CREATE1,
    CRLF1, CURRENT_TIMESTAMP1, DATABASE1, DATE1, DATETIME1, DECIMAL1, DEFAULT1, DELETE1, DOT1, DOUBLE1, DROP1, ENGINE1,
    ENUM1, EOF1, EQ1, EXISTS1, FLOAT1, FOREIGN1, GE1, GO1, GT1, IF1, INDEX1, INSERT1, IN1, INT1, InnoDB1, INTO1, KEY1,
    latin1, LBRAC1, LE1, LT1, LONGBLOB1, LONGTEXT1, LOCK1, LPAR1, MEDIUMBLOB1, MEDIUMINT1, MEDIUMTEXT1, MINUS1, MODIFY1,
    MONEY1, MyISAM1, NAME1, NO1, NOT1, NOW1, NULL1, NE1, NUMBER1, OFF1, ON1, PLUS1, PRIMARY1, QUESTION_MARK1, RBRAC1,
    REFERENCES1, RPAR1, SEMI1, SET1, SHARP1, SLASH1, SMALLINT1, SPACE1, STAR1, START1, STR_CONSTANT1, TABLE1, TABLES1,
    TEXT1, TIME1, TIMESTAMP1, TINYBLOB1, TINYINT1, TINYTEXT1, TRANSACTION1, UNDEFINED1, UNLOCK1, UNSIGNED1, UPDATE1,
    USE1, UNIQUE1, utf81, utf8_unicode_ci1, VALUES1, VARBINARY1, VARCHAR1, WRITE1, YEAR1, WITH1
  };

  public enum K_KEY_TYPES {
    PRIMARY1, FOREIGN1, INDEX1
  }

  public static char[] K_SPECIAL_CHARACTERS = { '[', ']', '.', '"', '#', '+', ':' };
  // public static char[] K_SPECIAL_CHARACTERS = { '`', '.', '"', '#' };

  public static char[] K_ARITHMETIC_SYMBOLS = { '+', '-', '*', '/', '%' };

}
