package com.example.controller;

import com.example.dto.UserLoginDto;
import com.example.dto.UserRegisterDto;
import com.example.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

@Controller
public class BloodBankController {
    @Autowired
    SignupService signupService;
    @Autowired
    LoginService loginService;
    @Autowired
    SortingAndFilterService sortingAndFilterService;

    @GetMapping("/")
    public String showHome() {
        return "home";
    }

    @GetMapping("/signup")
    public String signUp(HttpServletRequest request, Model model) {
        String role = (String) request.getSession().getAttribute("role");
        model.addAttribute("role", role);
        if (role != null && role.equalsIgnoreCase("AGENT")) {
            return "agent/endusersignup";
        } else {
            return "enduser/signup";
        }
    }

    @GetMapping("/login")
    public String login(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session != null) {
            System.out.println("session invalid");
            session.invalidate();
        }
        return "login";
    }

    @PostMapping(value = "/register")
    public String register(@ModelAttribute @Valid UserRegisterDto userRegisterDto, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        String role = (String) request.getSession().getAttribute("role");
        if (role != null) {
            userRegisterDto.setPassword(String.valueOf(userRegisterDto.getDob()));
            userRegisterDto.setRole(role.equalsIgnoreCase("ADMIN") ? "AGENT" : "ENDUSER");
            userRegisterDto.setFirstLogin(true);
            userRegisterDto.setCreatedBy((String) request.getSession().getAttribute("userId"));

        } else {   //only enduser come here
            userRegisterDto.setRole("ENDUSER");
            userRegisterDto.setCreatedBy("auto");
            userRegisterDto.setFirstLogin(false);   //for not given the option of password updation at first login
        }
        if (signupService.addUser(userRegisterDto)) {
            redirectAttributes.addFlashAttribute("successMessage", "UserName already exits ,Please try again with different username");
        } else {
            redirectAttributes.addFlashAttribute("successMessage", "Successfully Registered!");
        }
        String referer = request.getHeader("referer");
        if (referer != null) {
            return "redirect:" + referer;
        } else {
            return "redirect:/"; // Redirect to home page if referer is not available
        }
    }

    @PostMapping(value = "/userLogin")
    public String userLogin(@ModelAttribute @Valid UserLoginDto userLoginDto, Model model, HttpServletRequest request) {
        UserRegisterDto returnDto = loginService.checkUser(userLoginDto);

        if (returnDto.getLoginAttempts()==0) {
//            sucessfully login
            HttpSession session = request.getSession();   //session object created
            System.out.println("session created");
            session.setAttribute("id", returnDto.getId());
            session.setAttribute("userId", returnDto.getUserName());
            session.setAttribute("name", returnDto.getName());
            session.setAttribute("role", returnDto.getRole());
            session.setAttribute("dob", returnDto.getDob());
            session.setAttribute("createdBy", returnDto.getCreatedBy());
            session.setAttribute("createdOn", returnDto.getCreatedOn());
            session.setAttribute("bloodGroup", returnDto.getBloodGroup());
            session.setAttribute("coinValue", returnDto.getCoinValue());
            sortingAndFilterService.updateActiveUsers(returnDto.getUserName(), "add");
            if (returnDto.isFirstLogin()) {
                model.addAttribute("userName",returnDto.getUserName());
                // Redirect to the password update page
                return "updatePasswordForm";
            }
            if (returnDto.isLocked()) {
                return "loginAttemptsExceeded";
            }
            else {
                //switch for matching corresponding role and display view according with role
                switch (returnDto.getRole()) {
                    case "ADMIN":
                        model.addAttribute("coinValue", returnDto.getCoinValue());
                        return "admin/dashboard";
                    case "AGENT":
                        model.addAttribute("coinValue", returnDto.getCoinValue());
                        return "agent/dashboard";
                    case "ENDUSER":

                        return "enduser/user";
                    default:
                        return "loginError";

                }
            }
        }
        if (returnDto.isLocked()) {
            return "loginAttemptsExceeded";
        }
        model.addAttribute("loginAttemp",returnDto.getLoginAttempts());
        return "loginError";

    }

    @PostMapping(value = "/processUpdatePassword")
    public String updatePassword(@ModelAttribute @Valid UserLoginDto userLoginDto,Model model,HttpSession session) {
        String status = loginService.updatePassword(userLoginDto);
        if (status == null) {
            return "redirect:/login";
        } else if (status.equalsIgnoreCase("mismatch")) {
            model.addAttribute("error","Old Password did not Match ,please enter right password");
            model.addAttribute("userName",session.getAttribute("userId"));
            return "updatePasswordForm";
        }
        else {
            return "passwordUpdateSuccess";
        }
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        sortingAndFilterService.updateActiveUsers((String) session.getAttribute("userId"), "remove");
        session.invalidate();
        System.out.println("session invalid");
        return "login";
    }


}
