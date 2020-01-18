package dto;

public class Faq_DTO {
	public Faq_DTO(String f_number, String title, String answer, String reg_date, String reg_id, String update_date) {
		super();
		this.f_number = f_number;
		this.title = title;
		this.answer = answer;
		this.reg_date = reg_date;
		this.reg_id = reg_id;
		this.update_date = update_date;
	}

	String f_number, title, answer, reg_date, reg_id, update_date;

	public String getF_number() {
		return f_number;
	}

	public void setF_number(String f_number) {
		this.f_number = f_number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
	
}