package servlet.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member_DAO;

/**
 * Servlet implementation class MyimfoNicknameCheck
 */
@WebServlet("/MyimfoNicknameCheck")
public class MyimfoNicknameCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyimfoNicknameCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member_DAO dao = new Member_DAO();
		String nickname = request.getParameter("nickname");
		String originalNick = request.getParameter("originalNick");
		int result = 0;
		String mesage ="";
		if(!nickname.equals(originalNick)) {
			mesage= "it is good nickname. ever.";
			result= dao.getNickCountA(nickname);
			if(result>0) {
				mesage= "it is wonderful one but u can't.";
				
			}else {
				mesage= "it is good nickname. ever.";
				
				if(nickname.length()>15) {
					mesage="it's too long bro.";
				} 
				
				if(nickname.equals("")) mesage="please enter your nickname.";
			}
			
			
			
			
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(mesage);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
