package com.bdqn.mapper;

import com.bdqn.model.RealEstate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RealEstateMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RealEstate record);

    int insertSelective(RealEstate record);

    RealEstate selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RealEstate record);

    int updateByPrimaryKey(RealEstate record);

    List<RealEstate> listAll();

    List<RealEstate> listWithName(@Param("name") String inputValue);

    List<RealEstate> listWithCardId(@Param("cardId") String inputValue);
}
