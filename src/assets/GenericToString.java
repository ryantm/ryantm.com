import java.lang.reflect.Field;
import java.lang.reflect.Method;

class GenericToString {
    private static boolean definesToString(Class c) {
	try {
	    if (c == Class.forName("java.lang.Object"))
		return false;
	    try {
		Method m = c.getDeclaredMethod("toString");
		return true;
	    } catch (NoSuchMethodException e) {
		return definesToString(c.getSuperclass());
	    }
	} catch (ClassNotFoundException e) {
	    return false; //Should never be reached.
	}
    }

    public static String genericToString(Object o) {
	return genericToString(o, 2);
    }

    public static String genericToString(Object o, int depth) {
	if (depth < 0)
	    return "..";
	if (o == null)
	    return "NULL";
	Class c = o.getClass();
	if (definesToString(c)) {
	    return "<" + o.toString() + ">";
	} else {
	    Field fields[] = c.getFields();
	    StringBuffer buffer = new StringBuffer(5000);
	    buffer.append("<" + c.getName() + ":");
	    for (Field f:fields)
		try {
		    buffer.append(" " + f.getName() + "= " + genericToString(f.get(o), depth - 1));
		} catch (IllegalAccessException e) {
		}
	    buffer.append(">");
	    return buffer.toString();
	}
    }
}
