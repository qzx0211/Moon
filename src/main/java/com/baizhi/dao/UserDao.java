package com.baizhi.dao;

import com.baizhi.entity.Pj;
import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    User selectOne(String name);
    void addPj(Pj pj);
    List<Pj> selectPj();
    void update(@Param("pid") String pid,@Param("count") int count);
    Pj selectPjOne(String pid);
}
