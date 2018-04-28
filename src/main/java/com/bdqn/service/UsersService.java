package com.bdqn.service;

import com.bdqn.model.Users;

public interface UsersService {

     Users login(Users u);

     boolean isExists(String cardId);

     boolean isDisable(String cardId);

    int register(Users u);
}
