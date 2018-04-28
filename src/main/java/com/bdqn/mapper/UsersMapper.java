package com.bdqn.mapper;

import com.bdqn.model.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersMapper {
    int deleteByPrimaryKey(String cardId);

    int insert(Users users);

    int insertSelective(Users users);

    int isExists(@Param("cardId")String cardId);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

    Users login(Users u);

    int isDisable(@Param("cardId") String cardId);
}
