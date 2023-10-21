package com.pms.app.controller;

import com.pms.app.dto.UserVO;
import com.pms.app.entity.*;
import com.pms.app.service.UserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api")
public class LoginController {

	private static final Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@GetMapping("/register")
	public ModelAndView showRegistrationForm(@ModelAttribute("userVO") UserVO userVO) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			logger.info("Inside the LoginController :: showRegistrationForm method - " + userVO.getSubmitStatus());
			modelAndView.addObject("userVO", userVO);
			modelAndView.setViewName("register");
		} catch (Exception e) {
			logger.error("An error occurred: " + e.getMessage());
		}
		return modelAndView;
	}

	@PostMapping("/register/save")
	public @ResponseBody UserVO registration(@ModelAttribute("userVO") UserVO userVO, BindingResult result,
			Model model) {
		try {
			User existingUser = userService.findUserByEmail(userVO.getEmail());
			if (existingUser != null && existingUser.getEmail() != null && !existingUser.getEmail().isEmpty()) {
				userVO.setErrMessage("There is already an account registered with the same email");
				return userVO;
			}
			if (result.hasErrors()) {
				model.addAttribute("userVO", userVO);
				userVO.setErrMessage("Unable to Register");
				return userVO;
			}

			boolean isUserSaved = userService.saveUser(userVO);
			if (isUserSaved) {
				userVO.setSubmitStatus("success");
				userVO.setSuccessMsg("User Registered Successfully");
				logger.info("User Registered Successfully - " + userVO.getUserName());
			}
		} catch (Exception e) {
			logger.error("An error occurred while registering user: " + e.getMessage());
			userVO.setErrMessage("An error occurred while registering user. Please try again later.");
			return userVO;
		}
		return userVO;

	}

	@GetMapping("/login")
	public ModelAndView loginFormOnLoad(@ModelAttribute("userVO") UserVO userVO) {
		logger.info("Inside the LoginController :: loginFormOnLoad method");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userVO", userVO);
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@PostMapping("/login")
	public ModelAndView loginForm(@ModelAttribute("userVO") UserVO userVO) {
		logger.info("Inside the LoginController :: loginForm method" + userVO.getPassword());
		boolean isValidUser = false;
		ModelAndView modelAndView = new ModelAndView();

		try {
			isValidUser = userService.validateUser(userVO);
			if (isValidUser) {
				logger.info("User is Valid " + userVO.getUserName());
				modelAndView.addObject("userVO", userVO);
				modelAndView.setViewName("home");
			} else {
				userVO.setErrMessage("Invalid Username or Password");
				modelAndView.addObject("userVO", userVO);
				modelAndView.setViewName("login");
			}
		} catch (Exception e) {
			logger.error("An error occurred while validating user: " + e.getMessage());
		}
		return modelAndView;
	}

}