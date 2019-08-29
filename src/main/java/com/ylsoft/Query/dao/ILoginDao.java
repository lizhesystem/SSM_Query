package com.ylsoft.Query.dao;

import com.ylsoft.Query.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ILoginDao {

    @Insert(" insert into admin (username,password,mail) values(#{username},#{password},#{mail})")
    void register(@Param(value = "username") String username, @Param(value = "password") String password, @Param(value = "mail") String mail);

    @Select(" select username from admin where username = #{username}")
    String findByUsername(String username);

    @Select(" select password from admin where password = #{password}")
    String findByPassword(String password);
}
