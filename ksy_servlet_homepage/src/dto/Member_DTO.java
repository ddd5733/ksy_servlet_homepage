package dto;

public class Member_DTO {
	public Member_DTO(String id, String pw, String name, String nickname, String adress, String phone1, String phone2,
			String phone3, String email_1, String email_2, String sex, String status, String reg_date) {
		
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.adress = adress;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email_1 = email_1;
		this.email_2 = email_2;
		this.sex = sex;
		this.status = status;
		this.reg_date = reg_date;
	}

	String id,pw,name,nickname,adress,phone1,phone2,phone3,
	email_1,email_2,sex,status
	,reg_date;
	
	public Member_DTO(){}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getEmail_1() {
		return email_1;
	}

	public void setEmail_1(String email_1) {
		this.email_1 = email_1;
	}

	public String getEmail_2() {
		return email_2;
	}

	public void setEmail_2(String email_2) {
		this.email_2 = email_2;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
}