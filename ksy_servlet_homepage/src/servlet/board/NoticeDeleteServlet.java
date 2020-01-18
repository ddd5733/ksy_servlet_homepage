package servlet.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice_DAO;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/NoticeDeleteServlet")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		Notice_DAO dao = new Notice_DAO();
		String notice_no = request.getParameter("t_noticeNo");
		String query =	" delete from A06_TRACK2_TRAVEL_NOTICE "+
						" where notice_no = '"+notice_no+"' ";
		int result = dao.updateNotice(query);
		String url ="";
		String msg ="";
		if(result > 0) {
			 url ="/Index";
			 msg ="Notice 削除成功";
		} else {
			url ="/Index";
			msg ="노티스削除실패";
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		RequestDispatcher rdq = request.getRequestDispatcher("/common/view_messageAlert2.jsp");
		rdq.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
