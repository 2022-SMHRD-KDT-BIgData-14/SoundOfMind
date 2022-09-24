package com.SoundOfMind.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;

@MapperScan("com.SoundOfMind.mapper")
@ComponentScan("com.SoundOfMind.controller")
@SpringBootApplication
public class SoundOfMindApplication {

	public static void main(String[] args) {
		SpringApplication.run(SoundOfMindApplication.class, args);
	}

}
