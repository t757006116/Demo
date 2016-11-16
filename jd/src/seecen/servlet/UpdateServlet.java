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
			//���ñ����ʽ
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
				//1.��������
				Class.forName("com.mysql.jdbc.Driver");
				//2.��������
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
				//3.������ִ��sql���Ķ���
				String sql = "update jd_user set  uname=?,"
						+ "upwd=?,uemail=? where uid=?";
				pstm = con.prepareStatement(sql);
				//��ֵ������Ӧ��ռλ��
				pstm.setString(1, name);
				pstm.setString(2, pwd);
				pstm.setString(3, email);
				pstm.setInt(4, id);
				//4.ִ��sql
				 pstm.executeUpdate();
			} catch (Exception e)
			{
				/*e.printStackTrace();*/
			}finally{
				try
				{
					//5.�ر����ӡ��ͷ���Դ
					
					if(pstm!=null)pstm.close();
					if(con!=null)con.close();
				} catch (SQLException e)
				{
					e.printStackTrace();
				}
			}
			//�޸ĺ�ص��û��б�
			response.sendRedirect("FindAll");
		}
}
