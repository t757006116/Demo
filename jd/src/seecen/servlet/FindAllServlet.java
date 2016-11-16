package seecen.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seecen.po.User;

public class FindAllServlet extends HttpServlet{
			@Override
			protected void service(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException
			{
				ResultSet rs =null;
				PreparedStatement pstm =null;
				Connection con = null;
				User user = null;
				//存放所有的用户信息的集合
				ArrayList<User> users = new ArrayList();
				
			try
			{
				//1.创建驱动
				Class.forName("com.mysql.jdbc.Driver");
				//2.创建连接
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
				//3.创建可执行sql语句的对象
				String sql = "select * from jd_user";
				pstm = con.prepareStatement(sql);

				//4.执行sql
				 rs = pstm.executeQuery();
				 while (rs.next())
				{
					 user= new User();
					 user.setUid(rs.getInt("uid"));
					 user.setUname(rs.getString("uname"));
				 	 user.setUpwd(rs.getString("upwd"));
				 	 user.setUemail(rs.getString("uemail"));
				 	 //把数据放入集合中
				 	 users.add(user);
				} 
			} catch (Exception e)
			{
				e.printStackTrace();
			}finally{
				try
				{
					//5.关闭连接。释放资源
					if(rs!=null)rs.close();
					if(pstm!=null)pstm.close();
					if(con!=null)con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			//将users传到页面
			request.setAttribute("users", users);
			//跳转到list.jsp
			request.getRequestDispatcher("list.jsp").forward(request, response);
			}
}
