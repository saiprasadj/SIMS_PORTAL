package com.sims.portal.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.user.UserCredentials;

public interface AdminUserRepository extends JpaRepository<UserCredentials, Integer> {

    UserCredentials findByUserId(int userid);

}
