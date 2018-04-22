package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {
	void createUser(@Param("name")String name,@Param("password")String password,@Param("permission")boolean permission,
			@Param("sex")String sex,@Param("adult")boolean isAdult,@Param("like")String like) throws SQLException;
	User login(@Param("name")String name,@Param("password")String password);
	//判断注册时有没有相同用户名
	User findUserByName(String name);
	//排行榜
	List<String> showRank();
	//推荐
	List<String> recommend(@Param("like")String like);
	//游戏内页
	Map<String,String> showGame(String id);
	//搜索
	List<String> search1(@Param("str")String str);
	//显示评论
	List showComment(@Param("id")int id);
	//发送评论
	void comment(@Param("id")int id,@Param("user")String user,@Param("value")String value,@Param("cpu")String cpu,
			@Param("memory")String memory,@Param("HD")String HD,
				@Param("gd")String gd,@Param("sys")String sys);
}
