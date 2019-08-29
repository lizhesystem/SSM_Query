package com.ylsoft.Query.service;

public interface ILoginService {

    // 注册
    void register(String username, String email, String password);

    String findByUsername(String username) throws  Exception;

    String findByPassword(String password) throws  Exception;
}
