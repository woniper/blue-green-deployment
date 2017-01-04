package net.woniper.app2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class App2Application {

	public static void main(String[] args) {
		SpringApplication.run(App2Application.class, args);
	}

	@GetMapping("/")
	public String app2() {
		return "hello app2";
	}
}
