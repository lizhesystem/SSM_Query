package com.ylsoft.Query.service.impl;


import com.ylsoft.Query.dao.ILoginDao;
import com.ylsoft.Query.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService {

    @Autowired
    private ILoginDao loginDao;


    // 注册
    @Override
    public void register(String username, String email, String password) {
        loginDao.register(username, email, password);
    }

    @Override
    public String findByUsername(String username) {
        return loginDao.findByUsername(username);
    }

    @Override
    public String findByPassword(String password) {
        return loginDao.findByPassword(password);
    }
}


