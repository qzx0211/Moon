package com.baizhi.entity;

public class Pj {
    private String pid;
    private String text;
    private String uname;
    private Integer count;

    public Pj() {
    }

    @Override
    public String toString() {
        return "Pj{" +
                "pid=" + pid +
                ", text='" + text + '\'' +
                ", uname='" + uname + '\'' +
                ", count=" + count +
                '}';
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Pj(String pid, String text, String uname, Integer count) {
        this.pid = pid;
        this.text = text;
        this.uname = uname;
        this.count = count;
    }
}
