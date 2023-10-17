package util;

public class Util {
  public static String getSingleName(String _name) {
    String name = _name;
    if (name.toLowerCase().endsWith("types")) {
      name = name.substring(0, name.length() - 1);
    } else if (name.toLowerCase().endsWith("ies")) {
      name = name.substring(0, name.length() - 3) + "y";
    } else if (name.toLowerCase().endsWith("ees")) {
      name = name.substring(0, name.length() - 1);
    } else if (name.toLowerCase().endsWith("es")) {
      name = name.substring(0, name.length() - 2);
    } else if (name.toLowerCase().endsWith("ees")) {
      name = name.substring(0, name.length() - 1);
    } else if (name.toLowerCase().endsWith("s")) {
      name = name.substring(0, name.length() - 1);
    }
    return name;
  }
}
