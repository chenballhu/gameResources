package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.UserDao;

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
		String sql = "insert into userInfo(name,password,permission,sex,is_adult,`like`)values('123','123',true,'ÄÐ',true,'AVG')";
		Statement st = conn.createStatement();
		int rs = st.executeUpdate(sql);
		
		conn.close();
	}
	
	@Test
	public void addUser() throws SQLException{
		UserDao dao = ctx.getBean("userDao",UserDao.class);
		dao. createUser("123","123",true,"man",true,"AVG");
	}
	

}
