package web;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.management.RuntimeErrorException;
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
	
	@ResponseBody
	@RequestMapping( value="/login")
	public Object login(String name,String password,HttpServletRequest req){
		User user = userDao.login(name, password);
		try{
			if(user==null || user.getName().equals("")){
				return new JsonResult(1,user,"’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			}
			if(user.getName()!=null && !user.getName().equals("")){
				
				return new JsonResult(0,user,"µ«¬Ω≥…π¶");
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
	
	@RequestMapping("/signUp")
	public String signUp(String userName,String password,boolean permission,String sex,boolean adult,String like) throws IOException{
		try{
			userDao.createUser(userName, password, permission, sex, adult, like);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return "index";
	
	}
	
	@RequestMapping("/game")
	public String showList(String id){
		
		return "game";
		
	}
	
	@RequestMapping("/list")
	public String list(){
		
		return "list";
		
	}
	
}
