package com.baizhi.service;

import com.baizhi.entity.Area;
import com.baizhi.entity.City;
import com.baizhi.entity.Province;

import java.util.List;

public interface ProvinceService {
    public List<Province> showProvinc();
    List<City> showCitys(String provincecode);
    List<Area> showAreas(String citycode);
}
