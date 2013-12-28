/*
 * $Id: Login.java 739661 2009-02-01 00:06:00Z davenewton $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.skmm.app.example.action;

import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.skmm.app.example.service.UserService;

public class LoginAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	private UserService userService ;
	
    public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String execute() throws Exception {
		if (!isValidUser(getUserID()))
			return INPUT;
		
		Map session = ActionContext.getContext().getSession();
		session.put("logined","true");
		session.put("context", new Date());
		return SUCCESS;
	}
	
    private boolean isValidUser(String value) {
        return (userService.findByCode(value).getPassword().equals(getPassword()));
    }

    private String userID;

    public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}