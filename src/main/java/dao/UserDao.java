package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {
	void createUser(@Param("name")String name,@Param("password")String password,@Param("permission")boolean permission,
			@Param("sex")String sex,@Param("adult")boolean isAdult,@Param("like")String like) throws SQLException;
	User login(@Param("name")String name,@Param("password")String password);
	User findUserByName(String name);
}
