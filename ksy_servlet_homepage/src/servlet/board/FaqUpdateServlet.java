package servlet.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import dao.Faq_DAO;
import dto.Faq_DTO;

/**
 * Servlet implementation class FaqUpdateServlet
 */
@WebServlet("/FaqUpdateServlet")
public class FaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		
		Faq_DAO dao = new Faq_DAO();
		Faq_DTO dto = null;
		String msg = "";
		String url = "";
		String query ="";
		String f_number ="";
		String reg_id ="";
		String reg_date ="";
		String title ="";
		String answer ="";
		int result =0;
		RequestDispatcher rdq = null;
		String work = request.getParameter("t_work");
		if(work.equals("save")){
			f_number =dao.getFnumber();
			reg_id = request.getParameter("t_reg_id");
			reg_date = CommonUtil.getToday();
			title = request.getParameter("t_title");
			answer = request.getParameter("t_contents");
			query =	" insert into A06_TRACK2_TRAVEL_FAQ(f_number,title,answer,reg_date,reg_id) "+
							" values('"+f_number+"','"+title+"','"+answer+"','"+reg_date+"','"+reg_id+"' )";
				result = dao.faqUpdate(query);
			if(result >0) {
				msg = " FAQが登録されました。";
				url = "/Index";
			}else {
				msg = " FAQの登録に失敗しました。";
				url = "/Index";
			}
		} else if (work.equals("up")){
			f_number = request.getParameter("t_f_number");
			dto = dao.getMody(f_number);
			request.setAttribute("t_dto", dto);
			rdq = request.getRequestDispatcher("/board/faq/faq_u.jsp");
			rdq.forward(request, response);
		} else if (work.equals("del")){
			f_number = request.getParameter("t_f_number");
			query =	" delete from A06_TRACK2_TRAVEL_FAQ "+
					" where f_number = '"+f_number+"' ";
			result = dao.faqUpdate(query);
			if(result >0) {
				msg = " FAQが削除されました。";
				url = "/Index";
			}else {
				msg = "FAQ削除されていません。";
				url = "/Index";
			}
		} else if (work.equals("comUp")){
			f_number = request.getParameter("t_f_number");
			title = request.getParameter("t_title");
			answer = request.getParameter("t_contents");
			String updateDate = CommonUtil.getToday();
			query =	" update A06_TRACK2_TRAVEL_FAQ set title ='"+title+"', "+
					" answer = '"+answer+"', update_date = '"+updateDate+"' "+
					" where f_number = '"+f_number+"' ";
			result = dao.faqUpdate(query);
			if(result >0) {
				msg = " FAQの修正が完了しました。";
				url = "/Index";
			}else {
				msg = "FAQの修正に失敗しました。";
				url = "/Index";
			}
		}
		
		
		
		
		
		
		if(!work.equals("up")){
			request.setAttribute("t_msg", msg);
			request.setAttribute("t_url", url);
			rdq = request.getRequestDispatcher("/common/view_messageAlert2.jsp");
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
