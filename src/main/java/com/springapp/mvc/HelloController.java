package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @RequestMapping("/")
	public String printWelcome(Model model) {
		model.addAttribute("message", "Show Me The Money");
		return "hello";
	}
}