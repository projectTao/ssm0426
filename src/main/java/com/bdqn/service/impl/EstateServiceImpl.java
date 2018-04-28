package com.bdqn.service.impl;

import com.bdqn.dto.RealEstateDTO;
import com.bdqn.mapper.RealEstateMapper;
import com.bdqn.model.RealEstate;
import com.bdqn.service.EstateService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("EstateService")
public class EstateServiceImpl implements EstateService {

    @Autowired
    private RealEstateMapper realEstateMapper;

    @Override
    public PageInfo<RealEstate> getAll() {
        PageHelper.startPage(1,2);
        List<RealEstate> list = realEstateMapper.listAll();
        PageInfo<RealEstate> pageInfo = new PageInfo<RealEstate>(list);
        pageInfo.setList(list);
        return pageInfo;
    }

    @SuppressWarnings("Duplicates")
    @Override
    public PageInfo<RealEstate> listPage(RealEstateDTO dto) {
        int type = dto.getType();

        if (type == 1){
            PageHelper.startPage(dto.getPageNum(),2);
            List<RealEstate> list = realEstateMapper.listWithName(dto.getInputValue());
            PageInfo<RealEstate> pageInfo = new PageInfo<RealEstate>(list);
            pageInfo.setList(list);
            return pageInfo;
        }else if (type == 2){
            PageHelper.startPage(dto.getPageNum(),2);
            List<RealEstate> list = realEstateMapper.listWithCardId(dto.getInputValue());
            PageInfo<RealEstate> pageInfo = new PageInfo<RealEstate>(list);
            pageInfo.setList(list);
            return pageInfo;
        }




        return null;
    }
}
