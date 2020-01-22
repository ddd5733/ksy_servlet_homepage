package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member_DAO;


/**
 * Servlet implementation class MailSand
 */
@WebServlet("/MailSand")
public class MailSand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Member_DAO dao = new Member_DAO();
		String emial1 = (String)request.getAttribute("t_email1");
		String emial2 = (String)request.getAttribute("t_email2");
		String id = (String)request.getAttribute("t_id");
		String newPw = dao.randomPw(id);
		//newPw = "123";
		String pw ="";
		try{
			pw = CommonUtil.encryptSHA256(newPw);
		}catch(NoSuchAlgorithmException n) {
			
		}
		String  query =	" update a06_track2_travel_member "+
						" set pw ='"+pw+"' where id ='"+id+"' ";
		System.out.println(query);
		
		int result = dao.memberInsertUpdateDelete(query);
		System.out.println(result);
		if(result>0) {
			String from = "tjddyd5733@naver.com"; // 보내는
			String to = emial1+"@"+emial2; // 받는
			String subject = "New PassWord";
			String content = 
			"<table border='0' > "+
				"<tr> "+
				"	<td>Your new Password: "+newPw+" </td>"+
				"</tr> "+
			"</table> ";
	
			// SMTP 서버에 접속하기 위한 정보들
			Properties p = new Properties(); // 정보를 담을 객체
			p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
			p.put("mail.smtp.port", "465"); 
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP 서버에 접속하기 위한 정보들
			 
			 
			try{
				Authenticator auth = new SMTPAuthenticatior();
				Session ses = Session.getInstance(p, auth);
				 
				ses.setDebug(true);
				 
				MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				msg.setSubject(subject); // 제목
				 
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 보내는 사람
				 
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
				 
				msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
				 
				Transport.send(msg); // 전송
			} catch(Exception e){
				e.printStackTrace();
				out.println("<script>alert('Send Mail Failed..');history.back();</script>");
				// 오류 발생시 뒤로 돌아가도록
				return;
			}
			 
			out.println("<script>");
			out.println("alert('Send Mail Success!!');");
			out.println("window.close();");
			out.println("</script>");
		}  else {
			out.println("<script>");
			out.println("alert('Send Mail Failed!!');");
			out.println("window.close();");
			out.println("</script>");
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
