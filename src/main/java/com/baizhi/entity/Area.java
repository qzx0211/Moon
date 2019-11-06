package com.baizhi.entity;

public class Area {
    private  Integer id;
    private String code;
    private String name;
    private String citycode;

    public Area() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCitycode() {
        return citycode;
    }

    public void setCitycode(String citycode) {
        this.citycode = citycode;
    }

    public Area(Integer id, String code, String name, String citycode) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.citycode = citycode;
    }

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", citycode='" + citycode + '\'' +
                '}';
    }
}
