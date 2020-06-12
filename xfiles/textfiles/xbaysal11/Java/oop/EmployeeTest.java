package oop;

public class EmployeeTest {
    public static void main(String[] args) {
        Employee empOne = new Employee("Baisalbek");
        Employee empTwo = new Employee("Sezim");

        empOne.empAge(20);
        empOne.empDesignation("qweqwq");
        empOne.empSalary(5000);
        empTwo.empAge(25);
        empTwo.empDesignation("rew");
        empTwo.empSalary(1000);

        empOne.empPrint();
        empTwo.empPrint();

    }
}
