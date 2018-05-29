package com.sims.portal.beans;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ForgotPassword {

    @NotEmpty(message = "{login.username.empty}")
    private String userId;
    private String password;
    private String changePassword;
    @NotEmpty(message = "{login.email.empty}")
    private String email;
}
