package Loop;

public class EnhancedFor {
    public static void main(String[] args) {
        int[] Arr1 = {10, 20, 30, 40, 50};
        String[] Arr2 = {"a", "b", "c"};
        
        for (int num : Arr1) {
            System.out.print(num + ",");
        }
        System.out.println("\b");
        for (String str : Arr2) {
            System.out.print(str + ",");
        }
        System.out.println("\b");
    }
}
