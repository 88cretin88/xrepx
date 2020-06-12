package Loop;

public class Break {
    public static void main(String[] args) {
        int[] arr1 = {10,20,30};
        for (int num:arr1) {
            if (num == 30){
                break;
            }else{
                System.out.println(num);
            }
        }
    }
}
