package dao;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnectionOracle;
import dto.Faq_DTO;

	public class Faq_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection 		   con    = null;
	PreparedStatement  ps 	  = null;
	ResultSet 		   rs 	  = null;
	
	

	
	


	public int faqUpdate(String query){
		int result =0; 

		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println("SQLException faqUpdate():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception faqUpdate():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("faqUpdate() close"+e.getMessage());
			}
		}
		
		return result;
	}
	


	public String getFnumber() {
			String query = "select max(f_number) from A06_TRACK2_TRAVEL_FAQ ";
			String result = null;
			String f_number ="";
			try {
				con = common.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					result = rs.getString(1);
				}
			}catch(SQLException se) {
				System.out.println("SQLException getMaxNo():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getMaxNo():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getMaxNo() close"+e.getMessage());
				}
			}
			if(result == null) {
				f_number = "0001";
			} else {
				int mf_number = Integer.parseInt(result);
				f_number = Integer.toString(mf_number+1);
			}
			return f_number;
	}
	public ArrayList<Faq_DTO> getFaqList(String selValue, String txtValue){
		ArrayList<Faq_DTO> dtos = new ArrayList<Faq_DTO>();
		String query =	" select f_number,title,answer,reg_date,reg_id,update_date "+
						" from A06_TRACK2_TRAVEL_FAQ "+
						" where "+selValue+" like '%"+txtValue+"%' "+
						" order by f_number desc ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
		while(rs.next()) {
			String f_number = rs.getString(1);
			String title = rs.getString(2);
			String answer = rs.getString(3);
			String reg_date = rs.getString(4);
			String reg_id = rs.getString(5);
			String update_date = rs.getString(6);
			Faq_DTO dto = new Faq_DTO(f_number,title,answer,reg_date,reg_id,update_date);
			dtos.add(dto);
		}
				
			}catch(SQLException se) {
				System.out.println("SQLException getFaqList():"+se.getMessage());
			}catch(Exception e) {
				System.out.println("Exception getFaqList():"+e.getMessage());
			}finally {
				try {
					common.close(con, ps, rs);
				}catch (Exception e) {
					System.out.println("getFaqList() close"+e.getMessage());
				}
			}
		System.out.println(query);
		return dtos;
	}



	public int igal() {
		String query = "select count(f_number) from A06_TRACK2_TRAVEL_FAQ ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException se) {
			System.out.println("SQLException igal():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception igal():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getMaxNo() close"+e.getMessage());
			}
		}
		
		return result;
	}

	public Faq_DTO getMody(String f_num){
		Faq_DTO dto = null;
		String query =	" select f_number,title,answer,reg_date,reg_id,update_date "+
						" from A06_TRACK2_TRAVEL_FAQ "+
						" where f_number like '"+f_num+"' "+
						" order by f_number desc ";
		
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String f_number   		 = rs.getString(1);
				String title 	  		 = rs.getString(2);
				String answer 	   		 = rs.getString(3);
				String reg_date 	 	 = rs.getString(4);
				String reg_id   		 = rs.getString(5);
				String update_date   	 = rs.getString(6);
				
				dto = new Faq_DTO(f_number,title,answer,reg_date,reg_id,update_date);
			}
			
		}catch(SQLException se) {
			System.out.println("SQLException getMody():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception getMody():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("getView() close"+e.getMessage());
			}
		}
		return dto;
	}



	
}


