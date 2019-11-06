package com.baizhi.dao;

import com.baizhi.entity.Area;
import com.baizhi.entity.City;
import com.baizhi.entity.Province;

import java.util.List;

public interface ProvinceDao {
     List<Province> selectAllProvince();
     List<City> selectCity(String code);
     List<Area> selectArea(String code);
}
