package com.baizhi.action;

import com.alibaba.fastjson.JSON;
import com.baizhi.entity.Area;
import com.baizhi.entity.City;
import com.baizhi.entity.Province;
import com.baizhi.service.ProvincecServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class ProvinceAction extends ActionSupport {
    public String showProvince(){
        ProvincecServiceImpl provincecService = new ProvincecServiceImpl();
        List<Province> list = provincecService.showProvinc();
        String s = JSON.toJSONString(list);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        try {
            PrintWriter writer = response.getWriter();
            writer.print(s);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }


    //接收省份的code
    private  String provincecode;

    public String getProvincecode() {
        return provincecode;
    }

    public void setProvincecode(String provincecode) {
        this.provincecode = provincecode;
    }

    public  String  showCitys(){
        //调用Service
        ProvincecServiceImpl cs = new ProvincecServiceImpl();
        List<City> cities = cs.showCitys(provincecode);
        //转换JSON协议串
        String jsonString = JSON.toJSONString(cities);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        try {
            PrintWriter out =response.getWriter();
            out.print(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    private  String  citycode;

    public String getCitycode() {
        return citycode;
    }

    public void setCitycode(String citycode) {
        this.citycode = citycode;
    }

    public  String  showAreas(){
        ProvincecServiceImpl as = new ProvincecServiceImpl();
        List<Area> areas = as.showAreas(citycode);
        //把区域转换为JSON协议串
        String jsonString = JSON.toJSONString(areas);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        try {
            PrintWriter out = response.getWriter();
            out.print(jsonString);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
