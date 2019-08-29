package com.ylsoft.Query.service;

import com.ylsoft.Query.domain.User;

import java.util.List;
import java.util.Map;

public interface IQueryUserService {

    List<User> findAll(Integer page, Integer size);

    void addUser(User user);

    User findByUser(String id);

    void updateUser(User user);

    void delUser(String id);

    void delSelectUser(String[] uid);

    List<User> findUserMessage(Integer page, Integer size, Map<String, String> param);
}
