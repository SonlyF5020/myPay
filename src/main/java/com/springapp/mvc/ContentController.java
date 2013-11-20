package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("User")
public class ContentController {

    @RequestMapping("/content")
    public String getContent(@RequestParam("name") String name, HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        session.setAttribute("User", name);
        model.addAttribute("User", name);
        return "content";
    }
}
