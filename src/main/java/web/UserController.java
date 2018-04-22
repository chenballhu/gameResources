package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDao;
import entity.User;
import util.JsonResult;


@Controller
//@RequestMapping("/user")
public class UserController {
	
	@Resource
	UserDao userDao;
	//登陆
	@ResponseBody
	@RequestMapping( value="/login")
	public Object login(String name,String password,HttpServletRequest req,HttpServletResponse res){
		User user = userDao.login(name, password);
		try{
			if(user==null || user.getName().equals("")){
				return new JsonResult(1,user,"用户名或者密码错误");
			}
			if(user.getName()!=null && !user.getName().equals("")){
				
				return new JsonResult(0,user,"登陆成功");
			}
		}catch(RuntimeErrorException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	@RequestMapping("/toLogin")
	public String toLogin() throws IOException{
		
		return "index";
		
	}
	
	@RequestMapping("/toSignUp")
	public String toSignUp() throws IOException{
		
		return "signUp";
		
	}
	//注册
	@RequestMapping("/signUp")
	public Object signUp(String userName,String password,boolean permission,String sex,boolean adult,String like) throws IOException{
		try{
			User user = userDao.findUserByName(userName);
			//用户名不重复时才能注册
			if(user!=null && !user.getName().equals("")){
				return new JsonResult(1,user,"用户名重复");
			}
			System.out.println(user);
			userDao.createUser(userName, password, permission, sex, adult, like);
			return new JsonResult(0,"",userName+"注册成功！！");
		}catch(SQLException e){
			e.printStackTrace();
		}
		return like;	
	}
	//注册验证
	@ResponseBody
	@RequestMapping("/checkSignUp")
	public Object checkSignUp(String userName){
		User user = userDao.findUserByName(userName);
		//用户名不重复时才能注册
		if(user!=null && !user.getName().equals("")){
			return new JsonResult(1,user,"用户名重复");
		}
		return new JsonResult(0,"","注册成功");
	}
	
	//排行榜
	@ResponseBody
	@RequestMapping(value="/rank")
	public Object rank(HttpServletRequest req){
		try{
			List<String> list = userDao.showRank();
			return new JsonResult(list);
		}catch(RuntimeErrorException e){
			e.printStackTrace();
			return new JsonResult(0,e);
		}
	}
	//游戏推荐
	@ResponseBody
	@RequestMapping("/recommend")
	public Object recommend(String like){
		try{
			List<String> list = userDao.recommend(like);
			return new JsonResult(list);
		}catch(RuntimeErrorException e){
			e.printStackTrace();
			return new JsonResult(0,e);
		}
	}
	//游戏内页
	@RequestMapping(value="/game")
	public Object showGame(String id,HttpServletRequest req){
		Map<String,String> map = new HashMap<String,String>();
		map = userDao.showGame(id);
		req.setAttribute("map", map);
		return "game";
		
	}
	
	//索引页
	@RequestMapping("/list")
	public Object showList(String str,HttpServletRequest req) throws ServletException, IOException{
		
		try{
			List list = userDao.search1(str);
			req.setAttribute("search", list);
			return "list";
		}catch(RuntimeErrorException e){
			return new JsonResult(0,e);
		}

	}
	
	//搜索
	@ResponseBody
	@RequestMapping("/search")
	public Object search(String str,HttpServletRequest req){
		try{
			List list = userDao.search1(str);
			req.setAttribute("list", list);
			return new JsonResult(list);
		}catch(RuntimeErrorException e){
			return new JsonResult(0,e);
		}
	}
	
	//显示评论
	@ResponseBody
	@RequestMapping("/showComment")
	public Object showComment(int id){
		List<String> list = userDao.showComment(id);
		return new JsonResult(list);
	}
	
	//前往评论页
	@RequestMapping("/toComment")
	public Object toComment(int id,HttpServletRequest req){
		req.setAttribute("id", id);
		return "comment";
	}
	
	//评论
	@RequestMapping("/comment")
	public Object comment(int id,String user,String value,String cpu,String memory,String HD,String gd,String sys){
		//有bug
		List list = new ArrayList();
		list.add(id);
		list.add(user);
		list.add(value);
		list.add(cpu);
		list.add(memory);
		list.add(HD);
		list.add(gd);
		list.add(sys);
		for(int i=0;i<list.size();i++){
			if(list.get(i).equals("") || list.get(i)==null){
				return null;
			}
			break;
		}
		userDao.comment(id, user, value, cpu, memory, HD, gd, sys);
		return "comment";
	}
	
	//前往勘误页
	@RequestMapping("/toDebug")
	public Object toDebug(int id,HttpServletRequest req){
		req.setAttribute("id", id);
		return "debug";
	}
}
