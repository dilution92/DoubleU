package com.doubleu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class DoubleuApplication {

	public static void main(String[] args) {
		SpringApplication.run(DoubleuApplication.class, args);
	}

}
