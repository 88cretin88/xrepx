package string;

public class StringEx {
    public static void main(String[] args) {
        String str = "Hello";
        System.out.println(str.length());//длинна
        System.out.println(str.charAt(0));// буква на индексе
        System.out.println(str.equals("Hello"));//равен
        System.out.println(str.equalsIgnoreCase("Hell"));
        System.out.println(str.startsWith("Hel"));
        System.out.println(str.endsWith("lo"));
        System.out.println(str.isEmpty());
        System.out.println(str.compareTo("hi"));
        System.out.println(str.indexOf("o"));
        System.out.println(str.lastIndexOf("Hello"));
        System.out.println(str.substring(2));
        System.out.println(str.concat("world"));
        System.out.println(str.replace("l","x"));
        System.out.println(str.trim());//without whitespace
        System.out.println(str.toLowerCase());
        System.out.println(str.toUpperCase());
        System.out.println(str);
    }
}
