package ohtu;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
//import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class Tester {

    public static void main(String[] args) {
        WebDriver driver = new FirefoxDriver();

        driver.get("http://localhost:8090");
        System.out.println(driver.getPageSource());
        //WebElement element = driver.findElement(By.linkText("login"));  
        WebElement element = driver.findElement(By.linkText("register new user"));
        element.click();

        System.out.println("==");

        //successful login
        /* System.out.println( driver.getPageSource() );
         element = driver.findElement(By.name("username"));
         element.sendKeys("pekka");
         element = driver.findElement(By.name("password"));
         element.sendKeys("akkep");
         element = driver.findElement(By.name("login"));
         element.submit(); */

        //failed login: wrong password
        /* System.out.println( driver.getPageSource() );
         element = driver.findElement(By.name("username"));
         element.sendKeys("pekka");
         element = driver.findElement(By.name("password"));
         element.sendKeys("asd");
         element = driver.findElement(By.name("login"));
         element.submit(); */

        //failed login: nonexistent username
        /* System.out.println( driver.getPageSource() );
         element = driver.findElement(By.name("username"));
         element.sendKeys("asd");
         element = driver.findElement(By.name("password"));
         element.sendKeys("asd");
         element = driver.findElement(By.name("login"));
         element.submit(); */

        //create new user and logout
        System.out.println(driver.getPageSource());
        element = driver.findElement(By.name("username"));
        element.sendKeys("asdasd");
        element = driver.findElement(By.name("password"));
        element.sendKeys("asdasdasd1");
        element = driver.findElement(By.name("passwordConfirmation"));
        element.sendKeys("asdasdasd1");
        element = driver.findElement(By.name("add"));
        element.submit();

        System.out.println("==");
        element = driver.findElement(By.linkText("continue to application mainpage"));
        element.click();

        System.out.println("==");
        element = driver.findElement(By.linkText("logout"));
        element.click();

        System.out.println("==");
        System.out.println(driver.getPageSource());

    }
}
