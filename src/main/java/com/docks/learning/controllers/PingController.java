package com.docks.learning.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class PingController implements PingInterface{
    @Override
    public ResponseEntity<String> pingApi() {
        return ResponseEntity.status(200).body("API online");
    }

}
