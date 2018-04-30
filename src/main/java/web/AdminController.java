package web;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AdminDao;
import dao.UserDao;
import entity.User;
import util.JsonResult;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	UserDao userDao;
	@Resource
	AdminDao adminDao;
	
	@RequestMapping("/config")
	public Object toConfig(){
		return "config";
	}
	@RequestMapping("/del")
	public Object toDel(){
		return "del";
	}
	@RequestMapping("/bug")
	public Object toBug(){
		return "bug";
	}
	//登陆
	@RequestMapping("/login")
	@ResponseBody
	public Object login(String password){
		List list = adminDao.login(password);
		if(list.size()==0){
			return new JsonResult(1,"","指令错误");
		}
		return new JsonResult(0,"admin/config","登陆成功");
	}
	//检索所有用户
	@RequestMapping("/findAllUser")
	@ResponseBody
	public Object showUser(String userName){
		List list = adminDao.findAllUser();
		return new JsonResult(list);
	}
	//检索用户
		@RequestMapping("/findUserByName")
		@ResponseBody
		public Object findUserByName(String userName){
			User user = adminDao.findUserByName(userName);
			return new JsonResult(user);
		}
	
	//设置禁言
	@RequestMapping("/setPermission1")
	@ResponseBody
	public Object setPermission1(int id){
		adminDao.setPermission1(id);
		return new JsonResult(0,"","成功禁言");
	}
	//设置解除禁言
		@RequestMapping("/setPermission2")
		@ResponseBody
		public Object setPermission2(int id){
			adminDao.setPermission2(id);
			return new JsonResult(0,"","成功解除禁言");
		}
	//检索所有游戏
		@RequestMapping("/findAllGame")
		@ResponseBody
		public Object findAllGame(){
			List list = adminDao.findAllGame();
			return new JsonResult(list);
		}
	
	//检索指定游戏
		@RequestMapping("/findGameByName")
		@ResponseBody
		public Object findGameByName(String name){
			List list = adminDao.findGameByName(name);
			return new JsonResult(list);
		}
	//删除评论
		@RequestMapping("/delComment")
		@ResponseBody
		public Object delComment(int id){
			adminDao.delComment(id);
			return new JsonResult(0,"","删除成功");
		}
	//检索所有勘误
		@RequestMapping("/showBug")
		@ResponseBody
		public Object showBug(){
			List list = adminDao.showAllBug();
			if(list.size()==0){
				return new JsonResult(1,"","没有查询到数据");
			}
			return new JsonResult(list);
		}
	//删除勘误
		@RequestMapping("/deleteBug")
		@ResponseBody
		public Object deleteBug(int id){
			adminDao.deleteBug(id);
			
			return new JsonResult(0,"","成功删除");
		}
}
