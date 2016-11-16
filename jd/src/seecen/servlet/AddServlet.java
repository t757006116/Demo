package seecen.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seecen.po.User;


public class AddServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{
			String inputName = request.getParameter("uname");
			String inputPwd = request.getParameter("upwd");
			String inputEmail = request.getParameter("uemail");
			
			System.out.println(inputName);
			System.out.println(inputPwd);
			System.out.println(inputEmail);
			
			ResultSet rs =null;
			PreparedStatement pstm =null;
			Connection con = null;
			User user = null;
			
		try
		{
			//1.创建驱动
			Class.forName("com.mysql.jdbc.Driver");
			//2.创建连接
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			//3.创建可执行sql语句的对象
			String sql = "insert into jd_user(uname,upwd,uemail)"+
						 "value(?,?,?)";
			pstm = con.prepareStatement(sql);
			//将值放入相应的占位符
			pstm.setString(1, inputName);
			pstm.setString(2, inputPwd);
			pstm.setString(3, inputEmail);
			//4.执行sql
			 pstm.executeUpdate();
			 if (rs.next())
			{
				 user= new User();
				 user.setUid(rs.getInt("uid"));
				 user.setUname(rs.getString("uname"));
			 	 user.setUpwd(rs.getString("upwd"));
			 	 user.setUemail(rs.getString("uemail"));
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
		//转发到FindAll
		/*request.getRequestDispatcher("FindAll").forward(request, response);*/
		response.sendRedirect("FindAll");
		}
}
