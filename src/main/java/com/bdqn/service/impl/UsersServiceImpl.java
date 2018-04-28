package com.bdqn.service.impl;

import com.bdqn.mapper.UsersMapper;
import com.bdqn.model.Users;
import com.bdqn.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service("UsersService")
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersMapper usersMapper;

    @Override
    public Users login(Users u) {
        Users users = usersMapper.login(u);
        return users;
    }

    @Override
    public boolean isExists(String cardId) {
        int row = usersMapper.isExists(cardId);
        if (row == 1){
            return true;
        }
        return false;
    }

    @Override
    public boolean isDisable(String cardId) {
        int row = usersMapper.isDisable(cardId);
        if (row ==1){
            return true;
        }
        return false;
    }

    @Override
    public int register(Users u) {
        //取当前系统时间作为用户建立时间
        u.setCreatetime(new Date());
        //截取身份证号的最会一位，设置男女。
        String endChar = u.getCardId().substring(u.getCardId().length()-1);
        int num = Integer.parseInt(endChar);
        if (num % 2 == 0){
            u.setGender(0);
        }else {
            u.setGender(1);
        }
        int row = usersMapper.insertSelective(u);

        return row;
    }
}
