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



public class LoginServlet extends HttpServlet{
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{	
			//设置编码格式
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			//获取页面提交表单信息
			String inputName = request.getParameter("uname");
			String inputPwd = request.getParameter("upwd");
			/*System.out.println(inputName+inputPwd);*/
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
			String sql = "select * from jd_user "+
						 " where uname=? and upwd=?";
			pstm = con.prepareStatement(sql);
			//将值放入相应的占位符
			pstm.setString(1, inputName);
			pstm.setString(2, inputPwd);
			//4.执行sql
			 rs = pstm.executeQuery();
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
			if(user!=null){
				request.setAttribute("msg", true);
				//request.setAttribute("user", user);
				//将用户信息方法Session
				request.getSession().setAttribute("user", user);
			}else{
				request.setAttribute("msg", false);
			}
				//
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		
}
