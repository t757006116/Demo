package seecen.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import seecen.po.User;




public class JDBC
{
	public static void main()
	{	String inputName = "admin";
		String inputPwd = "123";
		ResultSet rs =null;
		PreparedStatement pstm =null;
		Connection con = null;
		// TODO Auto-generated method stub
		try
		{	//��������
			Class.forName("com.mysql.jdbc.Driver");
			//��������
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			
			/*System.out.println(con);*/
			//3.������ִ��sql���Ķ���
			String sql = "select * form jd_user "+
						 " where uname= ? " + "and upwd = ?";
			pstm = con.prepareStatement(sql);
			//��ֵ������Ӧ��ռλ��
			pstm.setString(1, inputName);
			pstm.setString(2, inputPwd);
			//4.ִ��sql
			 rs = pstm.executeQuery();
			//�ж��Ƿ�����һ����¼
			if(rs.next()){
				User user = new User();
				user.setUid(rs.getInt("uid"));
				user.setUname(rs.getString("uname"));
				user.setUpwd(rs.getString("upwd"));
				user.setUemail(rs.getString("uemail"));
				/*	System.out.println(rs.getInt("uid"));
				System.out.println(rs.getString("uname"));
				System.out.println(rs.getString("upwd"));
				System.out.println(rs.getString("uemail"));*/
			}
		} catch (Exception e)
		{
			// TODO: handle exception
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
	}
}
