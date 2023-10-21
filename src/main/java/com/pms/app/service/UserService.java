package com.pms.app.service;

import java.util.List;

import com.pms.app.dto.UserVO;
import com.pms.app.entity.User;

public interface UserService {
	boolean saveUser(UserVO UserVO);

	boolean validateUser(UserVO userVO);

	User findUserByEmail(String email);
}