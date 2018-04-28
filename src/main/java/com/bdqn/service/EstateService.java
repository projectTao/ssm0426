package com.bdqn.service;

import com.bdqn.dto.RealEstateDTO;
import com.bdqn.model.RealEstate;
import com.github.pagehelper.PageInfo;

public interface EstateService {

    PageInfo<RealEstate> getAll();

    PageInfo<RealEstate> listPage(RealEstateDTO dto);
}
