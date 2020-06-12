package oop;

public class Puppy2 {
    int puppyAge;
    public Puppy2(String name){
        System.out.println(name);
    }

    public int getPuppyAge() {
        System.out.println(puppyAge);
        return puppyAge;
    }

    public void setPuppyAge(int puppyAge) {
        this.puppyAge = puppyAge;
    }

    public static void main(String[] args) {
        Puppy2 puppy2 = new Puppy2("Hanna");
        puppy2.setPuppyAge(10);
        puppy2.getPuppyAge();
    }
}
