package Loop;

public class Continue {
    public static void main(String[] args) {
        int[] arr1 = {10,20,30,40,50};
        for (int num:arr1) {
            if (num ==30){
                continue;
            }else {
                System.out.println(num);
            }
        }
    }
}
