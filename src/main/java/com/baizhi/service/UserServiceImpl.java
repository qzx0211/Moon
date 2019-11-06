package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.Pj;
import com.baizhi.entity.User;
import com.baizhi.util.MybatisUtil;

import java.util.List;

public class UserServiceImpl implements UserService {
    @Override
    public User selectOne(String name) {
        UserDao mapper = MybatisUtil.getSqlSession().getMapper(UserDao.class);
        User user = mapper.selectOne(name);
        MybatisUtil.close();
        return user;
    }

    @Override
    public void addPj(Pj pj) {
        UserDao mapper = MybatisUtil.getSqlSession().getMapper(UserDao.class);
        try {
            mapper.addPj(pj);
            MybatisUtil.commit();
        }catch (Exception e){
            MybatisUtil.rollback();
        }


    }

    @Override
    public List<Pj> selectPj() {
        UserDao mapper = MybatisUtil.getSqlSession().getMapper(UserDao.class);
        List<Pj> pjs = mapper.selectPj();
        MybatisUtil.close();
        return pjs;
    }

    @Override
    public void update(String pid, int count) {
        UserDao mapper = MybatisUtil.getSqlSession().getMapper(UserDao.class);

        try {
            mapper.update(pid,count);
            MybatisUtil.commit();
        }catch (Exception e){
            MybatisUtil.rollback();
        }
    }

    @Override
    public Pj selectPjOne(String pid) {

        UserDao mapper = MybatisUtil.getSqlSession().getMapper(UserDao.class);
        Pj pj = mapper.selectPjOne(pid);
        MybatisUtil.close();
        return pj;
    }
}
