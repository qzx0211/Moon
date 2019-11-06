package com.baizhi.service;

import com.baizhi.entity.Pj;
import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    User selectOne(String name);
    void addPj(Pj pj);
    List<Pj> selectPj();
    void update( String pid, int count);
    Pj selectPjOne(String pid);
}
