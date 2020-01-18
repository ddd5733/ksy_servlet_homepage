package servlet.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice_DAO;
import dto.Notice_DTO;

/**
 * Servlet implementation class OpenNoticeV
 */
@WebServlet("/OpenNoticeV")
public class OpenNoticeV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenNoticeV() {
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
		Notice_DTO dto = dao.getNoticeView(notice_no);
		String work = request.getParameter("t_work");
		RequestDispatcher rdq = null;
		request.setAttribute("t_dto", dto);
		if(work.equals("gonu")) {
			rdq = request.getRequestDispatcher("/board/notice/notice_u.jsp");
			rdq.forward(request, response);
		} else if (work.equals("gov")) {
			int a = dao.noticeHit(notice_no);
			rdq = request.getRequestDispatcher("/board/notice/notice_v.jsp");
			rdq.forward(request, response);
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
