package com.example.conversor_temperatura;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TemperaturaController {
   @GetMapping("/celsiustofahrenheit/{grau}")
    public String ctf(@PathVariable("grau") double grau) {
        double fahrenheit = (grau * 9/5) + 32;
        return grau + " ºC = " + fahrenheit + " ºF";
    }
   @GetMapping("/fahrenheittocelsius/{grau}")
    public String ftc(@PathVariable("grau") double grau) {
        double celsius = (grau - 32) * 5/9;
        return grau + " ºF = " + celsius + " ºC";
    }
}