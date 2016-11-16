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
		{	//创建驱动
			Class.forName("com.mysql.jdbc.Driver");
			//创建连接
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			
			/*System.out.println(con);*/
			//3.创建可执行sql语句的对象
			String sql = "select * form jd_user "+
						 " where uname= ? " + "and upwd = ?";
			pstm = con.prepareStatement(sql);
			//将值放入相应的占位符
			pstm.setString(1, inputName);
			pstm.setString(2, inputPwd);
			//4.执行sql
			 rs = pstm.executeQuery();
			//判断是否有下一条记录
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
				//5.关闭连接。释放资源
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
