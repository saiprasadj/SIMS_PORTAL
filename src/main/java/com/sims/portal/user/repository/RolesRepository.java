package com.sims.portal.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sims.portal.model.user.Role;

public interface RolesRepository extends JpaRepository<Role, Long>{

}
