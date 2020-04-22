package string;

public class StringBuff {
    public static void main(String[] args) {
        StringBuffer buffer = new StringBuffer("Hello");
        System.out.println(buffer.delete(3,4));
        System.out.println(buffer.replace(3,4,"5"));
        System.out.println(buffer.substring(2));
        System.out.println(buffer.reverse());
        System.out.println(buffer.length());
        System.out.println(buffer.capacity());
        System.out.println(buffer.charAt(1));
        System.out.println(buffer);
    }
}
