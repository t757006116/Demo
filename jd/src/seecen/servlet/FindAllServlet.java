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
				//������е��û���Ϣ�ļ���
				ArrayList<User> users = new ArrayList();
				
			try
			{
				//1.��������
				Class.forName("com.mysql.jdbc.Driver");
				//2.��������
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
				//3.������ִ��sql���Ķ���
				String sql = "select * from jd_user";
				pstm = con.prepareStatement(sql);

				//4.ִ��sql
				 rs = pstm.executeQuery();
				 while (rs.next())
				{
					 user= new User();
					 user.setUid(rs.getInt("uid"));
					 user.setUname(rs.getString("uname"));
				 	 user.setUpwd(rs.getString("upwd"));
				 	 user.setUemail(rs.getString("uemail"));
				 	 //�����ݷ��뼯����
				 	 users.add(user);
				} 
			} catch (Exception e)
			{
				e.printStackTrace();
			}finally{
				try
				{
					//5.�ر����ӡ��ͷ���Դ
					if(rs!=null)rs.close();
					if(pstm!=null)pstm.close();
					if(con!=null)con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			//��users����ҳ��
			request.setAttribute("users", users);
			//��ת��list.jsp
			request.getRequestDispatcher("list.jsp").forward(request, response);
			}
}
