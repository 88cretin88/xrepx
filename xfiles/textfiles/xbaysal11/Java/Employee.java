import java.io.*;

public class Employee {
    public String name;
    private double salary;

    public Employee(String empName) {
        name = empName;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public void printEmp() {
        System.out.println("name: " + name);
        System.out.println("salary: " + salary);
    }

    public static void main(String args[]) {
        Employee employee = new Employee("Baisalbek");
        employee.setSalary(1000);
        employee.printEmp();
    }
}
