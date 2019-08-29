package com.ylsoft.Query.service.impl;

import com.github.pagehelper.PageHelper;
import com.ylsoft.Query.dao.IQueryListDao;
import com.ylsoft.Query.domain.User;
import com.ylsoft.Query.service.IQueryUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class QueryUserServiceImpl implements IQueryUserService {

    @Autowired
    private IQueryListDao iQueryListDao;

    @Override
    public List<User> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return iQueryListDao.findAll();
    }

    @Override
    public void addUser(User user) {
        iQueryListDao.addUser(user);
    }

    @Override
    public User findByUser(String id) {
        return iQueryListDao.findByUser(id);
    }

    @Override
    public void updateUser(User user) {
        iQueryListDao.updateUser(user.getId(), user.getGendet(), user.getAge(), user.getAddress(), user.getQq(), user.getEmail());
    }

    @Override
    public void delUser(String id) {
        iQueryListDao.delUser(id);
    }

    @Override
    public void delSelectUser(String[] uid) {
//        for (int i = 0; i < uid.length; i++) {
//            iQueryListDao.delUser(uid[i]);
//        }
        iQueryListDao.delSelectUser(uid);
    }

    @Override
    public List<User> findUserMessage(Integer page, Integer size, Map<String, String> param) {

//        获取三个条件
        String name = param.get("name");
        if (name == null) {
            name = "";
        }
        String address = param.get("address");
        if (address == null) {
            address = "";
        }
        String email = param.get("email");
        if (email == null) {
            email = "";
        }

        PageHelper.startPage(page, size);
        return iQueryListDao.findUserMessage(name, address, email);
    }

}
