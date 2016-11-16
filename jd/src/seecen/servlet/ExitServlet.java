package seecen.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExitServlet extends HttpServlet{
			@Override
			protected void service(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException
			{
				//获取session对象
				HttpSession session = request.getSession();
				//将session对象的user删除
				session.removeAttribute("user");
				//转发到index.jsp页面
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
}
