package com.example.basicbankingsystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class BasicBankingSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(BasicBankingSystemApplication.class, args);
    }

}
