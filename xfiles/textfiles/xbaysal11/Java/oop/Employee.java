package oop;

public class Employee {
    String name;
    int age;
    String designation;
    double salary;

    public Employee(String name) {
        this.name = name;
    }

    public void empAge(int age){
        this.age = age;
    }

    public void empDesignation(String designation){
        this.designation = designation;
    }

    public void empSalary(double salary){
        this.salary = salary;
    }

    public void empPrint(){
        System.out.println(name);
        System.out.println(age);
        System.out.println(designation);
        System.out.println(salary);
    }
}
