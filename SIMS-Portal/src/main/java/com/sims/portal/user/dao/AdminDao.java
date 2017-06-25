package com.sims.portal.user.dao;

import org.springframework.stereotype.Component;
import com.sims.portal.model.user.UserCredentials;



@Component
public interface AdminDao {


	public UserCredentials findUserCredential(int userid);


}
