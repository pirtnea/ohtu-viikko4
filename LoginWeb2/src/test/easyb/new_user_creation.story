import ohtu.*
import ohtu.authentication.*
import org.openqa.selenium.*
import org.openqa.selenium.firefox.FirefoxDriver;

description 'A new user account can be created 
              if a proper unused username 
              and a proper password are given'

scenario "creation succesful with correct username and password", {
    given 'command new user is selected', {
        driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));       
        element.click();  
    }
 
    when 'a valid username and password are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("testi1");
        element = driver.findElement(By.name("password"));
        element.sendKeys("testisala1");
        element = driver.findElement(By.name("passwordConfirmation"));
	element.sendKeys("testisala1");
	element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new user is registered to system', {
      driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe true
    }
}

scenario "can login with succesfully generated account", {
    given 'command login is selected', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("login"));       
        element.click();   
    }
 
    when 'a valid username and password are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("testi1");
        element = driver.findElement(By.name("password"));
        element.sendKeys("testisala1");
        element = driver.findElement(By.name("login"));
        element.submit();
    }

    then  'new credentials allow logging in to system', {
	driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe true
    }
}

scenario "creation fails with correct username and too short password", {
    given 'command new user is selected', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));       
        element.click();  
    }

    when 'a valid username and too short password are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("testi2");
        element = driver.findElement(By.name("password"));
        element.sendKeys("asd1");
        element = driver.findElement(By.name("passwordConfirmation"));
	element.sendKeys("asd1");
	element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new user is not be registered to system', {
	driver.getPageSource().contains("length greater or equal to 8").shouldBe true
    }
}

scenario "creation fails with correct username and password consisting of letters", {
    given 'command new user is selected', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));       
        element.click();  
    }

    when 'a valid username and password consisting of letters are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("testi3");
        element = driver.findElement(By.name("password"));
        element.sendKeys("asdasdasd");
        element = driver.findElement(By.name("passwordConfirmation"));
	element.sendKeys("asdasdasd");
	element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new user is not be registered to system', {
	driver.getPageSource().contains("must contain one character that is not a letter").shouldBe true
    }
}

scenario "creation fails with too short username and valid password", {
    given 'command new user is selected', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));       
        element.click();
    }

    when 'a too short username and valid password are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("asd");
        element = driver.findElement(By.name("password"));
        element.sendKeys("asdasdasd1");
        element = driver.findElement(By.name("passwordConfirmation"));
	element.sendKeys("asdasdasd1");
	element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new user is not be registered to system', {
	driver.getPageSource().contains("length 5-10").shouldBe true
    }
}

scenario "creation fails with already taken username and valid password", {
    given 'command new user is selected', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));       
        element.click();
    }

    when 'a already taken username and valid password are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("testi1");
        element = driver.findElement(By.name("password"));
        element.sendKeys("testisala1");
        element = driver.findElement(By.name("passwordConfirmation"));
	element.sendKeys("testisala1");
	element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new user is not be registered to system', {
	driver.getPageSource().contains("username or password invalid").shouldBe true
    }
}

scenario "can not login with account that is not succesfully created", {
    given 'command new user is selected', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));       
        element.click();
    }

    when 'a invalid username/password are entered', {
	element = driver.findElement(By.name("username"));
        element.sendKeys("asd");
        element = driver.findElement(By.name("password"));
        element.sendKeys("asd");
        element = driver.findElement(By.name("passwordConfirmation"));
	element.sendKeys("asd");
	element = driver.findElement(By.name("add"));
        element.submit();
    }

    then  'new credentials do not allow logging in to system', {
	driver = new FirefoxDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("login"));       
        element.click();

	element = driver.findElement(By.name("username"));
        element.sendKeys("asd");
        element = driver.findElement(By.name("password"));
        element.sendKeys("asd");
        element = driver.findElement(By.name("login"));
        element.submit();

	driver.getPageSource().contains("wrong username or password").shouldBe true
    }
}
