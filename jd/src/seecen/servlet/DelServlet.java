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
				//��ȡ��Ҫɾ�����û�
				String idStr = request.getParameter("uid");
				/*System.out.println(idStr);*/
				//��String����ת��int����
				int id = Integer.parseInt(idStr);
				ResultSet rs =null;
				PreparedStatement pstm =null;
				Connection con = null;
				
				try
				{
					//1.��������
					Class.forName("com.mysql.jdbc.Driver");
					//2.��������
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
					//3.������ִ��sql���Ķ���
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
						//5.�ر����ӡ��ͷ���Դ
						if(pstm!=null)pstm.close();
						if(con!=null)con.close();
					} catch (Exception e2)
					{
						
					}
				}
				//ɾ����ص��û��б�
				response.sendRedirect("FindAll");
			}
}
