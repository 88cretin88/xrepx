
<p align="center">
    <img src="http://universidadedegestao.com.br/wp-content/uploads/lock-open-blue.png" alt="logo" width="72" height="72">
</p>

<h3 align="center">PSWDS</h3>

<p align="center">
     Keep your passwords in safe!
</p>

![logo](https://i.postimg.cc/PqfrX2wR/PSWDS.png)

INTRODUCTION
------------

This project demonstrate spring boot application with Thymeleaf

REQUIREMENTS
------------
JDK 1.8+, <br/>
Gradle 5.2+,<br/>
Mysql 5.7+,<br/>
if you use JDK8 this dependency required

INSTALLATION
------------
 1. Clone project and import as gradle project.
 2. Update MYSQL usernane and password under the <strong>application.properties</strong> 
    1. `spring.datasource.url=jdbc:mysql://localhost:3306/NAME-OF-YOUR-DATABASE`
    2. `spring.datasource.username=USERNAME-FOR-YOUR-DATABASE`
    3. `spring.datasource.password=PASSWORD-FOR-YOUR-DATABASE`
 
 Run Application
------------
1. You can run application
    1. `com.baisalbek.pswds.PswdsApplication class`
2. [Go-to main page](http://localhost:8080) you will be redirected home page
    1. Click Get Started button 
3. Login with `username: admin` and `password: admin` [Go-to login page](http://localhost:8080/login)
4. Add new item is active by default. You can add item or modify existing item and delete item 
