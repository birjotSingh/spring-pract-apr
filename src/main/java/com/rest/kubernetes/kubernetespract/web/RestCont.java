package com.rest.kubernetes.kubernetespract.web;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestCont {


    @GetMapping("/print")
    public String printMethod(){
        System.out.println("in rest Controller");
        return "working!!";
    }
}
