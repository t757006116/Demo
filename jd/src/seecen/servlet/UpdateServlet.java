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

public class UpdateServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{
			//设置编码格式
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			String idStr = request.getParameter("uid");
			int id = Integer.parseInt(idStr);
			String name = request.getParameter("uname");
			String pwd = request.getParameter("upwd");
			String email = request.getParameter("uemail");
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
				String sql = "update jd_user set  uname=?,"
						+ "upwd=?,uemail=? where uid=?";
				pstm = con.prepareStatement(sql);
				//将值放入相应的占位符
				pstm.setString(1, name);
				pstm.setString(2, pwd);
				pstm.setString(3, email);
				pstm.setInt(4, id);
				//4.执行sql
				 pstm.executeUpdate();
			} catch (Exception e)
			{
				/*e.printStackTrace();*/
			}finally{
				try
				{
					//5.关闭连接。释放资源
					
					if(pstm!=null)pstm.close();
					if(con!=null)con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			//修改后回到用户列表
			response.sendRedirect("FindAll");
		}
}
