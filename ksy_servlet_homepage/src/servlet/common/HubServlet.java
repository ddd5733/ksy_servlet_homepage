package servlet.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class membernubServlet
 */
@WebServlet("/HubServlet")
public class HubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HubServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		

		String work =request.getParameter("t_work");
		RequestDispatcher dispatcher = null;
		if (work.equals("gol")) {
			dispatcher = request.getRequestDispatcher("/member/login.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("goi")) {
			dispatcher = request.getRequestDispatcher("/Index");
		 	dispatcher.forward(request,response);
		} else if (work.equals("goj")) {
			dispatcher = request.getRequestDispatcher("/member/join.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("goc")) {
			dispatcher = request.getRequestDispatcher("/company/company01.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gocw")) {
			dispatcher = request.getRequestDispatcher("/company/company02.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gorp")) {
			dispatcher = request.getRequestDispatcher("/recommend/recoPlace.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gorr")) {
			dispatcher = request.getRequestDispatcher("/recommend/recoRestaurant.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gofr")) {
			dispatcher = request.getRequestDispatcher("/FaqOpenList");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gofw")) {
			dispatcher = request.getRequestDispatcher("/board/faq/faq_w.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gont")) {
			dispatcher = request.getRequestDispatcher("/NoticeList");
		 	dispatcher.forward(request,response);
		}  else if (work.equals("gonw")) {
			dispatcher = request.getRequestDispatcher("/board/notice/notice_w.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("golo")) {
			dispatcher = request.getRequestDispatcher("/memberLogout");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gonv")) {
			dispatcher = request.getRequestDispatcher("/board/notice/notice_v.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("goif")) {
			dispatcher = request.getRequestDispatcher("/member/myinfo.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("gops")) {
			dispatcher = request.getRequestDispatcher("/member/sendMail.jsp");
		 	dispatcher.forward(request,response);
		} else if (work.equals("goer")) {
			dispatcher = request.getRequestDispatcher("/EventList");
		 	dispatcher.forward(request,response);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
