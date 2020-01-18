package dao;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnectionOracle;
import dto.Member_DTO;

	public class Member_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection 		   con    = null;
	PreparedStatement  ps 	  = null;
	ResultSet 		   rs 	  = null;
	
	
	public Member_DTO getMyinfo(String idd){
		Member_DTO dto =null;
		String query =  " select id,pw,name,nickname,adress,phone1,phone2,phone3, "+
						" email1,email2,sex,status,reg_date  "+
						" from A06_TRACK2_TRAVEL_MEMBER "+
						" where id ='"+idd+"' ";
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String nickname = rs.getString(4);
			String adress = rs.getString(5);
			String phone1 = rs.getString(6);
			String phone2 = rs.getString(7);
			String phone3 = rs.getString(8);
			String email1 = rs.getString(9);
			String email2 = rs.getString(10);
			String sex = rs.getString(11);
			String status = rs.getString(12);
			String reg_date = rs.getString(13);
			dto = new Member_DTO(id,pw,name,nickname,adress,phone1,phone2,phone3,email1,email2,sex,status,reg_date);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException getCheckCount():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception getCheckCount():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("getCheckCount close"+e.getMessage());
		}
	}
		return dto;
	}
	
	


	//회원가입
	public int memberInsertUpdateDelete(String query){
		int result =0; 

		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println("SQLException memberInsertUpdateDelete():"+se.getMessage());
		}catch(Exception e) {
			System.out.println("Exception memberInsertUpdateDelete():"+e.getMessage());
		}finally {
			try {
				common.close(con, ps, rs);
			}catch (Exception e) {
				System.out.println("memberInsertUpdateDelete() close"+e.getMessage());
			}
		}
		
		return result;
	}
	
	
	
	//id 중복검사
	public String getCheckCount(String id){
		String query = " select count(*) from A06_TRACK2_TRAVEL_MEMBER "+
						" where id ='"+id+"' ";
		String result ="";
	
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getString(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException getCheckCount():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception getCheckCount():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("getCheckCount close"+e.getMessage());
		}
	}
		return result;
	}
	//닉네임 중복검사
	public String getNickCount(String nickname){
		String query = " select count(*) from A06_TRACK2_TRAVEL_MEMBER "+
						" where nickname ='"+nickname+"' ";
		String result ="";
	
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getString(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException getCheckCount():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception getCheckCount():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("getCheckCount close"+e.getMessage());
		}
	}
		return result;
	}
	
	//닉네임 중복검사
	public int getNickCountA(String nickname){
		String query = " select count(*) from A06_TRACK2_TRAVEL_MEMBER "+
						" where nickname ='"+nickname+"' ";
		int result = 0;
	
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getInt(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException getNickCountA():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception getNickCountA():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("getNickCountA close"+e.getMessage());
		}
	}
		return result;
	}
	

	//네임 받아오기
	public String checkLogin(String id, String pw){
	String	query  = " select name from A06_TRACK2_TRAVEL_MEMBER "+
					 " where id ='"+id+"' "+
					 " and pw = '"+pw+"' "+
					 " and status ='y' ";
		String result = null;
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getString(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException checkLogin():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception checkLogin():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("checkLogin close"+e.getMessage());
		}
	}
		return result;
	}
	public int getCheckInfo(String id, String email1, String email2){
		String query =  " select count(*) from A06_TRACK2_TRAVEL_MEMBER "+
						" where id ='"+id+"' "+
						" and email1 ='"+email1+"' "+
						" and email2 ='"+email2+"' ";
		int result = 0;
	
	try {
		con = common.getConnection();
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
	while(rs.next()) {
			result = rs.getInt(1);
		}
		
	}catch(SQLException se) {
		System.out.println("SQLException getNickCountA():"+se.getMessage());
	}catch(Exception e) {
		System.out.println("Exception getNickCountA():"+e.getMessage());
	} finally{
		try{
			common.close(con, ps ,rs);
		}catch (Exception e){
				System.out.println("getNickCountA close"+e.getMessage());
		}
	}
		return result;
	}
	
	public String randomPw(String id) {
		int randomPword = (int) (Math.random()*999);
		
		return Integer.toString(randomPword);
	}

	
}


