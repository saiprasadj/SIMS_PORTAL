package com.sims.portal.beans;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ValidationResponse {

    private String status;
    private List<ErrorMessage> errorMessageList;
}
