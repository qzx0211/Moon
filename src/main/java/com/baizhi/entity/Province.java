package com.baizhi.entity;

import java.util.Objects;

public class Province {
    private  Integer id;
    private String code;
    private String name;

    @Override
    public String toString() {
        return "Province{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Province province = (Province) o;
        return Objects.equals(id, province.id) &&
                Objects.equals(code, province.code) &&
                Objects.equals(name, province.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, code, name);
    }

    public Province() {
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

    public Province(Integer id, String code, String name) {
        this.id = id;
        this.code = code;
        this.name = name;
    }
}
