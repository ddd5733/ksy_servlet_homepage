package servlet.member;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import dao.Member_DAO;

/**
 * Servlet implementation class MemberInfoChange
 */
@WebServlet("/MemberInfoChange")
public class MemberInfoChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member_DAO dao = new Member_DAO();
		String pw_checkbox = request.getParameter("t_cpCheck");
		String id = request.getParameter("t_id");
		String pw = request.getParameter("t_pw");
		String nickname = request.getParameter("t_nname");
		String adress = request.getParameter("t_adress");
		String phone1 = request.getParameter("t_phone1");
		String phone2 = request.getParameter("t_phone2");
		String phone3 = request.getParameter("t_phone3");
		String email1 = request.getParameter("t_email1");
		String email2 = request.getParameter("t_email2");
		String query = "";
		String msg = "";
		String url = "";
		String work = "";
		
		if(pw_checkbox == null) {
			query =	" update A06_TRACK2_TRAVEL_member set nickname ='"+nickname+"', "+
					" adress = '"+adress+"', phone1 = '"+phone1+"', "+
					" phone2 = '"+phone2+"', phone3 = '"+phone3+"', "+
					" email1 = '"+email1+"', email2 = '"+email2+"' "+
					" where id = '"+id+"' ";
		} else {
			try {
				pw=CommonUtil.encryptSHA256(pw);
			}catch(NoSuchAlgorithmException n) {
				
			}
			query =	" update A06_TRACK2_TRAVEL_member set nickname ='"+nickname+"', "+
					" adress = '"+adress+"', phone1 = '"+phone1+"', "+
					" phone2 = '"+phone2+"', phone3 = '"+phone3+"', "+
					" email1 = '"+email1+"', email2 = '"+email2+"' , pw = '"+pw+"' "+
					" where id = '"+id+"' ";
		}
		System.out.println(query);
		int result = dao.memberInsertUpdateDelete(query);		
		if(result >0) {
			msg = "saved your information";
			url = "/Index";
		} else {
			work ="goif";
			request.setAttribute("t_work", work);
			msg = "会員登録に失敗されました";
			url = "/HubServlet";
			
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		RequestDispatcher rdq = request.getRequestDispatcher("/common/view_messageAlert3.jsp");
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
