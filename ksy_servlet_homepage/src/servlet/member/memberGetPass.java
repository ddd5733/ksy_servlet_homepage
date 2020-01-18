package servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member_DAO;
import dto.Member_DTO;

/**
 * Servlet implementation class memberGetPass
 */
@WebServlet("/memberGetPass")
public class memberGetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberGetPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		
		Member_DAO dao = new Member_DAO();
		RequestDispatcher dispatcher  =null;
		String id = request.getParameter("t_id");
		String email1 =  request.getParameter("t_email1");
		String email2 =  request.getParameter("t_email2");
		int check = dao.getCheckInfo(id,email1,email2);
		if(check > 0) {
			request.setAttribute("t_id", id);
			request.setAttribute("t_email1", email1);
			request.setAttribute("t_email2", email2);
			dispatcher = request.getRequestDispatcher("/MailSand");
		 	dispatcher.forward(request,response);
		}else {
			String msg = "We can't find your Infomation";
			String url = "/member/sendMail.jsp";
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", url);
			dispatcher = request.getRequestDispatcher("/common/view_messageAlert.jsp");
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
