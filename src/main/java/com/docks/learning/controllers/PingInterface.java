package com.docks.learning.controllers;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

public interface PingInterface {

    @GetMapping
    public ResponseEntity<String> pingApi();
}
