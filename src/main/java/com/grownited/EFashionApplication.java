package com.grownited;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@SpringBootApplication
public class EFashionApplication {

	public static void main(String[] args) {
		SpringApplication.run(EFashionApplication.class, args);
	}
	
	@Bean
	PasswordEncoder encoder() {
		return new BCryptPasswordEncoder(5);//salt
	}
	@Bean
	Cloudinary cloudinary() {
		Map<String, String> config = ObjectUtils.asMap("cloud_name", "dk49rgbb2", "api_key", "384833544532716",
				"api_secret", "2tK-wH0JBYzSLXU2J8i5KE8UXoU");
		return new Cloudinary(config);
	}

}
