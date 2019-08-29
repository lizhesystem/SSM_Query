package com.ylsoft.Query.dao;

import com.ylsoft.Query.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IQueryListDao {

    @Select(" select * from user")
    List<User> findAll();

    @Insert(" insert into user(name,gendet,age,address,qq,email) values(#{name},#{gendet},#{age},#{address},#{qq},#{email})")
    void addUser(User user);

    @Select("select * from user where id  = #{id} ")
    User findByUser(String id);

    @Update(" update user set gendet = #{gendet},age = #{age},address = #{address},qq = #{qq},email = #{email} where id = #{id}")
    void updateUser(@Param(value = "id") Integer id, @Param(value = "gendet") String gendet, @Param(value = "age") Integer age,
                    @Param(value = "address") String address, @Param(value = "qq") String qq, @Param(value = "email") String email);

    @Delete(" delete from user where id = #{id}")
    void delUser(String id);


    @Delete({
            "<script>"
                    + "delete from user where id in"
                    + "<foreach item='item' index='index' collection='uid' open='(' separator=',' close=')'>"
                    + "#{item}"
                    + "</foreach>"
                    + "</script>"
    })
    void delSelectUser(@Param(value = "uid") String[] uid);

    @Select("select * from user where name like CONCAT('%',#{name},'%') and address like CONCAT('%',#{address},'%') and email like CONCAT('%',#{email},'%')  ")
    List<User> findUserMessage(@Param(value = "name") String name, @Param(value = "address") String address, @Param(value = "email") String email);
}
