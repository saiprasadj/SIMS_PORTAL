# SIMS_PORTAL

## Steps to Migrate from spring to spring-boot project

### Step 1
The quickest way to get started is by adding the spring-boot-starter-parent pom.xml:

```xml
	<parent>
	    <groupId>org.springframework.boot</groupId>
	    <artifactId>spring-boot-starter-parent</artifactId>
	    <version>1.5.6.RELEASE</version>
	</parent>
```
This will take care of dependency management. Remove all version as `spring-boot-starter-parent` will take care of it and add add below dependency

       <dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter</artifactId>
		</dependency>		

### Step 2
Application Entry Point , add below code at root package

```java
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
```
### Step 3
Move WEB-INF folder from WebContent folder to src/main/webapp folder


