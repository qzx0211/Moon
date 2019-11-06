package com.baizhi.service;

import com.baizhi.dao.ProvinceDao;
import com.baizhi.entity.Area;
import com.baizhi.entity.City;
import com.baizhi.entity.Province;
import com.baizhi.util.MybatisUtil;

import java.util.List;

public class ProvincecServiceImpl implements ProvinceService {

    @Override
    public List<Province> showProvinc() {
        ProvinceDao mapper = MybatisUtil.getSqlSession().getMapper(ProvinceDao.class);
        List<Province> provinces = mapper.selectAllProvince();
        MybatisUtil.close();
        return provinces;
    }

    @Override
    public List<City> showCitys(String provincecode) {
        ProvinceDao mapper = MybatisUtil.getSqlSession().getMapper(ProvinceDao.class);
        List<City> cities = mapper.selectCity(provincecode);
        MybatisUtil.close();
        return cities;
    }

    @Override
    public List<Area> showAreas(String citycode) {
        ProvinceDao mapper = MybatisUtil.getSqlSession().getMapper(ProvinceDao.class);
        List<Area> areas = mapper.selectArea(citycode);
        MybatisUtil.close();
        return areas;
    }
}
