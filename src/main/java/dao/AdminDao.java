package dao;

import java.util.List;
import java.util.Map;

import entity.User;

public interface AdminDao {
	//检索所有用户
	List findAllUser();
	//搜索指定用户
	User findUserByName(String userName);
	//设置禁言
	void setPermission1(int id);
	//设置解除禁言
		void setPermission2(int id);
	//检索所有游戏
	List findAllGame();
	//删除评论
	void delComment(int id);
}
