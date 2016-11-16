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


public class DelServlet extends HttpServlet{
			@Override
			protected void service(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException
			{
				//获取需要删除的用户
				String idStr = request.getParameter("uid");
				/*System.out.println(idStr);*/
				//将String类型转成int类型
				int id = Integer.parseInt(idStr);
				ResultSet rs =null;
				PreparedStatement pstm =null;
				Connection con = null;
				
				try
				{
					//1.创建驱动
					Class.forName("com.mysql.jdbc.Driver");
					//2.创建连接
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
					//3.创建可执行sql语句的对象
					String sql = "Delete from jd_user where uid =?";
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, id);
					pstm.executeUpdate();
					
				} catch (Exception e)
				{
					e.printStackTrace();
				}finally{
					try
					{
						//5.关闭连接。释放资源
						if(pstm!=null)pstm.close();
						if(con!=null)con.close();
					} catch (Exception e2)
					{
						
					}
				}
				//删除后回到用户列表
				response.sendRedirect("FindAll");
			}
}
