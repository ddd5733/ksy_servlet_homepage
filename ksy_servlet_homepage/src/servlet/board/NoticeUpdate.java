package servlet.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import common.CommonUtil;
import dao.Notice_DAO;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/NoticeUpdate")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String session_level = (String)session.getAttribute("session_level");
		int sizeLimit 		= 1024*1024*5;
		String file_dir     = CommonUtil.file_dir_notice;
		MultipartRequest mpr = new MultipartRequest(request, file_dir, sizeLimit, "UTF-8");
		String gubun =  mpr.getParameter("t_gubun");
		String notice_no ="";
		String query="";
		String msg ="";
		String url	="";
		String fileName 	= "";
		RequestDispatcher rdq = null;
		String saveFileName = "";
		String	title  = "";
		String reg_id = "";
		int result =0;
		String reg_date = "";
		String content = "";
		String work ="";
		String delFile = "";
		String update_date ="";
		Notice_DAO dao = new Notice_DAO();
			if(session_level == null) {
				url ="/Index";
				msg ="ログイン情報が完了しました。";
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", url);
				rdq = request.getRequestDispatcher("/common/view_messageAlert2.jsp");
				rdq.forward(request, response);
			} 
			
				if(gubun.equals("save")) {
					notice_no = dao.getNoticeNo();
					title = mpr.getParameter("t_title");
					content = mpr.getParameter("t_contents");
					reg_id = session_level;
					reg_date =  CommonUtil.getToday();
					fileName = mpr.getFilesystemName("t_file");
					if(fileName != null){
						File oldFile = new File(file_dir,fileName);
						File newFile = new File(file_dir,notice_no+"-"+fileName);
						oldFile.renameTo(newFile);
						saveFileName = newFile.getName();
					}	
					query = " insert into a06_track2_travel_notice(notice_no,title,content,reg_id,reg_date,file_name_1) "+
							" values('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"','"+saveFileName+"') ";
					result = dao.updateNotice(query);
					if(result > 0) {
						 url ="/Index";
						 msg ="노티스 등록성공";
					} else {
						 url ="/HubServlet";
						 msg ="노티스등록실패";
						 work="gonw";
						 request.setAttribute("t_work", work);
					}
			} else if (gubun.equals("update")) {
				notice_no = mpr.getParameter("t_noticeNo");
				title = mpr.getParameter("t_title");
				content = mpr.getParameter("t_contents");
				update_date = CommonUtil.getToday();
				fileName = mpr.getFilesystemName("t_file");
				delFile = CommonUtil.checkNull(mpr.getParameter("checkBox_del_fileName"));  //삭제시킬 파일명
				if(!delFile.equals("")){ //checkbox에 삭제할 파일이 있다
					File dFa = new File(file_dir, delFile);
					dFa.delete();
				} else {
					saveFileName   = mpr.getParameter("ori_fileName_a");
				}
				
				if(fileName != null){
					String delFile_1 = mpr.getParameter("ori_fileName_a");
					if(delFile_1 != null){
						File dFa = new File(file_dir, delFile_1);
						dFa.delete();
					}
					File oldFile = new File(file_dir, fileName);
					File newFile = new File(file_dir, notice_no+"-"+fileName);
					oldFile.renameTo(newFile);
					saveFileName = newFile.getName();
				}
				
				String fileDelete = mpr.getParameter("t_fileName");
				
				if(fileDelete != null){
						File dFa = new File(file_dir,fileDelete);
						dFa.delete();
				}
				
				query = " update a06_track2_travel_notice set title ='"+title+"', content ='"+content+"', "+
					    " update_date='"+update_date+"', file_name_1 = '"+saveFileName+"' "+
					    " where notice_no = '"+notice_no+"' ";
				System.out.println(query);
				result = dao.updateNotice(query);
				if(result > 0) {
					 url ="/Index";
					 msg ="Notice Modify Completed";
				} else {
					 url ="/Index";
					 msg ="Notice Modify Can't Process";
				}
			}
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", url);
				rdq = request.getRequestDispatcher("/common/view_messageAlert3.jsp");
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
