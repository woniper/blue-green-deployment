package net.woniper.app1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class App1Application {

	public static void main(String[] args) {
		SpringApplication.run(App1Application.class, args);
	}

	@GetMapping("/")
	public String app1() {
		return "hello app1";
	}
}
