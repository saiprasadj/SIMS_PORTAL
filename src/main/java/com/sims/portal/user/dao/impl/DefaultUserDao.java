package com.sims.portal.user.dao.impl;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

import com.sims.portal.dao.utils.AbstractGenericDAO;
import com.sims.portal.model.user.User;
import com.sims.portal.model.user.UserCredentials;
import com.sims.portal.user.dao.UserDao;

@Repository("userDao")
public class DefaultUserDao extends AbstractGenericDAO<Serializable> implements UserDao {
	
	@PersistenceContext
	EntityManager em;

	@Override
	public User findById(int id) {
		return (User) findOne(id);
	}

	@Override
	public User findByUsername(String username) {
		
			CriteriaBuilder builder = getEntityManager().getCriteriaBuilder();
	    CriteriaQuery<User> criteria = builder.createQuery(User.class);
	    Root<User> from = criteria.from(User.class);
	    criteria.select(from);
	    //criteria.where(builder.equal(from.get(User_.username), username));
	    TypedQuery<User> typed = getEntityManager().createQuery(criteria);
	    try {
	        return typed.getSingleResult();
	    } catch (final NoResultException nre) {
	        return null;
	    }
	}

	@Override
	public UserCredentials findUser(String username) {
		/*CriteriaBuilder builder = getEntityManager().getCriteriaBuilder();
	    CriteriaQuery<UserCredentials> criteria = builder.createQuery(UserCredentials.class);
	    Root<UserCredentials> from = criteria.from(UserCredentials.class);
	    criteria.select(from);
	    criteria.where(builder.equal(from.get(UserCredentials_.userId), username));
	    TypedQuery<UserCredentials> typed = getEntityManager().createQuery(criteria);
	    try {
	        return typed.getSingleResult();
	    } catch (final NoResultException nre) {
	        return null;
	    }
	}*/
		return em.createQuery("SELECT p FROM UserCredentials p where p.userId= " + username, UserCredentials.class).getSingleResult();
	}

	
}
