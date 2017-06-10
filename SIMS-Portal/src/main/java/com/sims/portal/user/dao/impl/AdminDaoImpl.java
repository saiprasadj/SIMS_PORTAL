package com.sims.portal.user.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.user.dao.AdminDao;


@Repository
@Transactional(rollbackFor = java.lang.Exception.class)
public class AdminDaoImpl implements AdminDao {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public UserCredentials findUserCredential(int userid) {
		return	em.find(UserCredentials.class, userid);
	}


}
