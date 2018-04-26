package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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
		User user = dao.findUserByName("test");
		System.out.println(user);
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
		List list = dao.recommend("");
		Map map = new HashMap();
		
		System.out.println(list.toString());
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
}
