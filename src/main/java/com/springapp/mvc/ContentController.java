package com.springapp.mvc;

import com.springapp.mvc.constant.UserConstant;
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
    public String getContent(@RequestParam("user") String user, HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        session.setAttribute("User", user);
        model.addAttribute("User", UserConstant.getChineseName(user));
        return "content";
    }
}
