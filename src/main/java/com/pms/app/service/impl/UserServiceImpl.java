package com.pms.app.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.pms.app.dto.UserVO;
import com.pms.app.entity.User;
import com.pms.app.repository.UserRepository;
import com.pms.app.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = Logger.getLogger(UserServiceImpl.class);

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean saveUser(UserVO userVO) {
		try {
			User user = new User();
			user.setUserName(userVO.getUserName());
			user.setMobileNo(userVO.getMobileNo());
			user.setEmail(userVO.getEmail());
			user.setPassword(passwordEncoder.encode(userVO.getPassword()));
			userRepository.save(user);
			return true;
		} catch (Exception e) {
			logger.error("An error occurred while saving user: " + e.getMessage());
		}
		return false;
	}

	@Override
	public boolean validateUser(UserVO userVO) {
		try {
			String username = userVO.getUserName();
			String password = userVO.getPassword();

			if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
				String encodedPassword = userRepository.findPasswordByUsername(username);
				if (encodedPassword != null) {
					boolean isValidPassword = passwordEncoder.matches(password, encodedPassword);
					if (isValidPassword) {
						int result = userRepository.checkUserCredentials(username, encodedPassword);
						if (result > 0) {
							return true;
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("An error occurred while validating user: " + e.getMessage());
		}
		return false;
	}

	@Override
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}

}