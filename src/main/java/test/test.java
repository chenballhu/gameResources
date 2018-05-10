package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.AdminDao;
import dao.UserDao;
import entity.User;

public class test {
ClassPathXmlApplicationContext ctx;
	
	@Before
	public void init(){
		ctx = new ClassPathXmlApplicationContext("spring-mybatis.xml");
	}
	
	@Test
	public void DataSourceTest() throws SQLException{
		DataSource ds = ctx.getBean("dataSource",DataSource.class);
		Connection conn = ds.getConnection();
		String sql = "select * from list_rank where `cn` like '%最%'";
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()){
			System.out.println(rs.getString("cn"));
		}
		conn.close();
	}
	
	@Test
	public void addUser() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		dao. createUser("123","123",true,"man",true,"AVG");
	}
	
	@Test
	public void findUser() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		User user = dao.findUserByName("test003");
		
		System.out.println(user.getLike());
	}
	
	@Test
	public void rank() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		List list = dao. showRank();
		Map map = new HashMap();
		
		System.out.println(list.toString().substring(1,list.toString().length()-1));
	}
	
	@Test
	public void recommend() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);

		String str = "AAG,STG,ACT,FTG,ARPG,SIM,SPG";
		int temp = 0;
		int temp2 = 0;
		temp = str.indexOf(",");
		String sub = str.substring(0,temp);
		System.out.println(sub);
		temp2 = str.indexOf(",",temp+1);
		String sub2 = str.substring(temp+1, temp2);
		System.out.println(sub2);
		while(true){
			
			temp = str.indexOf(",",temp2+1);
			if(temp==-1){
				break;
			}
			sub = str.substring(temp2+1,temp);
			System.out.println(sub);
			temp2 = str.indexOf(",",temp+1);
			if(temp2==-1){
				break;
			}
			sub2 = str.substring(temp+1, temp2);
			System.out.println(sub2);
			
		}
		
		System.out.println(dao.recommend2("AAG"));
	}
	
	@Test
	public void game() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		
		Map map = new HashMap();
		map = dao. showGame(1);
		System.out.println(map);
	}
	
	@Test
	public void search() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		String str = "最";
		Map<String,String> map = new HashMap();
		List list = dao. search1(str,2);
		System.out.println(list);
	}
	
	@Test
	public void comment() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		String str = "E";
		Map<String,String> map = new HashMap();
		List list = dao. showComment(1);
		System.out.println(list);
	}
	@Test
	public void findDebugId() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		int i = dao.findDebugId();
		
		System.out.println(i);
	}
	@Test
	public void showAllBug() throws SQLException{
		AdminDao dao = ctx.getBean("adminDao",AdminDao.class);
		List i = dao.showAllBug();
		
		System.out.println(i);
	}
}
