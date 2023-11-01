package util;

public class GenUtil {
  public static String toCamlCase(String _str) {
    String firstChar = "" + _str.charAt(0);
    return firstChar.toLowerCase() + _str.substring(1);
  }

  public static String splitOnUpperCase(String _str) {
    String[] parts = _str.split("(?=[A-Z])");
    String res = parts[0];
    for (int i = 1; i < parts.length; i++) {
      res += " " + parts[i];
    }
    return res;
  }
}
