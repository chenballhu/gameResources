package dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {
	void createUser(@Param("id")int id,@Param("name")String name,@Param("password")String password,@Param("permission")boolean permission) throws SQLException;
	User login(@Param("name")String name,@Param("password")String password);
	User findUserByName(String name);
}
