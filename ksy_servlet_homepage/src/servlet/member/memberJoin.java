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
 * Servlet implementation class memberJoin
 */
@WebServlet("/memberJoin")
public class memberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		
		Member_DAO dao =new Member_DAO();
		String id = request.getParameter("t_id");
		String pw = request.getParameter("t_pw");
		String name = request.getParameter("t_name");
		String nname = request.getParameter("t_nname");
		String adress = request.getParameter("t_adress");
		String phone1 = request.getParameter("t_phone1");
		String phone2 = request.getParameter("t_phone2");
		String phone3 = request.getParameter("t_phone3");
		String email1 = request.getParameter("t_email1");
		String email2 = request.getParameter("t_email2");
		String sex = request.getParameter("t_sex");
		String reg_date = CommonUtil.getToday();
		String msg = "";
		String url = "";
		String work = "";
		try {
			pw=CommonUtil.encryptSHA256(pw);
		}catch(NoSuchAlgorithmException n) {
			
		}
		
		String  query =	" insert into a06_track2_travel_member(id,pw,name,NICKNAME,adress,phone1, "+
						" phone2,phone3,email1,email2,sex,reg_date) "+
						" values('"+id+"','"+pw+"','"+name+"','"+nname+"','"+adress+"','"+phone1+"' , "+
						" '"+phone2+"','"+phone3+"','"+email1+"','"+email2+"','"+sex+"','"+reg_date+"' )";
				int result = dao.memberInsertUpdateDelete(query);
		if(result >0) {
			work ="gol";
			msg = name+"様会員登録おめでとうございます";
			url = "/Index";
		}else {
			request.setAttribute("tt_work", work);
			msg = "会員登録に失敗されました";
			url = "/Index";
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		RequestDispatcher rdq = request.getRequestDispatcher("/common/view_messageAlert.jsp");
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
