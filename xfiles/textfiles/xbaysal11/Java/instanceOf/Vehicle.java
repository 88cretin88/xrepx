package instanceOf;

public class Vehicle {
    public static void main(String[] args) {
        Vehicle vehicle = new Car();
        boolean result = vehicle instanceof Car;
        System.out.println(result);
    }
}

