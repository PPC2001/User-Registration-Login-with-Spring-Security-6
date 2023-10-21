package com.pms.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pms.app.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByEmail(String email);

	@Query(value = "SELECT 1 AS RES FROM T_USER_MAST WHERE username = :username and password = :password", nativeQuery = true)
	Integer checkUserCredentials(@Param("username") String username, @Param("password") String password);

	@Query(value = "SELECT PASSWORD FROM T_USER_MAST WHERE username = :username", nativeQuery = true)
	String findPasswordByUsername(@Param("username") String username);
}